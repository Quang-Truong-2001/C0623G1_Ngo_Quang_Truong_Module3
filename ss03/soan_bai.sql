use c0623g1_module_3;
select *
from student
where substring_index(student.name," ",-1) like "h%";
select s.name, c.name 
-- 	from student as s
--     left join class as c
--     on s.class_id=c.id;

-- select * from student
-- where (name like "%Hai" or name like "%Huynh");

-- select * from student
-- where (point>5);

-- select * from student
-- where (name like "Nguyen%");

-- select point, count(point) from student
-- where (point>5)
-- group by point;

-- select point, count(point) from student
-- where (point>5)
-- group by point
-- having (count(point)>=2);

-- select name from student 
-- order by name asc;

