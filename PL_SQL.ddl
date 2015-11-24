create or replace trigger create_RFE
after insert
on F15C7RFE
for each row
declare
  requestor number;
  system_admin_role  number;
  lab_director_role number;
  exec_director_role number;
  chair_person_role number;
  system_admin number;
  exec_director number;
  chairperson number;
  lab_director number;
  status number;
  rfe_id number;
begin
  --it would come from the page
  --check if all these exist
  rfe_id := :new.rfe_id;
  select status_code into status from F15C7STATCODE where RFE_STATUS = 'Entered';
  insert into F15C7Hist (F15C7RFE_rfe_id) values (rfe_id);
  insert into F15C7Status (effective_date, F15C7Hist_history_id, F15C7StatCode_status_code,
                         F15C7RFE_rfe_id, F15C7Emp_employee_id)
                  values (localtimestamp, F15C7Hist_seq.currval, status, rfe_id, v('P1_EMPLOYEE'));
  select role_code into requestor
  from F15C7ROLES where role_type = 'Requestor';
  select role_code into system_admin_role
  from F15C7ROLES where role_type = 'Sys Admin Approver';
  select role_code into lab_director_role
  from F15C7ROLES where role_type = 'Lab Director Approver';
  select role_code into exec_director_role
  from F15C7ROLES where role_type = 'Exec Dir Approver';
  select role_code into chair_person_role
  from F15C7ROLES where role_type = 'Chairperson Approver';

    select employee_id into system_admin
    from F15C7EMP where F15C7LABS_LAB_ID = v('P1_Labs') and system_admin_flag = 1
    and employee_status = 'A';
    select employee_id into lab_director
    from F15C7EMP where F15C7LABS_LAB_ID = v('P1_Labs') and lab_director_flag = 1
    and employee_status = 'A';
    select employee_id into exec_director
    from F15C7EMP where exec_director_flag = 1
    and employee_status = 'A';
    select employee_id into chairperson
    from F15C7EMP where chair_person_flag = 1
    and employee_status = 'A';

    insert into F15C7Contacts (effective_date, comments, F15C7EMP_employee_id, F15C7ROLES_ROLE_CODE, F15C7RFE_rfe_id)
    values (localtimestamp, '', v('P1_Employee'), requestor, rfe_id);
    insert into F15C7Approvers (effective_date, comments, F15C7EMP_employee_id, F15C7ROLES_ROLE_CODE, F15C7RFE_rfe_id)
    values (localtimestamp, '', system_admin, system_admin_role, rfe_id);
    insert into F15C7Approvers (effective_date, comments, F15C7EMP_employee_id, F15C7ROLES_ROLE_CODE, F15C7RFE_rfe_id)
    values (localtimestamp, '', lab_director, lab_director_role, rfe_id);
    insert into F15C7Approvers (effective_date, comments, F15C7EMP_employee_id, F15C7ROLES_ROLE_CODE, F15C7RFE_rfe_id)
    values (localtimestamp, '', exec_director, exec_director_role, rfe_id);
    insert into F15C7Approvers (effective_date, comments, F15C7EMP_employee_id, F15C7ROLES_ROLE_CODE, F15C7RFE_rfe_id)
    values (localtimestamp, '', chairperson, chair_person_role, rfe_id);
EXCEPTION
  when no_data_found then
    raise_application_error(-200001, 'Add approvers to lab!');

end;
/
--add task
ALTER TABLE F15C7Tasks DROP CONSTRAINT F15C7Tasks_F15C7RFE_FK;
ALTER TABLE F15C7Tasks ADD task_id integer;
ALTER TABLE F15C7Tasks Drop column F15C7RFE_rfe_id;
ALTER TABLE F15C7Tasks ADD CONSTRAINT F15C7Tasks_PK PRIMARY KEY ( task_id ) ;
CREATE TABLE F15C7TaskList
    (
      F15C7RFE_RFE_ID INTEGER NOT NULL ,
      F15C7Tasks_task_id INTEGER NOT NULL
    ) ;
