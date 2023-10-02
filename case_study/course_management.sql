CREATE DATABASE course_management; 
USE course_management;

CREATE TABLE course_content (
    course_content_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    course_content_name VARCHAR(55) NOT NULL
);

CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    course_name VARCHAR(55) NOT NULL,
    course_description LONGTEXT NOT NULL,
    instructor VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    course_content_id INT NOT NULL,
    FOREIGN KEY (course_content_id)
        REFERENCES course_content (course_content_id)
);

CREATE TABLE content_type (
	content_type_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    content_type_name VARCHAR(50) NOT NULL
);

CREATE TABLE detailed_content (
	detailed_content_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    content_title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    course_content_id INT NOT NULL,
    content_type_id INT NOT NULL,
    FOREIGN KEY (course_content_id)
        REFERENCES course_content (course_content_id),
	FOREIGN KEY (content_type_id)
        REFERENCES content_type (content_type_id)
);

CREATE TABLE `user` (
    user_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    user_name VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(30) NOT NULL, 
    id_card VARCHAR(12) NOT NULL UNIQUE,
    birthday DATE,
    gender BIT,
    phone VARCHAR(10) NOT NULL UNIQUE,
    email VARCHAR(55) NOT NULL UNIQUE,
    `role` VARCHAR(10) NOT NULL
);

CREATE TABLE course_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    order_date DATE NOT NULL,
    order_price DOUBLE NOT NULL,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES `user` (user_id),
	FOREIGN KEY (course_id) 
		REFERENCES course (course_id)
);

-- DROP database course_management; -- 