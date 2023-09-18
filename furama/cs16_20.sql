use furama;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
alter table nhan_vien
add is_delete bit default 0;


update nhan_vien
set is_delete=1
where ma_nhan_vien NOT IN (select h.ma_nhan_vien
		from hop_dong h
        where year(h.ngay_lam_hop_dong) between 2019 and 2021
);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
set sql_safe_updates=0;
UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_khach_hang IN (SELECT 
            source.ma_khach_hang
        FROM
            (SELECT 
                k.ma_khach_hang,
                    k.ho_ten,
                    h.ma_hop_dong,
                    d.ten_dich_vu,
                    d.chi_phi_thue,
                    (IFNULL(d.chi_phi_thue, 0) + SUM(IFNULL(hc.so_luong, 0) * IFNULL(dk.gia, 0))) AS total_price
            FROM
                khach_hang k
            JOIN hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
            JOIN dich_vu d ON h.ma_dich_vu = d.ma_dich_vu
            LEFT JOIN hop_dong_chi_tiet hc ON h.ma_hop_dong = hc.ma_hop_dong
            LEFT JOIN dich_vu_di_kem dk ON hc.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
            LEFT JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
            WHERE YEAR(h.ngay_lam_hop_dong) = 2021
            GROUP BY h.ma_khach_hang , h.ma_hop_dong
            ORDER BY k.ma_khach_hang) AS source
        GROUP BY source.ma_khach_hang
        HAVING SUM(source.total_price) > 1000000);
set sql_safe_updates=1;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

alter table khach_hang
add is_delete bit default 0;

set sql_safe_updates=0;
update khach_hang
set is_delete=1
where ma_khach_hang in (
	select h.ma_khach_hang
	from  hop_dong h
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
		from hop_dong_chi_tiet hc
		join dich_vu_di_kem dk
		on hc.ma_dich_vu_di_kem=dk.ma_dich_vu_di_kem
		join hop_dong h
		on hc.ma_hop_dong=h.ma_hop_dong
		where year(h.ngay_lam_hop_dong)=2020 
		group by dk.ma_dich_vu_di_kem
		having sum(hc.so_luong)>10
    ) as source
);
set sql_safe_updates=1;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select n.ma_nhan_vien, n.ho_ten, n.email, n.so_dien_thoai, n.ngay_sinh, n.dia_chi
from nhan_vien n
union
select k.ma_khach_hang, k.ho_ten, k.email, k.so_dien_thoai, k.ngay_sinh, k.dia_chi
from khach_hang k;
