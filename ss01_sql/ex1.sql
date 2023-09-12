create database ss01;
use ss01;
create table class(
	id int primary key auto_increment,
    student_name varchar(50)
);
create table teacher(
	id int primary key auto_increment,
	teacher_name varchar(50),
    age int,
    country varchar(50)
);