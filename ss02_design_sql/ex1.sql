create database ss02;
use ss02;
create table nha_cung_cap(
	ma_nha_cung_cap int primary key auto_increment,
    ten_nha_cung_cap varchar(45),
    dia_chi varchar(45),
    so_dien_thoai varchar(45)   
);
create table don_dat_hang(
	so_don_hang int primary key auto_increment,
    ngay_dat_hang datetime,
    ma_nha_cung_cap int,
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)    
);
create table phieu_xuat(
	so_phieu_xuat int primary key auto_increment,
    ngay_xuat datetime
);
create table phieu_nhap(
	so_phieu_nhap int primary key auto_increment,
    ngay_nhap datetime
);
create table vat_tu(
	ma_vat_tu int primary key auto_increment,
    ten_vat_tu varchar(45)
);
create table nhap_vat_tu(
    so_phieu_nhap int,
    foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
    ma_vat_tu int,
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
    don_gia_nhap double,
    so_luong_nhap int
);
create table xuat_vat_tu(
	so_phieu_xuat int,
    foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
    ma_vat_tu int,
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
    don_gia_xuat double,
    so_luong_xuat int
);
create table dat_vat_tu(
	so_don_hang int,
    foreign key (so_don_hang) references don_dat_hang(so_don_hang),
    ma_vat_tu int,
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
