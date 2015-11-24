alter table F15C7Comments add comment_id integer;

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
