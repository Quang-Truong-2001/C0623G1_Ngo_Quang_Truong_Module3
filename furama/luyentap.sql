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

