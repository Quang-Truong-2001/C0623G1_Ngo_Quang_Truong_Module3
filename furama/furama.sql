CREATE DATABASE furama;
			USE furama;
CREATE TABLE vi_tri(
	ma_vi_tri 	INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri	VARCHAR(45)
);
CREATE TABLE trinh_do(
	ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45)
);
CREATE TABLE bo_phan(
	ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45)
);
CREATE TABLE nhan_vien(
	ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
	ho_ten VARCHAR(45),
    ngay_sinh date,
    so_cmnd VARCHAR(45),
    luong double,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri int,
    foreign key (ma_vi_tri) references `vi_tri`(ma_vi_tri),
    ma_trinh_do int,
    foreign key (ma_trinh_do) references `trinh_do`(ma_trinh_do),
    ma_bo_phan int,
    foreign key (ma_bo_phan) references `bo_phan`(ma_bo_phan)
);
CREATE TABLE loai_khach(
	ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45)
);
CREATE TABLE khach_hang(
	ma_khach_hang INT,
    foreign key (ma_khach_hang) references `loai_khach`(ma_loai_khach),
    ho_ten VARCHAR(45),
    ngay_sinh date,
    gioi_tinh bit(1),
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    dia_chi VARCHAR(45)
);
CREATE TABLE kieu_thue(
	ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45)
);
CREATE TABLE loai_dich_vu(
	ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE dich_vu(
	ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45),
    dien_tich int,
    chi_phi_thue double,
    so_nguoi_toi_da int,
    ma_kieu_thue int,
    foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
    ma_loai_dich_vu int,
    foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi double,
    so_tang int,
    dich_vu_mien_phi_di_kem text
);
CREATE TABLE dich_vu_di_kem(
	ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45),
    gia double,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45)
);
CREATE TABLE hop_dong(
	ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc datetime,
    tien_dat_coc double,
    ma_nhan_vien int,
    foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    ma_khach_hang int,
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
    ma_dich_vu int,
    foreign key (ma_dich_vu) references dich_vu (ma_dich_vu)
);
CREATE TABLE hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    ma_hop_dong int,
    foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
    ma_dich_vu_di_kem int,
    foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
    so_luong int
);

    

