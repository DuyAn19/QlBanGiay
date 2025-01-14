﻿Drop  DATABASE CuaHangBanHang_1;

CREATE DATABASE CuaHangBanHang_1;
USE CuaHangBanHang_1;

CREATE TABLE KHUYENMAI(
ID_KHUYENMAI VARCHAR(10) PRIMARY KEY  ,
TENKHUYENMAI NVARCHAR(50) ,
NGAYTAO DATETIME,
NGAYHETHAN DATETIME,
TRANGTHAI NVARCHAR(50),
SOPHANTRAMKHUYENMAI DECIMAL(18, 2),
SOLUONG INT,
NGAYBATDAU DATETIME,
)

CREATE TABLE KHACHHANG(
ID_KHACHHANG int IDENTITY(1,1) PRIMARY KEY,
HOVATEN NVARCHAR(50),
SDT VARCHAR(15),
DIACHI NVARCHAR(50),
)
CREATE TABLE  CHUCVU(
ID_CHUCVU int IDENTITY(1,1) PRIMARY KEY ,
TENCHUCVU NVARCHAR(50),

)
CREATE TABLE  CHATLIEU(
ID_CHATLIEU int IDENTITY(1,1) PRIMARY KEY ,
TENCHATLIEU NVARCHAR(50),
)
CREATE TABLE MAU(
ID_MAU int IDENTITY(1,1) PRIMARY KEY ,
TENMAU NVARCHAR(50),
)
CREATE TABLE KICHTHUOC(
ID_KICHTHUOC int IDENTITY(1,1) PRIMARY KEY,
SIZE INT,

)
CREATE TABLE LOAISANPHAM (
ID_LOAISANPHAM int IDENTITY(1,1) PRIMARY KEY ,
TENLOAISANPHAM NVARCHAR(50),
)
CREATE TABLE THUONGHIEU(
ID_THUONGHIEU int IDENTITY(1,1)	PRIMARY KEY ,
TENTHUONGHIEU NVARCHAR(50),
)
CREATE TABLE NHANVIEN(
ID_NHANVIEN int IDENTITY(1,1) PRIMARY KEY ,
HOVATEN NVARCHAR(50),
GIOITINH NVARCHAR(5),
SDT Varchar(10),
DIACHI NVARCHAR(50),
ID_CHUCVU int FOREIGN KEY REFERENCES CHUCVU(ID_CHUCVU),
NGAYSINH DATETIME,
MATKHAU NVARCHAR(50),
)
-- Thêm cột ID_NHANVIEN vào bảng SANPHAM
ALTER TABLE SANPHAM 
ADD ID_NHANVIEN int,
FOREIGN KEY (ID_NHANVIEN) REFERENCES NHANVIEN(ID_NHANVIEN);

CREATE TABLE SANPHAM(
ID_SANPHAM int IDENTITY(1,1) PRIMARY KEY ,
ID_THUONGHIEU int FOREIGN KEY REFERENCES THUONGHIEU(ID_THUONGHIEU),
TENSANPHAM NVARCHAR(50) ,
MOTA text,
)


-- Thêm cột ID_NHANVIEN vào bảng SANPHAMCT
ALTER TABLE SANPHAMCT 
ADD ID_NHANVIEN int,
FOREIGN KEY (ID_NHANVIEN) REFERENCES NHANVIEN(ID_NHANVIEN);

CREATE TABLE SANPHAMCT(
ID_SANPHAMCT int IDENTITY(1,1) PRIMARY KEY NOT NULL,
ID_KICHTHUOC int FOREIGN KEY REFERENCES KICHTHUOC(ID_KICHTHUOC),
ID_MAU int FOREIGN KEY REFERENCES MAU(ID_MAU),
SOLUONG INT,
ID_CHATLIEU int FOREIGN KEY REFERENCES CHATLIEU(ID_CHATLIEU),
ID_SANPHAM int FOREIGN KEY REFERENCES SANPHAM(ID_SANPHAM),
DONGIA FLOAT,
ID_LOAISANPHAM int FOREIGN KEY REFERENCES LOAISANPHAM(ID_LOAISANPHAM)

)

-- Thêm cột ID_NHANVIEN vào bảng HOADON
ALTER TABLE HOADON 
ADD ID_NHANVIEN int,
FOREIGN KEY (ID_NHANVIEN) REFERENCES NHANVIEN(ID_NHANVIEN);

ALTER TABLE HOADON 
ADD PHUONGTHUCTHANHTOAN NVARCHAR(50) NULL;

