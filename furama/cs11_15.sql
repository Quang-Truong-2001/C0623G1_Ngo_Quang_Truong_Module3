use furama;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dk.*
from khach_hang k
join loai_khach lk
on k.ma_loai_khach=lk.ma_loai_khach
join hop_dong h
on k.ma_khach_hang=h.ma_khach_hang
join hop_dong_chi_tiet hc
on h.ma_hop_dong=hc.ma_hop_dong
join dich_vu_di_kem dk
on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
where (k.dia_chi like '%Vinh' or k.dia_chi like '%Quang Ngai') and lk.ten_loai_khach='Diamond';
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 
-- 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select h.ma_hop_dong, n.ho_ten as  'ten nhan vien' ,k.ho_ten as 'ten khach hang', k.so_dien_thoai, d.ten_dich_vu, count(hc.so_luong), h.tien_dat_coc
from khach_hang k
left join loai_khach lk
on k.ma_loai_khach=lk.ma_loai_khach
join hop_dong h
on k.ma_khach_hang=h.ma_khach_hang
left join nhan_vien n
on h.ma_nhan_vien=n.ma_nhan_vien
left join hop_dong_chi_tiet hc
on h.ma_hop_dong=hc.ma_hop_dong
left join dich_vu d
on h.ma_dich_vu=d.ma_dich_vu
left join dich_vu_di_kem dk
on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
where d.ma_dich_vu not in (
	select d.ma_dich_vu
	from hop_dong h
	join dich_vu d
	on h.ma_dich_vu=d.ma_dich_vu
	where year(h.ngay_lam_hop_dong)=2021 and (quarter(h.ngay_lam_hop_dong)=1 or quarter(h.ngay_lam_hop_dong)=2)
)
and year(h.ngay_lam_hop_dong)=2020 and quarter(h.ngay_lam_hop_dong)=4
group by ma_hop_dong;
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
with source as (
	select hc.ma_dich_vu_di_kem, dk.ten_dich_vu_di_kem, sum(hc.so_luong) as so_luong
	from dich_vu_di_kem dk
	join hop_dong_chi_tiet hc
	on dk.ma_dich_vu_di_kem=hc.ma_dich_vu_di_kem
	group by hc.ma_dich_vu_di_kem
    order by so_luong desc
)
select * 
from source as s1 
where s1.so_luong= (
	select max(s2.so_luong)
    from source as s2
);

-- SELECT * FROM (
-- select hc.ma_dich_vu_di_kem, dk.ten_dich_vu_di_kem, sum(hc.so_luong) as tong_so
-- from hop_dong h
-- join hop_dong_chi_tiet hc
-- on h.ma_hop_dong=hc.ma_hop_dong
-- join dich_vu_di_kem dk
-- on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
-- group by hc.ma_dich_vu_di_kem
-- ) as s where s.tong_so = (
-- SELECT MAX(source.tong_so) FROM (
-- select hc.ma_dich_vu_di_kem, dk.ten_dich_vu_di_kem, sum(hc.so_luong) as tong_so
-- from hop_dong h
-- join hop_dong_chi_tiet hc
-- on h.ma_hop_dong=hc.ma_hop_dong
-- join dich_vu_di_kem dk
-- on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
-- group by hc.ma_dich_vu_di_kem
-- order by sum(hc.so_luong) desc
-- ) as source GROUP BY source.ma_dich_vu_di_kem LIMIT 1);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
WITH source as (select hc.ma_dich_vu_di_kem, dk.ten_dich_vu_di_kem, sum(hc.so_luong) as tong_so
from hop_dong h
join hop_dong_chi_tiet hc
on h.ma_hop_dong=hc.ma_hop_dong
join dich_vu_di_kem dk
on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
group by hc.ma_dich_vu_di_kem
order by sum(hc.so_luong) desc)
SELECT * FROM source as s2 WHERE s2.tong_so = 1;

select hc.ma_dich_vu_di_kem, dk.ten_dich_vu_di_kem, sum(hc.so_luong) as tong_so
from hop_dong h
join hop_dong_chi_tiet hc
on h.ma_hop_dong=hc.ma_hop_dong
join dich_vu_di_kem dk
on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
group by hc.ma_dich_vu_di_kem
having tong_so=1
order by sum(hc.so_luong) desc;


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do,
--  ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.


-- with source as (select n.ma_nhan_vien,n.ho_ten,t.ten_trinh_do, b.ten_bo_phan, n.so_dien_thoai, n.dia_chi , count(h.ma_nhan_vien) as tong_so_hop_dong
-- from nhan_vien n
-- join hop_dong h
-- on n.ma_nhan_vien=h.ma_nhan_vien
-- join trinh_do t
-- on n.ma_trinh_do=t.ma_trinh_do
-- join bo_phan b
-- on n.ma_bo_phan=b.ma_bo_phan
-- group by h.ma_nhan_vien)
-- select * from source as s
-- where s.tong_so_hop_dong<=3;

select n.ma_nhan_vien,n.ho_ten,t.ten_trinh_do, b.ten_bo_phan, n.so_dien_thoai, n.dia_chi , count(h.ma_nhan_vien) as tong_so_hop_dong
from nhan_vien n
join hop_dong h
on n.ma_nhan_vien=h.ma_nhan_vien
join trinh_do t
on n.ma_trinh_do=t.ma_trinh_do
join bo_phan b
on n.ma_bo_phan=b.ma_bo_phan
where year(h.ngay_lam_hop_dong) between 2020 and 2021
group by h.ma_nhan_vien
having tong_so_hop_dong<=3;

