create database user_database;
use user_database;
create table user_manager(
	id int primary key auto_increment,
    `name` varchar(45),
    email varchar(45),
    country varchar(45)
);