use db;

create table student(
S_ID int primary key auto_increment,
name varchar(20),
dept_name varchar(20),
tot_Cred decimal(10,2));

create table instructor(
T_ID int primary key auto_increment,
name varchar(20),
dept_name varchar(20),
salary decimal(10,2));

create table course(
course_id int primary key auto_increment,
title varchar(20),
dept_name varchar(20),
credits decimal(10,2));

drop table course;

INSERT INTO student (name, dept_name, tot_cred) VALUES ('John Doe', 'Computer', 120);
INSERT INTO student (name, dept_name, tot_cred) VALUES ('Jane Doe', 'Math', 90);
INSERT INTO student (name, dept_name, tot_cred) VALUES ('Peter Parker', 'Physics', 60);
INSERT INTO student (name, dept_name, tot_cred) VALUES ('Mary Jane Watson', 'Chemistry', 30);

INSERT INTO instructor (name, dept_name, salary) VALUES ('Dr. Smith', 'Computer', 50000);
INSERT INTO instructor (name, dept_name, salary) VALUES ('Dr. Jones', 'Math', 45000);
INSERT INTO instructor (name, dept_name, salary) VALUES ('Dr. Williams', 'Physics', 40000);
INSERT INTO instructor (name, dept_name, salary) VALUES ('Dr. Brown', 'Chemistry', 35000);
INSERT INTO instructor (name, dept_name, salary) VALUES
    ('John Doe', 'Computer Science', 60000.00),
    ('Jane Smith', 'Mathematics', 55000.00),
    ('Alice Johnson', 'Physics', 62000.00),
    ('Bob Wilson', 'Chemistry', 58000.00),
    ('Eva Davis', 'Biology', 59000.00),
    ('David Lee', 'Economics', 61000.00),
    ('Sarah Brown', 'History', 54000.00),
    ('Michael Taylor', 'English', 57000.00),
    ('Laura Clark', 'Psychology', 59000.00),
    ('Robert White', 'Sociology', 56000.00),
    ('William Turner', 'Mathematics', 59000.00),
    ('Olivia Moore', 'Chemistry', 62000.00),
    ('James Harris', 'Physics', 60000.00);
//
-- Insert additional sample data into the "instructor" table
INSERT INTO instructor (name, dept_name, salary) VALUES
    ('Linda Anderson', 'Computer Science', 62000.00),
    ('John Wilson', 'Physics', 59000.00),
    ('Mary Davis', 'Biology', 60000.00),
    ('Richard Harris', 'Mathematics', 58000.00),
    ('Patricia Clark', 'Economics', 61000.00),
    ('Thomas Moore', 'History', 54000.00),
    ('Jennifer Turner', 'English', 57000.00),
    ('Michael White', 'Psychology', 60000.00),
    ('Nancy Taylor', 'Sociology', 59000.00),
    ('Christopher Johnson', 'Computer Science', 64000.00),
    ('Elizabeth Smith', 'Mathematics', 57000.00),
    ('Daniel Lee', 'Physics', 62000.00);


INSERT INTO course (title, dept_name, credits) VALUES ('Introduction to Computer Science', 'Computer', 3);
INSERT INTO course (title, dept_name, credits) VALUES ('Calculus I', 'Math', 4);
INSERT INTO course (title, dept_name, credits) VALUES ('Physics I', 'Physics', 4);
INSERT INTO course (title, dept_name, credits) VALUES ('Chemistry I', 'Chemistry', 3);
INSERT INTO course (title, dept_name, credits) VALUES ('DBMS', 'Computer', 5);


select T_ID,avg(salary)as Avg_Salary, dept_name from instructor group by T_ID,dept_name having avg(salary)>42000;

update instructor
set salary = salary * 1.10 where dept_name = 'Computer';

SELECT T_ID, name
FROM instructor
GROUP BY T_ID, name
HAVING name <> 'Amit' AND name <> 'Amol';

select name from instructor where name like '%am%';
SELECT s.name
FROM student s
JOIN course c ON s.dept_name = c.dept_name
WHERE s.dept_name = 'Computer' AND c.title = 'DBMS';


