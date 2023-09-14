create database ss03ex1;
use ss03ex1;
CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(45) NOT NULL,
    start_date DATETIME NOT NULL,
    status_class BIT
);
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(45) NOT NULL,
    student_address VARCHAR(45),
    student_phone VARCHAR(10),
    status_student BIT,
    class_id INT,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);
CREATE TABLE subject (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(45) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    status_subject BIT DEFAULT 1
);
CREATE TABLE mark (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (subject_id , student_id),
    FOREIGN KEY (subject_id)
        REFERENCES subject (subject_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', CURRENT_DATE, 0);

INSERT INTO student (student_name, student_address, student_phone, status_student, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, student_address, status_student, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, student_address, student_phone, status_student, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
INSERT INTO mark (subject_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 --  1. Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT 
    *
FROM
    student
WHERE
    student_name LIKE 'h%';
    
    
    -- 2. Hiển thị các thông tin môn học có credit trong khoảng từ 3-5.
    
    
  select * 
  from subject
  where credit between 3 and 5;
  
  -- 3. Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT 
    *
FROM
    class
WHERE
    MONTH(start_date) = '12';
  
  -- 4.Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
  set sql_safe_updates=0;
UPDATE student 
SET 
    class_id = 2
WHERE
    student_name = 'Hung';
  set sql_safe_updates=1;
  -- 5. hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi 
  -- (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT 
    student.student_name, subject.subject_name, mark.mark
FROM
    student
        JOIN
    mark ON student.student_id = mark.student_id
        JOIN
    subject ON mark.subject_id = subject.subject_id
ORDER BY mark.mark DESC , student.student_name ASC;
  