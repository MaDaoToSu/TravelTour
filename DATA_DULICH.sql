use master
create database TravelTour
use TravelTour

set dateformat DMY


Create table [NHANVIEN]
(
	[MANV] Bigint Identity NOT NULL,
	[TAIKHOAN_NV] Varchar(100) NULL,
	[MATKHAU_NV] Varchar(100) NULL Check (MATKHAU_NV > 6),
	[TENNV] Nvarchar(100) NULL,
	[GIOITINH] Nvarchar(5) NULL,
	[NGAYSINH] Datetime NULL,
	[CMND_CCCD_NV] Varchar(100) NULL,
	[HINHNHANVIEN] Varchar(100) NULL,
	[SOTOURHOANTHANH] int NULL,
Primary Key ([MANV])
) 
go


Create table [PHIEUDATTOUR]
(
	[MAPDT] Bigint Identity NOT NULL,
	[MANV] Bigint NULL,
	[MAKH] Bigint NOT NULL,
	[NGAYDAT] Datetime NULL,
Primary Key ([MAPDT])
) 
go

Create table [TOURDL]
(
	[MATOUR] Bigint Identity NOT NULL,
	[MADIADIEM] Bigint NOT NULL,
	[MALOAITOUR] Bigint NOT NULL,
	[TENTOUR] Nvarchar(100) NULL,
	[HINHTOUR] Varchar(100) NULL,
	[TIENTOUR] Decimal(18,0) NULL,
Primary Key ([MATOUR])
) 
go

Create table [KHACHHANG]
(
	[MAKH] Bigint Identity NOT NULL,
	[TENKH] Nvarchar(100) NULL,
	[TAIKHOAN_KH] Varchar(100) NULL,
	[MATKHAU_KH] Varchar(100) NULL Check (MATKHAU_KH > 6),
	[EMAIL] Varchar(200) NULL,
	[GIOITINH] Nvarchar(5) NULL,
	[NGAYSINH] Datetime NULL,
	[CMND_CCCD_KH] Varchar(100) NULL,
	[HINHKHACHHANG] Varchar(100) NULL,
Primary Key ([MAKH])
) 
go

Create table [DICHVU]
(
	[MADV] Bigint Identity NOT NULL,
	[TENDV] Nvarchar(100) NULL,
	[GIADV] Decimal(18,0) NULL,
Primary Key ([MADV])
) 
go

Create table [CT_DICHVU]
(
	[MAPDT] Bigint NOT NULL,
	[MADV] Bigint NOT NULL,
Primary Key ([MAPDT],[MADV])
) 
go

Create table [CT_TOUR]
(
	[MAPDT] Bigint NOT NULL,
	[MATOUR] Bigint NOT NULL,
	[NGAYDI] Datetime NULL,
	[NGAYVE] Datetime NULL,
	[SOLUONGKHACH] Integer NULL,
	[DANHGIATUKHACHHANG] Nvarchar(4000) NULL,
Primary Key ([MAPDT],[MATOUR])
) 
go

Create table [ADMIN]
(
	[TAIKHOAN_ADMIN] Varchar(100) NOT NULL,
	[MATKHAU_ADMIN] Varchar(100) NULL Check (MATKHAU_ADMIN > 6),
Primary Key ([TAIKHOAN_ADMIN])
) 
go

Create table [LOAITOUR]
(
	[MALOAITOUR] Bigint Identity NOT NULL,
	[TENLOAITOUR] Nvarchar(100) NULL,
Primary Key ([MALOAITOUR])
) 
go

Create table [DIADIEM]
(
	[MADIADIEM] Bigint Identity NOT NULL,
	[TENDIADIEM] Nvarchar(100) NULL,
	[HINHDIADIEM] Varchar(100) NULL,
Primary Key ([MADIADIEM])
) 
go

Create table [HOADON]
(
	[MAHD] Bigint Identity NOT NULL,
	[TONGTIEN] Decimal(18,0) NULL,
	[MAPDT] Bigint NOT NULL,
Primary Key ([MAHD])
) 
go


