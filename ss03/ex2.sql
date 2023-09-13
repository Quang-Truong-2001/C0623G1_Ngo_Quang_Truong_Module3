create database ss02ex2;
use ss02ex2;
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(45) NOT NULL,
    customer_age INT NOT NULL,
    CHECK (customer_age > 0)
);
CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),
    order_date DATETIME NOT NULL,
    order_total_price DOUBLE,
    CHECK (order_total_price > 0)
);
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(45),
    product_price DOUBLE NOT NULL,
    CHECK (product_price > 0)
);

CREATE TABLE order_detail (
    product_id INT,
    FOREIGN KEY (product_id)
        REFERENCES product (product_id),
    order_id INT,
    FOREIGN KEY (order_id)
        REFERENCES `order` (order_id),
    order_quantity INT NOT NULL
);
INSERT INTO customer(customer_name, customer_age)
VALUES('Minh Quang',10),
	   ('Ngoc Anh', 20),
	   ('Hong Ha', 50);

INSERT INTO `order`(customer_id, order_date, order_total_price)
VALUES(1,'2006-03-23',null),
	  (2,'2006-03-21',null),
	  (1,'2006-03-16',null);
      
INSERT INTO product(product_name, product_price)
VALUES ('May giat',3),
	   ('Tu lanh',5),
	   ('Dieu Hoa',7),
	   ('Quat',1),
	   ('Bep dien',2);
       
INSERT INTO order_detail (order_id, product_id, order_quantity)
VALUES (1,1,3),
	   (1,3,7),
	   (1,4,2),
	   (2,1,1),
	   (3,1,8),
	   (2,5,4),
	   (2,3,3);
       
-- 1. Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT 
    `order`.order_id,
    `order`.order_date,
    `order`.order_total_price
FROM
    `order`;
-- 2. Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    *
FROM
    customer
        INNER JOIN
    `order` ON customer.customer_id = `order`.customer_id;

-- 3. Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    *
FROM
    customer
        LEFT JOIN
    `order` ON customer.customer_id = `order`.customer_id
WHERE
    `order`.order_id IS NULL;

-- 4. Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán 
-- của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT `order`.order_id,`order`.order_date,sum(product.product_price*order_detail.order_quantity) AS total_price
  FROM `order`
  JOIN order_detail
  ON `order`.order_id= order_detail.order_id
  JOIN product
  ON order_detail.product_id = product.product_id
  group by `order`.order_id;