ALTER TABLE F15C7TaskList ADD CONSTRAINT F15C7TaskList_F15C7RFE_FK FOREIGN KEY ( F15C7RFE_rfe_id ) REFERENCES F15C7RFE ( rfe_id ) ;
ALTER TABLE F15C7TaskList ADD CONSTRAINT F15C7TaskList_F15C7Tasks_FK FOREIGN KEY ( F15C7Tasks_task_id ) REFERENCES F15C7Tasks ( task_id ) ;

DROP SEQUENCE F15C7Tasks_seq ;
create sequence F15C7Tasks_seq
start with 100
increment by 1
nomaxvalue
;
DROP TRIGGER F15C7Tasks_PK_trig
;

create or replace trigger F15C7Tasks_PK_trig
before insert on F15C7Tasks
for each row
begin
select F15C7Tasks_seq.nextval into :new.task_id from dual;
end;
/


create or replace view TaskView
as
select task_id,
       task_abbreviation,
       task_description,
       effective_date,
       F15C7RFE_rfe_id
from F15C7Tasks join F15C7TaskList on F15C7Tasks_task_id = task_id;

create or replace trigger TaskView_Trigger
instead of insert on TaskView
before each row
begin
   insert into F15C7Tasks (
                           task_abbreviation,
                           task_description,
                           effective_date)
   values (:new.task_abbreviation, :new.task_description, :new.effective_date);
   insert into F15C7TaskList (F15C7Tasks_task_id, F15C7RFE_rfe_id)
   values (:new.task_id, :new.F15C7RFE_rfe_id);
end;
/
--drop trigger add_lab_director;
create or replace trigger add_approver
before insert
on F15C7EMP
for each row
declare
  count_lab_directors  number;
  count_sys_admins     number;
  count_exec_directors number;
  count_chair_persons  number;

  --current_seq         number;
begin
  --select F15C7EMP_SEQ.currVal into current_seq from dual;
  select count(*) into count_lab_directors
  from F15C7EMP where F15C7LABS_LAB_ID = :new.F15C7LABS_LAB_ID and LAB_DIRECTOR_FLAG = 1 and employee_status = 'A';
  select count(*) into count_sys_admins
  from F15C7EMP where F15C7LABS_LAB_ID = :new.F15C7LABS_LAB_ID and SYSTEM_ADMIN_FLAG = 1 and employee_status = 'A';
  select count(*) into count_exec_directors
  from F15C7EMP where EXEC_DIRECTOR_FLAG = 1 and employee_status = 'A';
  select count(*) into count_chair_persons
  from F15C7EMP where CHAIR_PERSON_FLAG = 1 and employee_status = 'A';

  if count_sys_admins > 0 and :new.system_admin_flag = 1 then
    raise_application_error(-20001, 'There is already a system admin for that lab.');
  elsif count_lab_directors > 0 and :new.lab_director_flag = 1 then
    raise_application_error(-20002, 'There is already a lab director for that lab.');
  elsif count_exec_directors > 0 and :new.exec_director_flag = 1 then
    raise_application_error(-20003, 'There is already an executive director.');
  elsif count_chair_persons > 0 and :new.chair_person_flag = 1 then
    raise_application_error(-20004, 'There is already a chairperson.');
  end if;
end;
/

create or replace trigger update_lab_director
for update of lab_director_flag
on F15C7EMP
COMPOUND TRIGGER
  TYPE lab_ids_table          IS TABLE OF NUMBER;
  TYPE lab_directors_table    IS TABLE OF NUMBER;
  TYPE lab_to_directors_table IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

  lab_ids                     lab_ids_table;
  lab_directors               lab_directors_table; --employee ids
  lab_to_directors            lab_to_directors_table;
  no_data_chk                 number := 0;
  BEFORE STATEMENT IS
    lab_id NUMBER;
    lab_director NUMBER;

  BEGIN
      select F15C7LABS_LAB_ID, EMPLOYEE_ID
      bulk collect into lab_ids, lab_directors
      from F15C7EMP
      where lab_director_flag = 1 and employee_status = 'A';

      for i in 1..lab_ids.count() loop
       lab_id := lab_ids(i);
       lab_director := lab_directors(i);
       lab_to_directors(lab_id) := lab_director;
      end loop;
    end before statement;

  before each row is
    lab_director number;
  begin
      lab_director := lab_to_directors(:new.F15C7LABS_LAB_ID);
      if :new.employee_id != lab_director AND :new.lab_director_flag = 1 then
       raise_application_error(-20001, 'There already exists a lab director for this lab!');
      end if;
    Exception
      when no_data_found then
        lab_director := 0;
  end before each row;
