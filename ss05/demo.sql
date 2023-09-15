use c0623g1_module_3;
-- đánh và xóa index cho name ở bảng student
create unique index index_name
on student(name);

explain select *
from student
where name ='nguyen ngoc cuong';

drop index index_name
on student;
-- Tạo view chỉ chứa thông tin id và name của student
create view view_student as
select id, name
from student;

update view_student
set name='abc'
where id=1;

drop view view_student;

-- ========== Stored Procedure ==========
-- ========== IN ==========

delimiter //
create procedure search_by_name(search_name varchar(50))
begin
select *
from student
where name=search_name;
end //
delimiter ;

call search_by_name('le minh vu');

-- ========== OUT ==========
delimiter //
create procedure search_by_name_out(search_name varchar(50), out count int)
begin
select count(*) into count
from student s
where name=search_name;
end //
delimiter ;

set @count=0;
call search_by_name_out('le minh vu', @count);
select @count;
-- ========== INOUT ==========
​
delimiter //
create procedure find_by_name_in_out(inout search_name varchar(50))
begin
select count(*) into search_name
from student
where name = search_name;
end //
delimiter ;
set @count = "le minh vu";
call find_by_name_in_out(@count);
select @count;
​
​
-- tạo trigger tự động tạo tài khoản jame trước khi thêm mới một học viên
 select * from student;
 select * from jame;
​
DELIMITER //
CREATE TRIGGER tr_auto_create_jame 
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
insert into jame(`account`, `password`) values ( new.email, '123');
END //
DELIMITER ;
​
insert into student (name, email)
values ("Ly","Ly@gmail.com"),("Toan","Toan@gmail.com");
​
​
-- viêt 1 function xếp loại học lưc theo point
delimiter //
create function f_xep_loai(diem int)
returns varchar(50)
deterministic
begin
	declare loai varchar(50);
	if diem >= 8 then
	set loai = 'giỏi';
	elseif diem >= 7 then
	set loai = 'khá';
	else
	set loai = 'trung bình';
	end if;
	return loai;
end //
delimiter ;
-- sử dụng function
select s.name,s.point, f_xep_loai(s.point) 
from student s;










