CREATE DATABASE ss02;
USE ss02;
CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT PRIMARY KEY AUTO_INCREMENT,
    ten_nha_cung_cap VARCHAR(45) NOT NULL,
    dia_chi VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL
);
CREATE TABLE don_dat_hang (
    so_don_hang INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dat_hang DATETIME NOT NULL,
    ma_nha_cung_cap INT,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATETIME NOT NULL
);
CREATE TABLE phieu_nhap (
    so_phieu_nhap INT PRIMARY KEY AUTO_INCREMENT,
    ngay_nhap DATETIME NOT NULL
);
CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
    ten_vat_tu VARCHAR(45) NOT NULL
);
CREATE TABLE nhap_vat_tu (
    so_phieu_nhap INT,
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap),
    ma_vat_tu INT,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    don_gia_nhap DOUBLE NOT NULL,
    so_luong_nhap INT NOT NULL
);
CREATE TABLE xuat_vat_tu (
    so_phieu_xuat INT,
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    ma_vat_tu INT,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    don_gia_xuat DOUBLE NOT NULL,
    so_luong_xuat INT NOT NULL
);
CREATE TABLE dat_vat_tu (
    so_don_hang INT,
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_don_hang),
    ma_vat_tu INT,
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);
