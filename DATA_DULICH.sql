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

Create table [BLOG]
(
	[MABLOG] Bigint Identity NOT NULL,
	[TAIKHOAN_ADMIN] Varchar(100) NOT NULL,
	[TENBLOG] Nvarchar(200) NULL,
	[NOIDUNG] Nvarchar(4000) NULL,
	[NGAYDANG] Datetime NULL,
	[HINHBLOG] Varchar(100) NULL,
Primary Key ([MABLOG])
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
Alter table [BLOG] add  foreign key([TAIKHOAN_ADMIN]) references [ADMIN] ([TAIKHOAN_ADMIN])  on update no action on delete no action 
go

select *from NHANVIEN
INSERT INTO NHANVIEN (TAIKHOAN_NV,MATKHAU_NV,TENNV,GIOITINH,NGAYSINH,CMND_CCCD_NV) 
VALUES ('trong01_06','123',N'NGUYỄN MINH TRỌNG','NAM','01/03/2002','012345678911'),
('quang02_06','123',N'NGUYÊN TRÍ QUANG','NAM','01/05/2002','012345678912'),
('teo03_06','123',N'LÊ QUANG TÈO','NAM','05/07/2002','012345678913'),
('huong04_06','123',N'TRẦN THỊ HƯƠNG','NAM','07/09/2002','012345678914'),
('phong05_06','123',N'CAO THÀNH PHONG','NAM','09/11/2002','012345678915'),
('vuong06_06','123',N'NGUYỄN BÁ VƯƠNG','NAM','11/12/2002','012345678916')



select *from KHACHHANG
INSERT INTO KHACHHANG (TENKH,TAIKHOAN_KH,MATKHAU_KH,EMAIL,GIOITINH,NGAYSINH,CMND_CCCD_KH)
VALUES 
(N'ĐOÀN TRUNG KIÊN','KIENVUS45','123','DTKVUS@gmail.com','NAM','25/5/2002','123456789011'),
(N'NGUYỄN VIỆT TRUNG','TRUNGSKULL','123','TSKULL@gmail.com','NAM','12/3/2002','123456789012'),
(N'NGUYỄN MINH TUẤN','TUANVUI','123','TUANVUI1203@gmail.com','NAM','15/5/2002','123456789013'),
(N'DƯƠNG VĂN TIỄN','TIENCOLD','123','DVTC@gmail.com','NAM','28/7/2002','123456789014'),
(N'LÊ THỊ HỒNG','HONGDAO','123','HD1505@gmail.com','NAM','30/6/2002','123456789015'),
(N'HỨA CAO TIẾN','CAOTIEN','123','TBCAOTIEN@gmail.com','NAM','20/3/2002','123456789016')

select *from DICHVU
INSERT INTO DICHVU (TENDV,GIADV)
VALUES (N'Thuê xe máy',120000),
(N'Câu cá',200000),
(N'TẮM BIỂN',150000)

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
(N'DU LỊCH SINH THÁI'),
(N'DU LỊCH NGHỈ DƯỠNG'),
(N'DU LỊCH LỊCH TEAM BUILDING'),
(N'DU LỊCH GIẢI TRÍ')


select *from TOURDL
INSERT INTO TOURDL (MADIADIEM,MALOAITOUR,TENTOUR,HINHTOUR,TIENTOUR)
VALUES (1,1,N'DU LỊCH NGẮM HOA ANH ĐÀO - ĐÀ LẠT','HinhTour1.jpg',1500000),
(4,4,N'DU LỊCH BIỂN - ĐÀ NẴNG','HinhTour2.jpg',700000),
(2,2,N'DU LỊCH THAM QUAN DI TÍCH LỊCH SỬ - HỘI AN','HinhTour3.jpg',800000),
(5,3,N'DU LỊCH THAM QUAN SAN HÔ - PHÚ QUỐC','HinhTour4.jpg',900000),
(6,4,N'DU LỊCH VỊNH HẠ LONG- HẠ LONG','HinhTour5.jpg',2500000),
(4,3,N'DU LỊCH BIỂN NHA TRANG- NHA TRANG','HinhTour6.jpg',3200000)

select *from PHIEUDATTOUR
INSERT INTO PHIEUDATTOUR (MANV,MAKH,NGAYDAT)
VALUES (1,2,'30/3/2022'),
(2,7,'31/3/2022'),
(3,8,'20/1/2023'),
(4,5,'31/3/2019'),
(5,2,'19/9/2022'),
(5,1,'31/3/2021')

select *from CT_DICHVU
INSERT INTO CT_DICHVU (MAPDT,MADV)
VALUES (3,1),
(4,2)

select *from CT_TOUR
INSERT INTO CT_TOUR (MAPDT,MATOUR,NGAYDI,NGAYVE,SOLUONGKHACH,DANHGIATUKHACHHANG)
VALUES (13,2,'15/3/2023','18/3/2003','4',N'Tuyệt vời'),
		(14,1,'31/3/2023','17/6/2003','6',N'Chán chết'),
		(1,7,'31/3/2023','9/1/2018','6',N'Cũng được'),
		(2,5,'31/3/2023','1/3/2023','6',N'Phong cảnh hữu tình'),
		(15,9,'31/3/2023','12/7/2022','6',N'Không khí trong lành '),
		(2,10,'31/3/2023','18/3/2021','6',N'Hướng dẫn viên chưa nhiệt tình')

select *from ADMIN
INSERT INTO ADMIN (TAIKHOAN_ADMIN,MATKHAU_ADMIN)
VALUES ('admin','1234567'),
<<<<<<< HEAD
('giamdoc','1234567')

select * from BLOG
INSERT INTO BLOG (TAIKHOAN_ADMIN,TENBLOG,NOIDUNG,NGAYDANG,HINHBLOG)
VALUES ('admin',N'Du lịch đà lạt vui như thế nào!!!','Lorem ipsum dolor sit amet, 
consectetur adipiscing elit. Integer nec diam a nibh pellentesque vestibulum.
Proin suscipit vel metus eu posuere. Sed elementum, nunc ut pharetra lobortis,
magna neque tincidunt arcu, non auctor libero erat quis quam. Integer in dapibus massa. 
Duis rutrum nulla eget eros cursus, in imperdiet magna lacinia. Nunc pellentesque diam 
sed porttitor mollis. Phasellus a quam pellentesque, cursus lectus volutpat, posuere elit. 
Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
Donec nec turpis elit. Pellentesque mi est, efficitur ut faucibus et, interdum in dolor. 
Mauris aliquam ex est, vitae ultricies orci convallis non. Nulla facilisi.
Donec mollis quam justo, ut consectetur metus rutrum vitae. Morbi rhoncus semper urna, 
ac semper quam maximus vel. Phasellus convallis ligula leo, vel convallis neque vestibulum et.
Nunc in accumsan sapien. Mauris suscipit, urna pulvinar pharetra hendrerit, libero justo porttitor nunc, 
non vestibulum libero orci sit amet nibh. Sed tristique mollis neque, non vehicula tellus sodales ut. 
Quisque auctor odio a placerat suscipit. Quisque vel suscipit magna, a fringilla tellus. 
Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur eu dolor et massa 
aliquam varius in eget massa. Vivamus consequat est mi, et sollicitudin magna pharetra sed. Aenean 
sit amet urna molestie, pulvinar ipsum a, facilisis lacus. Suspendisse mi ex, posuere id lobortis sed, 
rutrum quis lacus. Phasellus maximus sollicitudin dolor, non aliquam erat scelerisque vitae. Nam eleifend velit purus.','7/3/2023','HinhBlog1.jpg'),
('admin',N'Du lịch Hạ Long!!!','Lorem ipsum dolor sit amet, 
consectetur adipiscing elit. Integer nec diam a nibh pellentesque vestibulum.
Proin suscipit vel metus eu posuere. Sed elementum, nunc ut pharetra lobortis,
magna neque tincidunt arcu, non auctor libero erat quis quam. Integer in dapibus massa. 
Duis rutrum nulla eget eros cursus, in imperdiet magna lacinia. Nunc pellentesque diam 
sed porttitor mollis. Phasellus a quam pellentesque, cursus lectus volutpat, posuere elit. 
Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
Donec nec turpis elit. Pellentesque mi est, efficitur ut faucibus et, interdum in dolor. 
Mauris aliquam ex est, vitae ultricies orci convallis non. Nulla facilisi.
Donec mollis quam justo, ut consectetur metus rutrum vitae. Morbi rhoncus semper urna, 
ac semper quam maximus vel. Phasellus convallis ligula leo, vel convallis neque vestibulum et.
Nunc in accumsan sapien. Mauris suscipit, urna pulvinar pharetra hendrerit, libero justo porttitor nunc, 
non vestibulum libero orci sit amet nibh. Sed tristique mollis neque, non vehicula tellus sodales ut. 
Quisque auctor odio a placerat suscipit. Quisque vel suscipit magna, a fringilla tellus. 
Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur eu dolor et massa 
aliquam varius in eget massa. Vivamus consequat est mi, et sollicitudin magna pharetra sed. Aenean 
sit amet urna molestie, pulvinar ipsum a, facilisis lacus. Suspendisse mi ex, posuere id lobortis sed, 
rutrum quis lacus. Phasellus maximus sollicitudin dolor, non aliquam erat scelerisque vitae. Nam eleifend velit purus.','12/8/2023','HinhBlog2.jpg'),
('admin',N'Du lịch Phú Quốc!!!','Lorem ipsum dolor sit amet, 
consectetur adipiscing elit. Integer nec diam a nibh pellentesque vestibulum.
Proin suscipit vel metus eu posuere. Sed elementum, nunc ut pharetra lobortis,
magna neque tincidunt arcu, non auctor libero erat quis quam. Integer in dapibus massa. 
Duis rutrum nulla eget eros cursus, in imperdiet magna lacinia. Nunc pellentesque diam 
sed porttitor mollis. Phasellus a quam pellentesque, cursus lectus volutpat, posuere elit. 
Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 
Donec nec turpis elit. Pellentesque mi est, efficitur ut faucibus et, interdum in dolor. 
Mauris aliquam ex est, vitae ultricies orci convallis non. Nulla facilisi.
Donec mollis quam justo, ut consectetur metus rutrum vitae. Morbi rhoncus semper urna, 
ac semper quam maximus vel. Phasellus convallis ligula leo, vel convallis neque vestibulum et.
Nunc in accumsan sapien. Mauris suscipit, urna pulvinar pharetra hendrerit, libero justo porttitor nunc, 
non vestibulum libero orci sit amet nibh. Sed tristique mollis neque, non vehicula tellus sodales ut. 
Quisque auctor odio a placerat suscipit. Quisque vel suscipit magna, a fringilla tellus. 
Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur eu dolor et massa 
aliquam varius in eget massa. Vivamus consequat est mi, et sollicitudin magna pharetra sed. Aenean 
sit amet urna molestie, pulvinar ipsum a, facilisis lacus. Suspendisse mi ex, posuere id lobortis sed, 
rutrum quis lacus. Phasellus maximus sollicitudin dolor, non aliquam erat scelerisque vitae. Nam eleifend velit purus.','1/2/2022','HinhBlog3.jpg')
=======

('giamdoc','1234567')

>>>>>>> 5a5feeb86230fe8b59643f631b9bd4e3b79d334d
