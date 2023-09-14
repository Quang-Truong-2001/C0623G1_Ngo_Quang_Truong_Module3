use ss03ex1;
-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    subject
WHERE
    credit = (SELECT 
            MAX(credit)
        FROM
            subject);
            
-- 2. Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.*, max(m.mark) as  max_point
from subject s
join mark m
on s.subject_id=m.subject_id
group by s.subject_id;
-- 3. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
-- xếp hạng theo thứ tự điểm giảm dần
select s.*, avg(m.mark)
from student s
join mark m
on s.student_id=m.student_id
group by s.student_id
order by avg(m.mark) desc;