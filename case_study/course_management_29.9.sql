CREATE DATABASE course_management; 
USE course_management;

CREATE TABLE course_content (
    course_content_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    course_content_name VARCHAR(55) NOT NULL
);

CREATE TABLE course_category (
    course_category_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    course_category_name VARCHAR(55) NOT NULL
);

CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    course_name VARCHAR(55) NOT NULL,
    course_description LONGTEXT NOT NULL,
    instructor VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    course_content_id INT NOT NULL,
    FOREIGN KEY (course_content_id)
        REFERENCES course_content (course_content_id),
	course_category_id INT NOT NULL,
    FOREIGN KEY (course_category_id)
        REFERENCES course_category (course_category_id)
);

CREATE TABLE content_type (
	content_type_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    content_type_name VARCHAR(50) NOT NULL
);

CREATE TABLE detailed_content (
	detailed_content_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    content_title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    url_video_id VARCHAR(50),
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
    id_card VARCHAR(12) UNIQUE,
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

INSERT INTO course_content (course_content_name) VALUES ('Web Development');
INSERT INTO course_content (course_content_name) VALUES ('Data Science');
INSERT INTO course_content (course_content_name) VALUES ('Mobile App Development');

INSERT INTO course_category (course_category_name) VALUES ('Beginner');
INSERT INTO course_category (course_category_name) VALUES ('Intermediate');
INSERT INTO course_category (course_category_name) VALUES ('Advanced');

INSERT INTO course (course_name, course_description, instructor, price, course_content_id, course_category_id) 
VALUES ('HTML and CSS', 'Learn the basics of HTML and CSS to build beautiful websites.', 'John Smith', 24.99, 1, 1);
INSERT INTO course (course_name, course_description, instructor, price, course_content_id, course_category_id) 
VALUES ('Python for Data Science', 'Learn the Python programming language and how it is used in data science.', 'Jane Doe', 49.99, 2, 2);
INSERT INTO course (course_name, course_description, instructor, price, course_content_id, course_category_id) 
VALUES ('React Native', 'Build mobile apps for iOS and Android using React Native.', 'Mike Thompson', 99.99, 3, 3);

INSERT INTO content_type (content_type_name) VALUES ('Lesson');
INSERT INTO content_type (content_type_name) VALUES ('Readings');
INSERT INTO content_type (content_type_name) VALUES ('Exercise');

INSERT INTO detailed_content (content_title, content, url_video_id, course_content_id, content_type_id) 
VALUES ('Introduction to HTML', 'HTML stands for Hypertext Markup Language and is used to structure content on the web.','0SJE9dYdpps', 1, 1);
INSERT INTO detailed_content (content_title, content, url_video_id , course_content_id, content_type_id) 
VALUES ('CSS Selectors', 'Learn how to select HTML elements using CSS selectors.','0SJE9dYdpps', 1, 2);
INSERT INTO detailed_content (content_title, content, url_video_id , course_content_id, content_type_id) 
VALUES ('Python Data Types', 'Learn about the different data types in Python, such as strings, numbers, and lists.','0SJE9dYdpps', 2, 1);

INSERT INTO `user` (user_name, `password`, id_card, birthday, gender, phone, email, `role`) 
VALUES ('johndoe', 'password123', '123456789012', '1990-05-01', 1, '1234567890', 'johndoe@email.com', 'student');
INSERT INTO `user` (user_name, `password`, id_card, birthday, gender, phone, email, `role`) 
VALUES ('janedoe', 'password456', '098765432109', '1985-11-15', 0, '0987654321', 'janedoe@email.com', 'instructor');

INSERT INTO course_order (order_date, order_price, user_id, course_id) 
VALUES ('2022-01-01', 24.99, 1, 1);
INSERT INTO course_order (order_date, order_price, user_id, course_id) 
VALUES ('2022-01-02', 49.99, 1, 2);
INSERT INTO course_order (order_date, order_price, user_id, course_id) 
VALUES ('2022-01-03', 99.99, 1, 3);