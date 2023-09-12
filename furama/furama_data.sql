USE furama;
INSERT INTO vi_tri(ten_vi_tri)
	VALUES('Quản lý'),('Nhân viên');
INSERT INTO trinh_do(ten_trinh_do)
	VALUES('Trung cấp'),('Cao đẳng'),('Đại học'),('Sau đại học');
INSERT INTO bo_phan(ten_bo_phan)
	VALUES('Sale Marketing'),('Hành Chính'),('Phục vụ'),('Quản lý');
INSERT INTO loai_khach(ten_loai_khach)
	VALUES('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');
INSERT INTO kieu_thue(ten_kieu_thue)
	VALUES('year'),('month'),('day'),('hour');
INSERT INTO loai_dich_vu(ten_loai_dich_vu)
	VALUES('Villa'),('House'),('Room');
INSERT INTO dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
	VALUES('Karaoke', 10000,'giờ tiện nghi','hiện tại'),
		  ('Thuê xe máy',10000 ,'chiếc','hỏng 1 xe'),
		  ('Thuê xe đạp', 20000,'chiếc','tốt'),
		  ('Buffet buổi sáng', 15000,'suất','đầy đủ đồ ăn,tráng miệng'),
		  ('Buffet buổi trưa', 90000,'suất','đầy đủ đồ ăn,tráng miệng'),
		  ('Buffet buổi tối', 16000,'suất','đầy đủ đồ ăn,tráng miệng');
INSERT INTO nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
	VALUES('Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
		  ('Lê Văn Bình','1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2),
		  ('Hồ Thị Yến','1995-12-12','999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
		  ('Võ Công Toản','1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
		  ('Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
		  ('Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
		  ('Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
		  ('Nguyễn Hà Đông','1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
		  ('Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
		  ('Nguyễn Công Đạo','1994-01-08','755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);