Alter table [PHIEUDATTOUR] add  foreign key([MANV]) references [NHANVIEN] ([MANV])  on update no action on delete no action 
go
Alter table [CT_DICHVU] add  foreign key([MAPDT]) references [PHIEUDATTOUR] ([MAPDT])  on update no action on delete no action 
go
Alter table [CT_TOUR] add  foreign key([MAPDT]) references [PHIEUDATTOUR] ([MAPDT])  on update no action on delete no action 
go
Alter table [HOADON] add  foreign key([MAPDT]) references [PHIEUDATTOUR] ([MAPDT])  on update no action on delete no action 
go
Alter table [CT_TOUR] add  foreign key([MATOUR]) references [TOURDL] ([MATOUR])  on update no action on delete no action 
go
Alter table [PHIEUDATTOUR] add  foreign key([MAKH]) references [KHACHHANG] ([MAKH])  on update no action on delete no action 
go
Alter table [CT_DICHVU] add  foreign key([MADV]) references [DICHVU] ([MADV])  on update no action on delete no action 
go
Alter table [TOURDL] add  foreign key([MALOAITOUR]) references [LOAITOUR] ([MALOAITOUR])  on update no action on delete no action 
go
Alter table [TOURDL] add  foreign key([MADIADIEM]) references [DIADIEM] ([MADIADIEM])  on update no action on delete no action 
go

select *from NHANVIEN
INSERT INTO NHANVIEN (TAIKHOAN_NV,MATKHAU_NV,TENNV,GIOITINH,NGAYSINH,CMND_CCCD_NV,HINHNHANVIEN,SOTOURHOANTHANH) 
VALUES ('halamhung','123',N'HÀ LÂM HÙNG','NAM','11/12/2001','012345678912','HinhNhanVien1.jpg',20),
('nguyenhuyhoang','123',N'NGUYỄN HUY HOÀNG','NAM','11/12/2002','012345678912','HinhNhanVien2.jpg',15)

select *from KHACHHANG
INSERT INTO KHACHHANG (TENKH,TAIKHOAN_KH,MATKHAU_KH,EMAIL,GIOITINH,NGAYSINH,CMND_CCCD_KH,HINHKHACHHANG)
VALUES (N'ĐOÀN TRUNG KIÊN','DOANTRUNGKIEN','123','DTK@gmail.com','NAM','25/5/2002','123456789012','HinhKhachHang1.jpg'),
(N'NGUYỄN VIỆT TRUNG','DOANTRUNGKIEN','123','DTK@gmail.com','NAM','12/3/2002','123456789012','HinhKhachHang2.jpg')

select *from DICHVU
INSERT INTO DICHVU (TENDV,GIADV)
VALUES (N'Thuê xe máy',120000),
(N'Câu cá',200000)

select *from DIADIEM
INSERT INTO DIADIEM (TENDIADIEM,HINHDIADIEM)
VALUES (N'ĐÀ LẠT','HinhDiaDiem1.jpg'),
(N'ĐÀ NẴNG','HinhDiaDiem2.jpg'),
(N'Hội An','HinhDiaDiem3.jpg'),
(N'Nha Trang','HinhDiaDiem4.jpg'),
(N'Phú Quốc','HinhDiaDiem5.jpg'),
(N'Hạ Long','HinhDiaDiem6.jpg')

select *from LOAITOUR
INSERT INTO LOAITOUR (TENLOAITOUR)
VALUES (N'DU LỊCH THAM QUAN'),
(N'DU LỊCH LỊCH SỬ'),
(N'DU LỊCH BIỂN')

select *from TOURDL
INSERT INTO TOURDL (MADIADIEM,MALOAITOUR,TENTOUR,HINHTOUR,TIENTOUR)
VALUES (1,2,N'DU LỊCH ĐÀ NẴNG','HinhTour1.jpg',50000),
(2,1,N'DU LỊCH ĐÀ LẠT','HinhTour2.jpg',400000)

select *from PHIEUDATTOUR
INSERT INTO PHIEUDATTOUR (MANV,MAKH,NGAYDAT)
VALUES (1,2,'30/3/2002'),
(2,2,'31/3/2002')

select *from CT_DICHVU
INSERT INTO CT_DICHVU (MAPDT,MADV)
VALUES (2,1),
(1,2)

select *from CT_TOUR
INSERT INTO CT_TOUR (MAPDT,MATOUR,NGAYDI,NGAYVE,SOLUONGKHACH,DANHGIATUKHACHHANG)
VALUES (2,1,'15/3/2023','18/3/2003','4',N'Tuyệt vời, cảm giác rất tốt'),
		(1,2,'15/3/2023','18/3/2003','6',N'Tôi cảm thất chuyến du lịch rất đặc sắc')

select *from ADMIN
INSERT INTO ADMIN (TAIKHOAN_ADMIN,MATKHAU_ADMIN)
VALUES ('admin','1234567')
