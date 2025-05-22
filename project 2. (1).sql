create database university;
use university;
create table students(
student_id int primary key,
NAME_S VARCHAR(100),
Email VARCHAR(100),
join_date DATE
);
create table courses(
course_id int primary key,
course_name	VARCHAR(100),	
instructors	VARCHAR(100),	
credits	int
);
create table Enrollments(
enrollment_id	INT primary key,	
student_id	INT,
course_id	INT,	
enrolled_on	DATE,	
grade	CHAR(1),
foreign key (student_id) references students(student_id),
foreign key (course_id) references courses(course_id)
);

insert into students(student_id,NAME_S,Email,join_date) values
(1,"Niha Sharma","nihasharma3452@gmail.com",'24-05-23'),
(2,"Harshitha nayak","harshithanayak234@gmail.com",'24-05-27'),
(3,"Ahana sharma","ahanasharma3667@gmail.com",'24-05-23'),
(4,"Deekshith GN","deekshithgn456@gmail.com",'24-05-29'),
(5,"Hita Aggarwal","hitaaggarwal209@gmail.com",'24-05-28'),
(6,"Dimple Gupta","dimplegupta506@gmail.com",'24-05-28'),
(7,"Prishal Dscoza","prishaldscoza1874@gmail.com",'24-05-24');

insert into courses(course_id,course_name,instructors,credits) values
(11,"Bsc Microbiology","Mr Akhilesh Bhat",5),
(12,"Bsc Biotechnology","Mrs Smitha Patil",6),
(13,"Bsc Computer science","Mr Hemanth ",5),
(14,"Bcom","Mr Akhilesh Bhat",4),
(15,"Bsc Biotechnology","Mrs Smitha Patil",6),
(16,"Bsc Computer science","Mr Hemanth",5),
(17,"Bsc Microbiology","Mr Akhilesh Bhat",5);

insert into Enrollments(enrollment_id,student_id,course_id,enrolled_on,grade) values
(111,1,11,'24-05-23','A'),
(112,2,12,'24-05-27','B'),
(113,3,13,'24-05-28','F'),
(114,4,14,'24-05-24','D'),
(115,5,15,'24-05-23','A'),
(116,6,16,'24-05-26','D'),
(117,7,17,'24-05-29','F');

#1. List all students who enrolled in the course "Data Science 101".
SELECT S.name_s 
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
WHERE C.course_name = 'Data Science 101';

#Find courses that have more enrollments than the average enrollment across all courses.
SELECT C.course_name, COUNT(E.enrollment_id) AS num_enrollments
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name
HAVING COUNT(E.enrollment_id) > (SELECT AVG(num_enrollments) 
                                 FROM (SELECT course_id, COUNT(enrollment_id) AS num_enrollments 
                                       FROM Enrollments 
                                       GROUP BY course_id) AS subquery);

#List the names of students who have not enrolled in any course.
SELECT S.name_s 
FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.enrollment_id IS NULL;

#Find the instructor who teaches the course with the most enrollments.
SELECT C.instructors, COUNT(E.enrollment_id) AS num_enrollments
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.instructors
ORDER BY num_enrollments DESC
LIMIT 1;

#For each student, display their name and the number of courses they’ve passed (grade A, B, or C).
SELECT S.name_s, COUNT(E.enrollment_id) AS num_passed_courses
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.grade IN ('A', 'B', 'C')
GROUP BY S.name_s;

#Find students who have taken a course with 'Python' in its name.
SELECT S.name_s
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
WHERE C.course_name LIKE '%Python%';

#Write a query to count how many students enrolled each month in 2024.
SELECT MONTH(E.enrolled_on) AS month, COUNT(DISTINCT E.student_id) AS num_enrollments
FROM Enrollments E
WHERE YEAR(E.enrolled_on) = 2024
GROUP BY MONTH(E.enrolled_on);

#Find students who got an 'A' in all their courses.
SELECT S.name_s 
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.name_s
HAVING MIN(E.grade) = 'A' AND MAX(E.grade) = 'A';

#Display the names of students along with the courses they are enrolled in and the instructor for each course.
SELECT 
    S.name_s AS student_name, 
    C.course_name, 
    C.instructors
FROM 
    Students S
JOIN 
    Enrollments E ON S.student_id = E.student_id
JOIN 
    Courses C ON E.course_id = C.course_id;
    
#List students who are enrolled in more than one course taught by the same instructor.
SELECT 
    S.name_s, 
    C.instructors, 
    COUNT(DISTINCT C.course_id) AS num_courses
FROM 
    Students S
JOIN 
    Enrollments E ON S.student_id = E.student_id
JOIN 
    Courses C ON E.course_id = C.course_id
GROUP BY 
    S.name_s, C.instructors
HAVING 
    COUNT(DISTINCT C.course_id) > 1;
    




