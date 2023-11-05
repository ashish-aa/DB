use db;

create table Stud(
Roll int primary key,
Att decimal(2,2),
Status char(2));

delimiter //

create procedure verification(in v_Roll int)
begin 
declare v_att int;

select Att into v_att from Stud where Stud.Roll = v_Roll;

if v_att< 75 then 
select "Term not Granted";
Update Stud set Status = 'D' where Roll = v_Roll;
else 
select "Term Granted";
Update Stud set Status = 'ND' where Roll = v_Roll;
end if;
end;
//
ALTER TABLE Stud MODIFY Att int;
//

insert into Stud(Roll,Att) values(1,75),(69,84),(68,34),(74,87);
//
select *from Stud;
//
call verification(68);


