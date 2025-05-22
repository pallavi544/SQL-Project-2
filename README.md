# SQL-Project-2
This project simulates a Student Course Management System for an educational institution. It demonstrates the design and implementation of a relational database to manage students, instructors, courses, and enrollments. The project encompasses the following key operations:

## Database Creation:

Establishes a new database named course_management.

## Schema Definition: 

Creates a schema named Edtech to logically group database objects.

## Table Definitions:

* students: Stores student details such as ID, first name, last name, email, and date of birth.

* instructors: Contains instructor information including ID, first name, last name, and email.

* courses: Holds course details including ID, name, description, and the instructor responsible.

* enrollments: Records the association between students and courses, including enrollment date and grade.

* Data Insertion: Populates the tables with sample data to simulate a real-world scenario.

## Queries and Operations:

* Retrieves specific student information based on enrollment status.

* Calculates aggregate functions like average grade per course.

* Performs join operations to combine data from multiple tables.

* Identifies instructors with the number of courses they teach.

* Lists students enrolled in courses taught by a specific instructor.

## How to Run Locally
* To run this SQL project on your local machine, follow these steps:

1.Install a SQL Environment
   
You can use any SQL environment like:

* MySQL

* PostgreSQL

* Microsoft SQL Server

* SQLite

* Or graphical tools like MySQL Workbench, DBeaver, or pgAdmin

2.Clone the Repository
   
```bash

git clone https://github.com/pallavi544/SQL-Project-2.git
cd SQL-Project-2

```

3.Open the SQL File

* Open the file project 2. (1).sql in your SQL editor or import it into your SQL IDE.

4.Run the Script
   
* Execute the entire SQL script to:

* Create the database and schema

* Create tables and define relationships

* Insert sample data

* Run queries and view the outputs

 Note: Ensure your SQL server is running and properly configured before executing the script.
