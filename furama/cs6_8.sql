use furama;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả 
-- các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 
-- (Quý 1 là tháng 1, 2, 3).
SELECT 
    d.ma_dich_vu,
    d.ten_dich_vu,
    d.dien_tich,
    d.chi_phi_thue,
    ld.ten_loai_dich_vu
FROM
    dich_vu d
        JOIN
    loai_dich_vu ld ON d.ma_loai_dich_vu = ld.ma_loai_dich_vu
WHERE
    d.ma_dich_vu NOT IN (SELECT 
            d.ma_dich_vu
        FROM
            hop_dong h
                JOIN
            dich_vu d ON h.ma_dich_vu = d.ma_dich_vu
        WHERE
            QUARTER(h.ngay_lam_hop_dong) = 1);
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
--  ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong 
--  năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT 
    d.ma_dich_vu,
    d.ten_dich_vu,
    d.dien_tich,
    d.so_nguoi_toi_da,
    d.chi_phi_thue,
    ld.ten_loai_dich_vu
FROM
    dich_vu d
        JOIN
    loai_dich_vu ld ON d.ma_loai_dich_vu = ld.ma_loai_dich_vu
WHERE
    d.ma_dich_vu NOT IN (SELECT 
            d.ma_dich_vu
        FROM
            hop_dong h
                JOIN
            dich_vu d ON h.ma_dich_vu = d.ma_dich_vu
        WHERE
            YEAR(h.ngay_lam_hop_dong) = 2021)
        AND d.ma_dich_vu IN (SELECT 
            d.ma_dich_vu
        FROM
            hop_dong h
                JOIN
            dich_vu d ON h.ma_dich_vu = d.ma_dich_vu
        WHERE
            YEAR(h.ngay_lam_hop_dong) = 2020);

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- cách 1:
SELECT DISTINCT
    k.ho_ten
FROM
    khach_hang k;
-- cách 2: 
SELECT 
    k.ho_ten
FROM
    khach_hang k
GROUP BY k.ho_ten;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng 
-- trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT 
    MONTH(h.ngay_lam_hop_dong) AS 'thang',
    COUNT(k.ma_khach_hang) AS 'so khach hang'
FROM
    khach_hang k
        JOIN
    hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
GROUP BY MONTH(h.ngay_lam_hop_dong)
ORDER BY MONTH(h.ngay_lam_hop_dong);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị
--  bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa 
--  trên việc sum so_luong ở dich_vu_di_kem).

SELECT 
    h.ma_hop_dong,
    h.ngay_lam_hop_dong,
    h.ngay_ket_thuc,
    h.tien_dat_coc,
    SUM(IFNULL(hc.so_luong, 0)) AS 'so luong'
FROM
    hop_dong h
        LEFT JOIN
    hop_dong_chi_tiet hc ON h.ma_hop_dong = hc.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dk ON hc.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
GROUP BY h.ma_hop_dong;