end;
/
create or replace trigger update_system_admin
for update of system_admin_flag
on F15C7EMP
COMPOUND TRIGGER
  TYPE lab_ids_table          IS TABLE OF NUMBER;
  TYPE system_admins_table    IS TABLE OF NUMBER;
  TYPE lab_to_sysadmins_table IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

  lab_ids                     lab_ids_table;
  system_admins               system_admins_table; --employee ids
  lab_to_sysadmins            lab_to_sysadmins_table;
  no_data_chk                 number := 0;
  BEFORE STATEMENT IS
    lab_id NUMBER;
    system_admin NUMBER;
  BEGIN
    select F15C7LABS_LAB_ID, EMPLOYEE_ID
    bulk collect into lab_ids, system_admins
    from F15C7EMP
    where system_admin_flag = 1 and employee_status = 'A';

    for i in 1..lab_ids.count() loop
       lab_id := lab_ids(i);
       system_admin := system_admins(i);
       lab_to_sysadmins(lab_id) := system_admin;
      end loop;
  end before statement;

  before each row is
    system_admin number;
  begin
    system_admin := lab_to_sysadmins(:new.F15C7LABS_LAB_ID);
    if :new.employee_id != system_admin AND :new.system_admin_flag = 1 then
      raise_application_error(-20001, 'There already exists a system admin for this lab!');
    end if;
  Exception
    when no_data_found then
      system_admin := 0;
  end before each row;
end;
/
create or replace trigger update_exec_director
for update of exec_director_flag
on F15C7EMP
COMPOUND TRIGGER
  active_exec_director         NUMBER;
     exec_director_count_chk   NUMBER;
  BEFORE STATEMENT IS

  BEGIN
    select count(*) into exec_director_count_chk
    from F15C7EMP
    where exec_director_flag = 1 and employee_status = 'A';

    if exec_director_count_chk > 1 then
      raise_application_error(-20002, 'Oops, there seems to be more than 1 executive director currently. Please fix error');
    end if;

    if exec_director_count_chk = 1 then
      select EMPLOYEE_ID into active_exec_director
      from F15C7EMP
      where exec_director_flag = 1 and employee_status = 'A';
    end if;
  end before statement;

  before each row is
  begin
    if exec_director_count_chk = 1 and :new.employee_id != active_exec_director AND :new.exec_director_flag = 1 then
      raise_application_error(-20001, 'There already exists an exec director!');
    end if;
  end before each row;
end;
/
create or replace trigger update_chair_person
for update of chair_person_flag
on F15C7EMP
COMPOUND TRIGGER
  active_chair_person         NUMBER;
    chair_person_count_chk   NUMBER;
  BEFORE STATEMENT IS

  BEGIN
    select count(*) into chair_person_count_chk
    from F15C7EMP
    where chair_person_flag = 1 and employee_status = 'A';

    if chair_person_count_chk > 1 then
      raise_application_error(-20002, 'Oops, there seems to be more than 1 chairperson currently. Please fix error');
    end if;

    if chair_person_count_chk = 1 then
      select EMPLOYEE_ID into active_chair_person
      from F15C7EMP
      where chair_person_flag = 1 and employee_status = 'A';
    end if;
  end before statement;

  before each row is
  begin
    if chair_person_count_chk = 1 and :new.employee_id != active_chair_person AND :new.chair_person_flag = 1 then
      raise_application_error(-20001, 'There already exists a chair person!');
    end if;
  end before each row;
