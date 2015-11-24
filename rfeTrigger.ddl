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
    rollback;
    raise_application_error(-200001, 'Add approvers to lab!');

end;
/
/*
find what the current status is
depending on the role of current person switch status
requestor:
  if entered, requestor can see {submit}
  if submitted or approved (not final), requestor can see {recall}
  if returned or recalled, requestor can see {submit}

approvers
  approve anything that is submitted and below current level
  return anything
  reject anything

final approvers
  add date

if submitted, lab director can see (approve or
*/
