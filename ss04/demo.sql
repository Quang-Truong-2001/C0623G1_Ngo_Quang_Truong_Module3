use c0623g1_module_3;
-- 1.Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp.
select c.name, count(s.class_id)
from student s
join class c
on s.class_id=c.id
group by class_id;
-- 2.Tính điểm lớn nhất của mỗi các lớp.
select c.name, max(s.point)
from student s
join class c
on s.class_id=c.id
group by c.name;
-- 3. Tình điểm trung bình  của từng lớp 
select c.name, avg(s.point)
from student s
join class c
on s.class_id=c.id
group by c.id;
-- 4. Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym.
select name, birthday
from instructor i
union
select name, birthday
from student;
-- 5. Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
select *
from student
order by point desc
limit 3;
-- 6. Lấy ra các học viên có điểm số là cao nhất của trung tâm.

select * 
from student
where point in (
	select max(point)
	from student
);