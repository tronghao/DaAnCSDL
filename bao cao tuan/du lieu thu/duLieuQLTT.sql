CREATE DATABASE QLTT
GO

USE QLTT
GO

CREATE TABLE KHOA(
	MaKhoa varchar(10),
	TenKhoa nvarchar(30)
	PRIMARY KEY(MaKhoa),
)
GO

CREATE TABLE BOMON(
	MaBoMon varchar(10),
	TenBoMon nvarchar(30),
	MaKhoa varchar(10),
	PRIMARY KEY(MaBoMon),
	CONSTRAINT FK_BM_K FOREIGN KEY (MaKhoa) REFERENCES KHOA(MaKhoa)
)
GO

CREATE TABLE NGANH(
	MaNganh varchar(10),
	TenNganh nvarchar(30),
	MaBoMon varchar(10),
	PRIMARY KEY(MaNganh),
	CONSTRAINT FK_N_BM FOREIGN KEY (MaBoMon) REFERENCES BOMON(MaBoMon)
)
GO

CREATE TABLE LOP(
	MaLop varchar(10),
	TenLop nvarchar(30),
	MaNganh varchar(10),
	MaBoMon varchar(10),
	PRIMARY KEY(MaLop),
	CONSTRAINT FK_L_BM FOREIGN KEY (MaBoMon) REFERENCES BOMON(MaBoMon),
	CONSTRAINT FK_L_N FOREIGN KEY (MaNganh) REFERENCES NGANH(MaNganh)
)
GO

--Them du lieu Bang KHOA
INSERT INTO KHOA VALUES('K01', N'Kỹ thuật và Công nghệ')
INSERT INTO KHOA VALUES('K02', N'Sư phạm')

--Them du lieu Bang BOMON
INSERT INTO BOMON VALUES('BM01', N'Công nghệ thông tin', 'K01')
INSERT INTO BOMON VALUES('BM02', N'Điện – Điện tử', 'K01')
INSERT INTO BOMON VALUES('BM03', N'Sư phạm mầm non', 'K02')
INSERT INTO BOMON VALUES('BM04', N'Sư phạm tiểu học', 'K02')

--Them du lieu Bang NGANH
INSERT INTO NGANH VALUES('N01', N'Công nghệ thông tin', 'BM01')
INSERT INTO NGANH VALUES('N02', N'Quản trị mạng', 'BM01')
INSERT INTO NGANH VALUES('N03', N'Hệ thống điện', 'BM02')
INSERT INTO NGANH VALUES('N04', N'Điện công nghiệp', 'BM02')
INSERT INTO NGANH VALUES('N05', N'Giáo dục mầm non', 'BM03')
INSERT INTO NGANH VALUES('N06', N'Giáo dục tiểu học', 'BM04')

--Them du lieu Bang LOP
INSERT INTO LOP VALUES('', N'', '', '')


--Kiem tra du lieu
SELECT * FROM KHOA
SELECT * FROM BOMON
SELECT * FROM NGANH

--Xoa
DROP TABLE KHOA
DROP TABLE BOMON