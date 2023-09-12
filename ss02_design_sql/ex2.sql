create database ss02ex2;
use ss02ex2;
create table customer(
	customer_id int primary key auto_increment,
    customer_name varchar(45) not null,
    customer_age int not null,
    check(customer_age>0)
);
create table `order`(
	order_id int primary key auto_increment,
    customer_id int,
    foreign key (customer_id) references customer(customer_id),
    order_date datetime not null,
    order_total_price double not null,
    check(order_total_price>0)
);
create table product(
	product_id int primary key auto_increment,
    product_name varchar(45),
    product_price double,
    check(product_price>0)
);
create table order_detail(
	product_id int,
    foreign key (product_id) references product(product_id),
    order_id int,
    foreign key (order_id) references `order`(order_id),
    order_quantity int,
    check(order_quanity>0)
);