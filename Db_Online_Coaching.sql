mysql> CREATE DATABASE OnlineCoachingInstitute;

mysql> USE OnlineCoachingInstitute;

mysql> CREATE TABLE Admin (
         admin_id INT PRIMARY KEY AUTO_INCREMENT,
         name VARCHAR(100) NOT NULL,
         email VARCHAR(100) UNIQUE NOT NULL,
         password VARCHAR(255) NOT NULL,
         phone VARCHAR(15)
		 );
		 
mysql> CREATE TABLE Student (
		student_id INT PRIMARY KEY AUTO_INCREMENT,
		name VARCHAR(100) NOT NULL,
		email VARCHAR(100) UNIQUE NOT NULL,
		password VARCHAR(255) NOT NULL,
		phone VARCHAR(15),
		address TEXT,
		dob DATE,
		join_date DATE
		);
		
mysql> CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    qualification VARCHAR(200),
    expertise VARCHAR(200),
    join_date DATE
);

mysql> CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    role ENUM('student','teacher','admin') NOT NULL
);

mysql> CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    duration VARCHAR(50),
    level VARCHAR(50),
    price DECIMAL(10,2),
    teacher_id INT,
    created_date DATE,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

mysql> CREATE TABLE Enrollment (
    enroll_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enroll_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

mysql> CREATE TABLE Lecture (
    lecture_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    video_url VARCHAR(500),
    lecture_order INT,
    upload_date DATE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

mysql> CREATE TABLE Study_Material (
    material_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    file_url VARCHAR(500),
    upload_date DATE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

mysql> CREATE TABLE Quiz (
    quiz_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    total_marks INT,
    quiz_date DATE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

mysql> CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    deadline DATE,
    total_marks INT,
    created_date DATE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

mysql> CREATE TABLE Submission (
    submission_id INT PRIMARY KEY AUTO_INCREMENT,
    assignment_id INT NOT NULL,
    student_id INT NOT NULL,
    submission_date DATE,
    file_url VARCHAR(500),
    marks_obtained INT,
    feedback TEXT,
    FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

mysql> CREATE TABLE Result (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    total_marks INT,
    grade VARCHAR(10),
    result_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

mysql> CREATE TABLE Message (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message TEXT,
    sent_at DATETIME,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (receiver_id) REFERENCES User(user_id)
);

mysql> SHOW TABLES;
+-----------------------------------+
| Tables_in_onlinecoachinginstitute |
+-----------------------------------+
| admin                             |
| assignment                        |
| course                            |
| enrollment                        |
| lecture                           |
| message                           |
| quiz                              |
| result                            |
| student                           |
| study_material                    |
| submission                        |
| teacher                           |
| user                              |
+-----------------------------------+
13 rows in set (0.01 sec)
		 
		 