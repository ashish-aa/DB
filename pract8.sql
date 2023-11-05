use db;


CREATE TABLE teaches (
    T_ID INT,
    course_id INT,
    sec_id INT,
    semester VARCHAR(255),
    year INT
);

INSERT INTO teaches VALUES
    (1, 101, 1, 'Fall', 2022),
    (2, 102, 2, 'Spring', 2023),
    (3, 103, 1, 'Fall', 2023),
    (4, 104, 3, 'Spring', 2022);
    
    
CREATE TABLE student (
    S_ID INT,
    name VARCHAR(255),
    dept_name VARCHAR(255),
    tot_cred INT
);

INSERT INTO student VALUES
    (101, 'Alice', 'Computer Science', 90),
    (102, 'Bob', 'Electrical Engineering', 85),
    (103, 'Charlie', 'Biology', 75),
    (104, 'David', 'Mathematics', 100);

CREATE TABLE instructor (
    T_ID INT,
    name VARCHAR(255),
    dept_name VARCHAR(255),
    salary DECIMAL(10, 2)
);

INSERT INTO instructor VALUES
    (201, 'Eve', 'Computer Science', 75000.00),
    (202, 'Frank', 'Electrical Engineering', 80000.00),
    (203, 'Grace', 'Biology', 70000.00),
    (204, 'Hank', 'Mathematics', 85000.00);


CREATE TABLE course (
    course_id INT,
    title VARCHAR(255),
    dept_name VARCHAR(255),
    credits INT
);

INSERT INTO course VALUES
    (101, 'Introduction to Programming', 'Computer Science', 3),
    (102, 'Circuit Analysis', 'Electrical Engineering', 4),
    (103, 'Cell Biology', 'Biology', 3),
    (104, 'Calculus I', 'Mathematics', 4);


SELECT DISTINCT instructor.name
FROM instructor
JOIN teaches ON instructor.T_ID = teaches.T_ID
WHERE teaches.semester = 'fall'
   AND teaches.year = 2023;

CREATE VIEW student_details AS
SELECT S_ID, name, dept_name AS department_name, tot_cred
FROM student;

ALTER TABLE student
CHANGE COLUMN dept_name department_name VARCHAR(255);

DELETE FROM student
WHERE department_name IS NULL;



