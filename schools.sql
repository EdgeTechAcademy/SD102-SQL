USE school;

DROP DATABASE school;

CREATE DATABASE school;

USE school;


CREATE TABLE students (
  student_id 	INT 			NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name 			varchar(50) 	NOT NULL,
  dob 			DATE 			NOT NULL,
  ssn			char(10)		NOT NULL,
  bio 			varchar(2000) 		NULL,
  GPA 			decimal(3,2)	NOT NULL
);

CREATE TABLE depts (
  dept_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name		varchar(200) NOT NULL
);

CREATE TABLE classes (
  class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  dept_id  INT NOT NULL,
  name		varchar(200) NOT NULL,
  foreign key (dept_id) references depts(dept_id)
);

CREATE TABLE registrations (
  registration_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  class_id  INT NOT NULL,
  student_id  INT NOT NULL,
  semester		char(20) NOT NULL,
  foreign key (class_id) references classes(class_id),
  foreign key (student_id) references students(student_id)
);
