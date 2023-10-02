create database user_database;
use user_database;
create table user_manager(
	id int primary key auto_increment,
    `name` varchar(45) not null,
    email varchar(45) not null,
    country varchar(45) not null
);

select * from user_manager;

insert into user_manager(`name`,email,country)
values ("em","dfh","dsa");

select * from user_manager
where id=12;

update user_manager
set `name`="g", email="v", country="dsfhj"
where id=12;

delete from user_manager
where id=12;

delimiter //
create procedure getList()
begin
select * from user_manager;
end //
delimiter ;

delimiter //
create procedure update_user(name_user varchar(50), email_user varchar(50), country_user varchar(50), id_user int)
begin 
	update user_manager
    set `name`=name_user, email=email_user, country=country_user
    where id=id_user;
end //
delimiter ;

delimiter //
create procedure delete_user(id_user int)
begin
delete from user_manager
where id=id_user;
end //
delimiter ;

call delete_user(4);

call update_user("dsfds","dfdsfd","assa",4);

drop procedure update_user;

call getList();

call update_user(dfsdf,em,dfdsf,4);