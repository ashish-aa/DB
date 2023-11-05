use db;
create table Borrower(
Rollin int primary key not null,
Name varchar(200) not null,
DateofIssue date not null,
nameofBook varchar(200) not null,
status char(1) check(status in('I','R')));

create table Fine(
Roll_no int,
Date Date not null,
Amt Decimal(10,2) not null,
foreign key(Roll_no) references Borrower(Rollin));

select *from Borrower;
select *from Fine;

delimiter //

create procedure calcFine( in v_roll int, in v_nameOfBook varchar(200))
begin
declare v_issueDate Date;
declare v_currDate Date;
declare v_dueDays int;
declare v_fine decimal(10,2);

select DateofIssue into v_issueDate from Borrower as b where b.Rollin = v_roll and b.nameofBook = v_nameOfBook;

set v_currDate = curdate();
set v_dueDays = datediff(v_currDate,v_issueDate);

if v_dueDays > 15 and v_dueDays<30 then
set v_fine = v_dueDays * 5.00;
elseif v_dueDays >30 then
set v_fine = v_dueDays *50.00;
else 
set v_fine= 0;
end if;

update Borrower set status = 'R' where Rollin = v_roll and nameofBook = v_nameOfBook;

if v_fine >0 then
insert into Fine(Roll_no,Date,Amt) values (v_roll,v_currDate,v_fine);
end if;
end;
//

INSERT INTO Borrower (Rollin, Name, DateofIssue, NameofBook, Status)
VALUES
    (1, 'John Doe', '2023-10-15', 'Book A', 'I'),
    (2, 'Jane Smith', '2023-09-25', 'Book B', 'I'),
    (3, 'Alice Johnson', '2023-11-01', 'Book C', 'I');
//

INSERT INTO Borrower (Rollin, Name, DateofIssue, NameofBook, Status)
VALUES
    (5, 'Ashish Awale', '2023-08-15', 'Book F', 'I');
 // 
call calcFine(5,'Book F');



