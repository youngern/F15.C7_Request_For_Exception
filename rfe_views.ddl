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
  status_type String(30);
  auto_comment String(4000);
begin
  update F15C7RFE set explanation = :new.explanation and alt_protections = :new.explanation
  where rfe_id = :new.rfe_id;
  --select status_code into status from F15C7STATCODE where RFE_STATUS = 'Entered';
  insert into F15C7Hist (F15C7RFE_rfe_id) values (:new.rfe_id);
  insert into F15C7Status (effective_date, F15C7Hist_history_id, F15C7StatCode_status_code,
                         F15C7RFE_rfe_id, F15C7Emp_employee_id)
                  values (localtimestamp, F15C7Hist_seq.currval, :new.F15C7StatCode_status_code, :new.rfe_id, v('P1_EMPLOYEE'));

  select rfe_status into status_type from F15C7Roles where status_code = :new.F15C7StatCode_status_code;
  case rfe_status
    WHEN 'Submitted'
      auto_comment = 'Request For Exception has been submitted.';
    WHEN 'Returned'
      auto_comment = 'Request For Exception has been returned.';
    WHEN 'Recalled'
      auto_comment = 'Request For Exception has been recalled.';
    WHEN 'SA Approved'
      auto_comment = 'Request For Exception has been approved by the system administrator.';
    WHEN 'LD Approval'
      auto_comment = 'Request For Exception has been approved by the lab director.';
    WHEN 'CH Approval'
      auto_comment = 'Request For Exception has been approved by the chairperson.';
    WHEN 'Final Approved'
      auto_comment = 'Request For Exception has been approved by the executive director.';
  case end;
  insert into F15C7Comments (comment_entry_date,comments, F15C7Emp_employee_id, F15C7RFE_RFE_ID)
         values (localtimestamp, :auto_comment, v('P1_EMPLOYEE'), :new.rfe_id);



end;
/
