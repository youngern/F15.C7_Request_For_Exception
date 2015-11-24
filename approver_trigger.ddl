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
