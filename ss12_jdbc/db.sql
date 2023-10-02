create database user_database;
use user_database;
create table user_manager(
	id int primary key auto_increment,
    `name` varchar(45),
    email varchar(45),
    country varchar(45)
);

select * from user_manager;

insert into user_manager(`name`,email,country)
values ("hoa","@gmail.com","italia");

update user_manager
set `name`="em",email="f",country="gh"
where id=10;

select * from user_manager
where id=10;

delete from user_manager
where id=10;