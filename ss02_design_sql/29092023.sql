create database project;
use project;
create table user_service(
	id_user int primary key auto_increment,
    name_user varchar(45),
    birthday_user datetime,
    phone_number varchar(10),
    email varchar(45)
);
create table course(
	id_course int primary key auto_increment,
    name_course varchar(45),
    description_course varchar(500),
    name_instructor varchar(45),
    price double
);
create table order_main(
	id_order int primary key auto_increment,
    id_user int,
    foreign key (id_user) references user_service (id_user),
    order_day datetime
);
create table order_detail(
	id_order int, 
    foreign key (id_order) references order_main(id_order),
    id_course int,
    foreign key (id_course) references course(id_course)
);

create table video(
	id_video int primary key auto_increment,
    url varchar(200)
);
create table lecture(
	id_lecture int primary key auto_increment
);
create table course_content(
	id_course int,
    foreign key (id_course) references course(id_course),
    name_course_content varchar(100),
    description_course_content varchar(500),
    id_lecture int,
    foreign key (id_lecture) references lecture(id_lecture),
    id_video int,
    foreign key (id_video) references video(id_video)
);