CREATE TABLE HOADON(
ID_HOADON int IDENTITY(1,1) PRIMARY KEY NOT NULL,
NGAYTAO DATETIME,
TONGTIEN FLOAT,
ID_KHACHHANG int FOREIGN KEY REFERENCES KHACHHANG(ID_KHACHHANG),
ID_KHUYENMAI VARCHAR(10) FOREIGN KEY REFERENCES KHUYENMAI(ID_KHUYENMAI),
TRANGTHAI NVARCHAR(50),
)
drop table HOADONCT
CREATE TABLE HOADONCT(
    ID_HOADONCT int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    SOLUONG INT,
    GIASP FLOAT,
    TRANGTHAI NVARCHAR(30),
    ID_SANPHAMCT int FOREIGN KEY REFERENCES SANPHAMCT(ID_SANPHAMCT),
    ID_HOADON INT FOREIGN KEY REFERENCES HOADON(ID_HOADON)
);
drop table HOADONCT

-- Select toàn bộ dữ liệu từ bảng KHUYENMAI
SELECT * FROM KHUYENMAI;

-- Select toàn bộ dữ liệu từ bảng KHACHHANG
SELECT * FROM KHACHHANG;

-- Select toàn bộ dữ liệu từ bảng CHUCVU
SELECT * FROM CHUCVU;

-- Select toàn bộ dữ liệu từ bảng CHATLIEU
SELECT * FROM CHATLIEU;

-- Select toàn bộ dữ liệu từ bảng MAU
SELECT * FROM MAU;

-- Select toàn bộ dữ liệu từ bảng KICHTHUOC
SELECT * FROM KICHTHUOC;

-- Select toàn bộ dữ liệu từ bảng LOAISANPHAM
SELECT * FROM LOAISANPHAM;

-- Select toàn bộ dữ liệu từ bảng THUONGHIEU
SELECT * FROM THUONGHIEU;

-- Select toàn bộ dữ liệu từ bảng NHANVIEN
SELECT * FROM NHANVIEN;

-- Select toàn bộ dữ liệu từ bảng SANPHAM
SELECT * FROM SANPHAM;

-- Select toàn bộ dữ liệu từ bảng SANPHAMCT
SELECT * FROM SANPHAMCT;

-- Select toàn bộ dữ liệu từ bảng HOADONCT
SELECT * FROM HOADONCT;

-- Select toàn bộ dữ liệu từ bảng HOADON
SELECT * FROM HOADON;
-- Dữ liệu cho bảng KHUYENMAI
-- Chèn dữ liệu vào bảng KHUYENMAI
INSERT INTO KHUYENMAI (ID_KHUYENMAI, TENKHUYENMAI, NGAYTAO, NGAYHETHAN, TRANGTHAI, SOPHANTRAMKHUYENMAI, SOLUONG, NGAYBATDAU)
VALUES ('KM003', N'Giảm giá 10%', '2023-03-15', '2023-04-16', N'Đang diễn ra', 10, 100, '2023-03-15'),
       ('KM004', N'Giảm giá 10%', '2024-03-15', '2024-04-15', N'Đang diễn ra', 10, 0, '2024-03-15'),
       ('KM001', N'Giảm giá 10%', '2024-03-15', '2024-04-15', N'Đang diễn ra', 10, 100, '2024-03-15'),
       ('KM002', N'Giảm giá 20%', '2024-03-10', '2024-04-10', N'Đang diễn ra', 20, 50, '2024-03-10');

INSERT INTO KHACHHANG (HOVATEN, SDT, DIACHI)
VALUES 
    (N'Nguyễn Văn A', '0987654321', N'Hà Nội'),
    (N'Trần Thị B', '0123456789', N'Hồ Chí Minh'),
    (N'Lê Thị C', '0909090909', N'Đà Nẵng'),
    (N'Phạm Văn D', '0888888888', N'Hải Phòng'),
    (N'Huỳnh Văn E', '0777777777', N'Bình Dương'),
    (N'Võ Thị F', '0666666666', N'Cần Thơ'),
    (N'Đặng Văn G', '0555555555', N'Hải Dương'),
    (N'Hoàng Thị H', '0444444444', N'Đồng Nai'),
    (N'Ngô Văn I', '0333333333', N'Vũng Tàu'),
    (N'Vương Thị K', '0222222222', N'Bình Thuận');


-- Chèn dữ liệu vào bảng CHUCVU
INSERT INTO CHUCVU (TENCHUCVU)
VALUES (N'Quản lý'),
       (N'Nhân viên bán hàng');

-- Chèn dữ liệu vào bảng CHATLIEU
INSERT INTO CHATLIEU (TENCHATLIEU)
VALUES 
    (N'Da'),
    (N'Vải'),
    (N'Suede'),
    (N'Nylon'),
    (N'Canvas');

