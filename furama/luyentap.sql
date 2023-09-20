-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select d.ma_dich_vu, d.ten_dich_vu, d.dien_tich, d.chi_phi_thue, l.ten_loai_dich_vu
from dich_vu d
join loai_dich_vu l
on d.ma_loai_dich_vu=l.ma_loai_dich_vu
where  l.ma_loai_dich_vu not in (
	select d.ma_loai_dich_vu
	from hop_dong h
	join dich_vu d
	on h.ma_dich_vu=d.ma_dich_vu
	where year(h.ngay_lam_hop_dong)=2021 and quarter(h.ngay_lam_hop_dong)=1
);

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.


select distinct d.ma_dich_vu, d.ten_dich_vu, d.dien_tich, d.so_nguoi_toi_da, d.chi_phi_thue, l.ten_loai_dich_vu
from hop_dong h
join dich_vu d
on h.ma_dich_vu=d.ma_dich_vu
join loai_dich_vu l
on d.ma_loai_dich_vu=l.ma_loai_dich_vu
where year(h.ngay_lam_hop_dong)=2020 and d.ma_dich_vu not in (
	select d.ma_dich_vu
from hop_dong h
join dich_vu d
on h.ma_dich_vu=d.ma_dich_vu
where year(h.ngay_lam_hop_dong)=2021	
);

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select distinct k.ho_ten
from khach_hang k;

select k.ho_ten
from khach_hang k
group by k.ho_ten;

select k.ho_ten
from khach_hang k
union
select k.ho_ten
from khach_hang k;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(h.ngay_lam_hop_dong), count(h.ma_khach_hang)
from hop_dong h
group by month(h.ngay_lam_hop_dong)
order by month(h.ngay_lam_hop_dong);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select h.ma_hop_dong, h.ngay_lam_hop_dong, h.ngay_ket_thuc, h.tien_dat_coc, count(hc.so_luong)
from hop_dong h
join hop_dong_chi_tiet hc
group by ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dk.ma_dich_vu_di_kem, dk.ten_dich_vu_di_kem, dk.gia, dk.don_vi, dk.trang_thai
from khach_hang k
join hop_dong h
on k.ma_khach_hang=h.ma_khach_hang
join hop_dong_chi_tiet hc
on h.ma_hop_dong=hc.ma_hop_dong
join dich_vu_di_kem dk
on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
where k.ma_loai_khach=1 and (k.dia_chi like "%Vinh" or k.dia_chi like "%Quảng Ngãi");

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa 
-- trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng 
-- đặt vào 6 tháng đầu năm 2021.

select h.ma_hop_dong, n.ho_ten, k.so_dien_thoai, d.ten_dich_vu, hc.so_luong
from hop_dong h
join hop_dong_chi_tiet hc
on h.ma_hop_dong=hc.ma_hop_dong
join nhan_vien n
on h.ma_nhan_vien=n.ma_nhan_vien
join dich_vu d
on h.ma_dich_vu=d.ma_dich_vu
join khach_hang k
on k.ma_khach_hang=h.ma_khach_hang
join dich_vu_di_kem dk
on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
where quarter(h.ngay_lam_hop_dong)=4
group by h.ma_khach_hang, h.ma_hop_dong;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select dk.ma_dich_vu_di_kem, sum(hc.so_luong) as tong_so
from dich_vu_di_kem dk
join hop_dong_chi_tiet hc
on dk.ma_dich_vu_di_kem=hc.ma_dich_vu_di_kem
left join hop_dong h
on hc.ma_hop_dong=h.ma_hop_dong
group by dk.ma_dich_vu_di_kem
having tong_so=1;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
use furama;

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
) ;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, 
-- ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hc.ma_dich_vu_di_kem, dk.ten_dich_vu_di_kem, sum(hc.so_luong) as tong_so
from dich_vu_di_kem dk
join hop_dong_chi_tiet hc
on dk.ma_dich_vu_di_kem=hc.ma_dich_vu_di_kem
group by dk.ma_dich_vu_di_kem
having tong_so=1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa
--  3 hợp đồng từ năm 2020 đến 2021.
select n.ma_nhan_vien, n.ho_ten
from nhan_vien n
left join hop_dong h
on n.ma_nhan_vien=h.ma_nhan_vien
where year(h.ngay_lam_hop_dong) between 2020 and 2021
group by n.ma_nhan_vien
having count(n.ma_nhan_vien)<=3;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates=0;
update nhan_vien
set is_delete=1
where ma_nhan_vien not in (
	select h.ma_nhan_vien
	from hop_dong h
    where year(h.ngay_lam_hop_dong) between 2019 and 2020
);
set sql_safe_updates=1;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

set sql_safe_updates=0;
update khach_hang
set ma_loai_khach=1
where ma_khach_hang in (
select source.ma_khach_hang
from
(select k.ma_khach_hang, l.ten_loai_khach, (ifnull(d.chi_phi_thue,0)+sum(ifnull(hc.so_luong,0)*ifnull(dk.gia, 0))) as chi_phi
from loai_khach l
join khach_hang k
on l.ma_loai_khach=k.ma_loai_khach
join hop_dong h
on k.ma_khach_hang=h.ma_khach_hang
join dich_vu d
on h.ma_dich_vu=d.ma_dich_vu
join hop_dong_chi_tiet hc
on h.ma_hop_dong=hc.ma_hop_dong
join dich_vu_di_kem dk
on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
where l.ten_loai_khach="Platinium" and year(h.ngay_lam_hop_dong)=2021
group by h.ma_khach_hang, h.ma_hop_dong
having chi_phi<10000000) as source);
set sql_safe_updates=1;
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set sql_safe_updates=0;
update khach_hang
set is_delete=1
where ma_khach_hang in (
	select h.ma_khach_hang
	from hop_dong h
	where year(h.ngay_lam_hop_dong)<2021
);
set sql_safe_updates=1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates=0;
update dich_vu_di_kem
set gia=gia*2
where ma_dich_vu_di_kem in (
	select source.ma_dich_vu_di_kem from (
		select dk.ma_dich_vu_di_kem
		from dich_vu_di_kem dk
		join hop_dong_chi_tiet hc
		on dk.ma_dich_vu_di_kem=hc.ma_dich_vu_di_kem
		join hop_dong h
		on hc.ma_hop_dong=h.ma_hop_dong
		where year(h.ngay_lam_hop_dong)=2020
		group by dk.ma_dich_vu_di_kem
		having sum(hc.so_luong)>10
    ) as source
);
set sql_safe_updates=1;



select dk.ma_dich_vu_di_kem
from dich_vu_di_kem dk
join hop_dong_chi_tiet hc
on dk.ma_dich_vu_di_kem=hc.ma_dich_vu_di_kem
join hop_dong h
on hc.ma_hop_dong=h.ma_hop_dong
where year(h.ngay_lam_hop_dong)=2020
group by dk.ma_dich_vu_di_kem
having sum(hc.so_luong)>10




