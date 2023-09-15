-- 1. Tạo cơ sở dữ liệu
create database ss05ex;
use ss05ex;
-- 2. tạo bảng
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_code INT UNIQUE,
    product_name VARCHAR(45) NOT NULL,
    product_price DOUBLE CHECK (product_price > 0),
    product_amount INT CHECK (product_amount > 0),
    product_description VARCHAR(45),
    product_status BIT NOT NULL
);
-- chèn dữ liệu
insert into products(product_code,product_name,product_price,product_amount,product_description, product_status)
values (201,'tao', 10000, 5 , 'abc', 1 ),
	   (202,'cam', 10000, 4 , 'abc', 1 ),
       (203,'chanh', 15000, 6 , 'abc', 1 );
-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_product_code
on products(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index index_product
on products(product_name, product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
explain select *
from products
where product_name='tao';
drop index index_product
on products;
explain select *
from products
where product_name='tao';
-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view view_products as
select product_code, product_name, product_price, product_status
from products p;
-- Tiến hành sửa đổi view
set sql_safe_updates=0;
update view_products
set product_price=20000
where product_code=201;
set sql_safe_updates=1;
-- Tiến hành xoá view
drop view view_products;


-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure take_information_products()
begin
select *
from products;
end //
delimiter ;
call take_information_products();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product(product_code int, product_name varchar(45), product_price double, product_amount int,product_description varchar(100), product_status bit)
begin
insert into products(product_code, product_name, product_price, product_amount,product_description, product_status)
value(product_code, product_name, product_price, product_amount,product_description, product_status);
end //
delimiter ;
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_information_product(id int, product_code int, product_name varchar(45), product_price double, product_amount int,product_description varchar(100), product_status bit)
begin 
set sql_safe_updates=0;
update products p
set product_code=product_code, product_name=product_name, product_price=product_price, product_amount=product_amount,product_description=product_description, product_status=product_status
where p.id=id;
set sql_safe_updates=1;
end //
delimiter ;

drop procedure update_information_product;
call update_information_product	(1, 400, 'keo',10000,4,'def',1);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product(id int)
begin
delete
from products p
where p.id=id;
end //
delimiter ;

call delete_product(1);