-- Chèn dữ liệu vào bảng MAU
INSERT INTO MAU (TENMAU)
VALUES 
    (N'Do'),
    (N'Xanh'),
    (N'Vàng'),
    (N'Trắng'),
    (N'Đen'),
    (N'Hồng'),
    (N'Tím'),
    (N'Cam');


-- Chèn dữ liệu vào bảng KICHTHUOC
INSERT INTO KICHTHUOC (SIZE)
VALUES 
    (36),
	(37),
    (38),
    (40),
    (42),
    (44),
    (45);


-- Chèn dữ liệu vào bảng LOAISANPHAM
INSERT INTO LOAISANPHAM (TENLOAISANPHAM)
VALUES (N'Giày cổ cao'),
(N'Giày chạy'),
(N'Giày đi làm'),
(N'Giày thể thao'),


       (N'Giày cổ thấp');

-- Chèn dữ liệu vào bảng THUONGHIEU
INSERT INTO THUONGHIEU (TENTHUONGHIEU)
VALUES 
    (N'Puma'),
    (N'New Balance'),
    (N'Converse'),
    (N'Vans'),
    (N'Reebok'),
    (N'Under Armour');


-- Chèn dữ liệu vào bảng NHANVIEN
INSERT INTO NHANVIEN (HOVATEN, GIOITINH, SDT, DIACHI, ID_CHUCVU, NGAYSINH, MATKHAU)
VALUES 
    (N'Lê Thị C', N'Nữ', '0123456789', N'Đà Nẵng', 1, '1990-01-05', '123456'),
    (N'Phạm Văn D', N'Nam', '0987654321', N'Hải Phòng', 2, '1995-03-10', '123456'),
    (N'Nguyễn Văn E', N'Nam', '0965432109', N'Hồ Chí Minh', 1, '1988-07-15', '123abc'),
    (N'Trần Thị F', N'Nữ', '0321876543', N'Hà Nội', 2, '1992-11-20', '456xyz'),
    (N'Huỳnh Văn G', N'Nam', '0912345678', N'Vũng Tàu', 1, '1993-04-25', 'def789');
INSERT INTO SANPHAM (ID_THUONGHIEU, TENSANPHAM, MOTA, ID_NHANVIEN)
VALUES 
    (1, N'Giày thể thao', 'Giày thể thao Nike', 1),
    (2, N'Áo thun nam', 'Áo thun nam Adidas', 1),
    (1, N'Giày chạy nam', 'Giày chạy Nike', 2),
    (2, N'Giày sneaker nữ', 'Sneaker nữ Adidas', 2),
    (3, N'Giày casual nam', 'Giày casual Puma', 3),
    (1, N'Giày đá bóng', 'Giày đá bóng Nike', 3),
    (4, N'Giày slip-on nữ', 'Giày slip-on Converse', 4),
    (3, N'Giày lười nam', 'Giày lười Puma', 4),
    (5, N'Giày skate nam', 'Giày skate Vans', 5),
    (4, N'Giày thể thao nữ', 'Giày thể thao Reebok', 5);

	INSERT INTO SANPHAMCT (ID_KICHTHUOC, ID_MAU, SOLUONG, ID_CHATLIEU, ID_SANPHAM, DONGIA, ID_LOAISANPHAM)
VALUES 
    (1, 1, 20, 1, 1, 1500000, 1),
    (2, 2, 15, 2, 2, 2000000, 2),
    (3, 3, 18, 3, 3, 1800000, 1),
    (4, 4, 22, 4, 4, 2200000, 2),
    (5, 1, 16, 1, 5, 1900000, 1);

	INSERT INTO HOADON (NGAYTAO, TONGTIEN, ID_KHACHHANG, ID_KHUYENMAI, TRANGTHAI, PHUONGTHUCTHANHTOAN)
VALUES 
    ('2024-04-01', 1500000, 1, 'KM001', N'Đã thanh toán', N'Tiền mặt'),
    ('2024-04-02', 2000000, 2, 'KM002', N'Chưa thanh toán', N'Chuyển khoản');

INSERT INTO HOADONCT (SOLUONG, GIASP, TRANGTHAI, ID_SANPHAMCT, ID_HOADON)
VALUES 
    (2, 3000000, N'Đã giao hàng', 1, 1),
    (3, 3500000, N'Đang giao hàng', 2, 1),
    (1, 2000000, N'Chưa giao hàng', 3, 2),
    (4, 4000000, N'Đã giao hàng', 4, 2);
	SELECT * FROM SANPHAMCT