end;
/
create or replace trigger top_level_approver
BEFORE INSERT OR UPDATE on F15C7EMP
for each row
BEGIN
  if :new.chair_person_flag = 1 and
    (:new.exec_director_flag = 1 or
     :new.lab_director_flag = 1 or
     :new.system_admin_flag = 1) then
     raise_application_error(-20005, 'Chairperson can only have one role.');
  elsif    :new.exec_director_flag = 1 and
          (:new.chair_person_flag = 1 or
           :new.lab_director_flag = 1 or
           :new.system_admin_flag = 1) then
     raise_application_error(-20006, 'Exec Director can only have one role.');
  end if;
END;
/
drop view RFE_VIEW;
create view RFE_VIEW
as
select
  rfe_id,
  explanation,
  alt_protections,
  approval_review_date,
  F15C7StatCode_status_code,
  s.effective_date,
  c.F15C7EMP_employee_id
FROM F15C7RFE
     join F15C7Contacts c on c.F15C7RFE_rfe_id = rfe_id
     join F15C7Status s on s.F15C7RFE_rfe_id = rfe_id
     join F15C7Roles r on c.F15C7Roles_role_code = r.role_code
     where s.effective_date in (select max(effective_date) from F15C7Status where F15C7RFE_rfe_id = rfe_id) and
     s.F15C7RFE_RFE_ID = rfe_id and
     role_type = 'Requestor';

create or replace RFE_TRIGGER
  instead of insert on RFE_VIEW
  for each row
begin
insert into F15C7RFE (explanation, alt_protections)
values (:new.explanation, :new.alt_protections);
end;
/

create or replace trigger RFE_UPDATE_TRIGGER
  instead of update on RFE_VIEW
  for each row
declare
  status_type varchar2(30);
  history number;
  auto_comment varchar2(4000);
  role varchar2(40);
begin
  update F15C7RFE set explanation = :new.explanation where rfe_id = :new.rfe_id;
  update F15C7RFE set alt_protections = :new.alt_protections where rfe_id = :new.rfe_id;
  select history_id into history from F15C7Hist where F15C7RFE_RFE_ID = :new.rfe_id;
  --select status_code into status from F15C7STATCODE where RFE_STATUS = 'Entered';
  --insert into F15C7Hist (F15C7RFE_rfe_id) values (:new.rfe_id);
  insert into F15C7Status (effective_date, F15C7Hist_history_id, F15C7StatCode_status_code,
                         F15C7RFE_rfe_id, F15C7Emp_employee_id)
                  values (localtimestamp, history, :new.F15C7StatCode_status_code, :new.rfe_id, v('P1_EMPLOYEE'));

  select rfe_status into status_type from F15C7STATCODE where status_code = :new.F15C7StatCode_status_code;

  case
    WHEN status_type = 'Submitted' then
      auto_comment := 'Request For Exception has been submitted.';
    WHEN status_type = 'Returned' then
      auto_comment := 'Request For Exception has been returned.';
    WHEN status_type = 'Recalled' then
      auto_comment := 'Request For Exception has been recalled.';
    WHEN status_type = 'SA Approved' then
      auto_comment := 'Request For Exception has been approved by the system administrator.';
    WHEN status_type = 'LD Approval' then
      auto_comment := 'Request For Exception has been approved by the lab director.';
    WHEN status_type = 'CH Approval' then
      auto_comment := 'Request For Exception has been approved by the chairperson.';
    WHEN status_type = 'Final Approved' then
      auto_comment := 'Request For Exception has been approved by the executive director.';
    else auto_comment := '';
  end case;
  insert into F15C7Comments (comment_entry_date,comments, F15C7Emp_employee_id, F15C7RFE_RFE_ID)
         values (localtimestamp, auto_comment, v('P1_EMPLOYEE'), :new.rfe_id);
end;
/
alter table F15C7Comments add comment_id integer;
ALTER TABLE F15C7Comments ADD CONSTRAINT F15C7Comments_PK PRIMARY KEY ( comment_id ) ;
DROP SEQUENCE F15C7Comments_seq ;
create sequence F15C7Comments_seq
start with 100
increment by 1
nomaxvalue
;

create or replace trigger F15C7Comments_PK_trig
before insert on F15C7Comments
for each row
begin
select F15C7Comments_seq.nextval into :new.comment_id from dual;
end;
/

create or replace trigger insert_comment_trigger

  
