use db;

create table n_rollCall(
id int primary key,
name varchar(20),
rollCallDate Date);


create table o_rollCall(
id int primary key,
name varchar(20),
rollCallDate Date);


INSERT INTO n_rollCall (id, name, rollCallDate)
VALUES (1, 'Alice', '2023-11-01');

INSERT INTO o_rollCall (id, name, rollCallDate)
VALUES (2, 'Bob', '2023-11-01');

INSERT INTO o_rollCall (id, name, rollCallDate)
VALUES (3, 'Ashish', '2023-10-29');

INSERT INTO o_rollCall (id, name, rollCallDate)
VALUES (1, 'Alice', '2023-11-01');

delimiter //

create procedure mergeData()
begin
declare stud_id int;
declare stud_name varchar(20);
declare done int default 0;
declare roll_Date Date;

declare o_cursor cursor for 
select id,name,rollCallDate from o_rollCall;

declare continue handler for not found set done = 1;


open o_cursor;


fetch o_cursor into stud_id,stud_name,roll_Date ;
while not done do
select count(*) into @exist_count from n_rollCall where id = stud_id and rollCallDate = roll_date;

if @exist_count =0 then
insert into n_rollCall(id,name,rollCallDate) values(stud_id,stud_name,roll_date);
end if;

fetch o_cursor into stud_id,stud_name,roll_Date ;

end while;

close o_cursor;

end;
//

call mergeData();



//
select *from n_rollCall;
//


//

