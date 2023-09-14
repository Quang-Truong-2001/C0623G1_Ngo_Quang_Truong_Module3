use furama;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong 
-- các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from nhan_vien
where char_length(ho_ten)<=15 and ho_ten regexp"^(h|t|k)";


-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * 
from khach_hang 
where (((floor(datediff(curdate(),ngay_sinh)/365)) between 18 and 50)
	and (dia_chi like "%Da Nang" or  dia_chi like "%Quang Tri"));

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(khach_hang.ma_khach_hang) 
from khach_hang
join loai_khach
on	khach_hang.ma_loai_khach=loai_khach.ma_loai_khach
inner join hop_dong
on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
where loai_khach.ten_loai_khach="diamond"
group by khach_hang.ma_khach_hang;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong,
--  ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + 
--  Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng 
--  cũng phải hiển thị ra).
select k.ma_khach_hang, k.ho_ten, l.ten_loai_khach, h.ma_hop_dong, d.ten_dich_vu, h.ngay_lam_hop_dong,(ifnull(d.chi_phi_thue,0)+sum(ifnull(hc.so_luong,0)*ifnull(dk.gia,0))) as total_price
from khach_hang k
join loai_khach l
on	k.ma_loai_khach=l.ma_loai_khach
left join hop_dong h
on k.ma_khach_hang=h.ma_khach_hang
left join dich_vu d
on h.ma_dich_vu=d.ma_dich_vu
left join loai_dich_vu ld
on d.ma_loai_dich_vu=ld.ma_loai_dich_vu
left join  hop_dong_chi_tiet hc
on h.ma_hop_dong=hc.ma_hop_dong
left join  dich_vu_di_kem dk
on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
group by k.ma_khach_hang, h.ma_hop_dong
order by k.ma_khach_hang;