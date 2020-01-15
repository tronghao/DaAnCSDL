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
	PRIMARY KEY(MaNganh)
)
GO

CREATE TABLE LOP(
	MaLop varchar(10),
	TenLop nvarchar(40),
	MaNganh varchar(10),
	MaBoMon varchar(10),
	PRIMARY KEY(MaLop),
	CONSTRAINT FK_L_BM FOREIGN KEY (MaBoMon) REFERENCES BOMON(MaBoMon),
	CONSTRAINT FK_L_N FOREIGN KEY (MaNganh) REFERENCES NGANH(MaNganh)
)
GO

CREATE TABLE HOCVI(
	MaHV varchar(10),
	TenHV nvarchar(20),
	PRIMARY KEY(MaHV),
)
GO

CREATE TABLE GIANGVIEN(
	MaGV varchar(10),
	TenGV nvarchar(30),
	SDTGV varchar(10),
	EmailGV varchar(50),
	MaHV varchar(10),
	MaBoMon varchar(10),
	PRIMARY KEY(MaGV),
	CONSTRAINT FK_GV_BM FOREIGN KEY (MaBoMon) REFERENCES BOMON(MaBoMon),
	CONSTRAINT FK_GV_HV FOREIGN KEY (MaHV) REFERENCES HOCVI(MaHV)
)
GO

CREATE TABLE SINHVIEN(
	MaSV varchar(10),
	TenSV nvarchar(30),
	SDTSV varchar(10),
	EmailSV varchar(23),
	GioiTinh nvarchar(3),
	NgaySinh datetime,
	QueQuan nvarchar(20),
	MaLop varchar(10),
	PRIMARY KEY(MaSV),
	CONSTRAINT FK_SV_L FOREIGN KEY (MaLop) REFERENCES LOP(MaLop),
)
GO

CREATE TABLE KINHPHIHOTRO(
	IDKinhPhi int,
	SoKM float,
	SoTien float,
	PRIMARY KEY(IDKinhPhi),
)
GO

CREATE TABLE DONVITHUCTAP(
	MaDV varchar(10),
	TenDV nvarchar(50),
	DiaChiDV nvarchar(100),
	SDTDV varchar(10),
	PRIMARY KEY(MaDV),
)
GO

CREATE TABLE CANBODONVI(
	MaCB varchar(10),
	TenCB nvarchar(30),
	SDTCB varchar(10),
	EmailCB varchar(50),
	MaDV varchar(10),
	PRIMARY KEY(MaCB),
	CONSTRAINT FK_CBDV_DV FOREIGN KEY (MaDV) REFERENCES DONVITHUCTAP(MaDV)
)
GO

CREATE TABLE PHIEUCHAM(
	MaPhieu varchar(10),
	TenPhieu nvarchar(30),
	SoDiem float,
	NgayCham datetime,
	NhanXet nvarchar(200),
	MaSV varchar(10),
	MaGV varchar(10),
	MaCB varchar(10),
	PRIMARY KEY(MaPhieu),
	CONSTRAINT FK_PC_SV FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV),
	CONSTRAINT FK_PC_GV FOREIGN KEY (MaGV) REFERENCES GIANGVIEN(MaGV),
	CONSTRAINT FK_PC_CB FOREIGN KEY (MaCB) REFERENCES CANBODONVI(MaCB)
)
GO

CREATE TABLE CHUCVU(
	MaChucVu varchar(10),
	TenChucVu nvarchar(30),
	PRIMARY KEY(MaChucVu),
)
GO

CREATE TABLE CHITIETTHUCTAP(
	MaSV varchar(10),
	IDKinhPhi int,
	MaDV varchar(10),
	MaGV varchar(10),
	MaCB varchar(10),
	NgayBatDauThucTap datetime,
	NgayKetThucThucTap datetime,
	PRIMARY KEY(MaSV, IDKinhPhi, MADV, MaGV, MaCB),
	CONSTRAINT FK_CTTT_SV FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV),
	CONSTRAINT FK_CTTT_KP FOREIGN KEY (IDKinhPhi) REFERENCES KINHPHIHOTRO(IDKinhPhi),
	CONSTRAINT FK_CTTT_DV FOREIGN KEY (MaDV) REFERENCES DONVITHUCTAP(MaDV),
	CONSTRAINT FK_CTTT_GV FOREIGN KEY (MaGV) REFERENCES GIANGVIEN(MaGV),
	CONSTRAINT FK_CTTT_CBDV FOREIGN KEY (MaCB) REFERENCES CANBODONVI(MaCB)
)
GO


CREATE TABLE DAMNHANCHUCVU(
	MaNHD varchar(10),
	MaChucVu varchar(10),
	NgayDamNhan datetime,
	PRIMARY KEY(MaChucVu, MaNHD),
)
GO

--Them du lieu Bang KHOA
INSERT INTO KHOA VALUES('K01', N'Kỹ thuật và Công nghệ')
INSERT INTO KHOA VALUES('K02', N'Sư phạm')
GO

--Them du lieu Bang BOMON
INSERT INTO BOMON VALUES('BM01', N'Công nghệ thông tin', 'K01')
INSERT INTO BOMON VALUES('BM02', N'Điện – Điện tử', 'K01')
INSERT INTO BOMON VALUES('BM03', N'Sư phạm mầm non', 'K02')
INSERT INTO BOMON VALUES('BM04', N'Sư phạm tiểu học', 'K02')
GO

--Them du lieu Bang NGANH
INSERT INTO NGANH VALUES('N01', N'Công nghệ thông tin')
INSERT INTO NGANH VALUES('N02', N'Quản trị mạng')
INSERT INTO NGANH VALUES('N03', N'Hệ thống điện')
INSERT INTO NGANH VALUES('N04', N'Điện công nghiệp')
INSERT INTO NGANH VALUES('N05', N'Giáo dục mầm non')
INSERT INTO NGANH VALUES('N06', N'Giáo dục tiểu học')
GO

--Them du lieu Bang LOP
INSERT INTO LOP VALUES( 'DA15TT', N'Đại học Công nghệ Thông tin 2015', 'N01', 'BM01')
INSERT INTO LOP VALUES( 'DA16TT', N'Đại học Công nghệ Thông tin 2016', 'N01', 'BM01')
INSERT INTO LOP VALUES( 'DA15QTM', N'Đại học Quản trị mạng 2015', 'N02', 'BM01')
INSERT INTO LOP VALUES( 'DA16QTM', N'Đại học Quản trị mạng 2016', 'N02', 'BM01')
INSERT INTO LOP VALUES( 'DA15KDHT', N'Đại học Hệ thống điện 2015', 'N03', 'BM02')
INSERT INTO LOP VALUES( 'DA16KDHT', N'Đại học Hệ thống điện 2016', 'N03', 'BM02')
INSERT INTO LOP VALUES( 'DA15DCN', N'Đại học Điện công nghiệp 2015', 'N04', 'BM02')
INSERT INTO LOP VALUES( 'DA16DCN', N'Đại học Điện công nghiệp 2016', 'N04', 'BM02')
INSERT INTO LOP VALUES( 'DA15MN', N'Đại học giáo dục mầm non 2015', 'N05', 'BM03')
INSERT INTO LOP VALUES( 'DA16MN', N'Đại học giáo dục mầm non 2016', 'N05', 'BM03')
INSERT INTO LOP VALUES( 'DA15TH', N'Đại học giáo dục tiểu hoc 2015', 'N06', 'BM04')
INSERT INTO LOP VALUES( 'DA16TH', N'Đại học giáo dục tiểu học 2016', 'N06', 'BM04')
GO

--Them du lieu Bang HOCVI
INSERT INTO HOCVI VALUES( 'HV01', N'Tú tài')
INSERT INTO HOCVI VALUES( 'HV02', N'Cử Nhân')
INSERT INTO HOCVI VALUES( 'HV03', N'Kỹ Sư')
INSERT INTO HOCVI VALUES( 'HV04', N'Bác Sĩ')
INSERT INTO HOCVI VALUES( 'HV05', N'Dược Sĩ')
INSERT INTO HOCVI VALUES( 'HV06', N'Thạc Sĩ')
INSERT INTO HOCVI VALUES( 'HV07', N'Tiến Sĩ')
INSERT INTO HOCVI VALUES( 'HV08', N'Tiến Sĩ Khoa Học')
GO

--Them du lieu Bang GIANGVIEN
INSERT INTO GIANGVIEN VALUES( 'NHD01', N'Nhan Minh Phúc', '0918603800', 'nmphuc@tvu.edu.vn', 'HV06', 'BM01')
INSERT INTO GIANGVIEN VALUES( 'NHD02', N'Phan Thị Phương Nam', '0989236100', 'ptpnam@tvu.edu.vn', 'HV06', 'BM01')
INSERT INTO GIANGVIEN VALUES( 'NHD03', N'Dương Ngọc Vân Khanh', '0988332000', 'vankhanh@tvu.edu.vn', 'HV07', 'BM01')
INSERT INTO GIANGVIEN VALUES( 'NHD04', N'Nguyễn Bá Nhiệm', '0983303600', 'nhiemnb@tvu.edu.vn', 'HV06', 'BM01')
INSERT INTO GIANGVIEN VALUES( 'NHD05', N'Phạm Thái', '0918603801', 'pthai@tvu.edu.vn', 'HV06', 'BM02')
INSERT INTO GIANGVIEN VALUES( 'NHD06', N'Đỗ Trọng Hợp', '0989236101', 'dthop@tvu.edu.vn', 'HV07', 'BM02')
INSERT INTO GIANGVIEN VALUES( 'NHD07', N'Lâm Thành Thép', '0988332001', 'ltthep@tvu.edu.vn', 'HV06', 'BM02')
INSERT INTO GIANGVIEN VALUES( 'NHD08', N'Vũ Văn Hiếu', '0983303601', 'vvhieu@tvu.edu.vn', 'HV07', 'BM02')
INSERT INTO GIANGVIEN VALUES( 'NHD09', N'Võ Phước Hưng', '0918603802', 'vphung@tvu.edu.vn', 'HV06', 'BM03')
INSERT INTO GIANGVIEN VALUES( 'NHD10', N'Nguyễn Hoàng Duy Thiện', '0989236102', 'nhdthien@tvu.edu.vn', 'HV07', 'BM03')
INSERT INTO GIANGVIEN VALUES( 'NHD11', N'Nguyễn Bảo Ân', '0988332002', 'nban@tvu.edu.vn', 'HV06', 'BM03')
INSERT INTO GIANGVIEN VALUES( 'NHD12', N'Phạm Minh Đương', '0983303602', 'pmduong@tvu.edu.vn', 'HV06', 'BM03')
INSERT INTO GIANGVIEN VALUES( 'NHD13', N'Nguyễn Trần Diễm Hạnh', '0918603803', 'ntdhanh@tvu.edu.vn', 'HV06', 'BM04')
INSERT INTO GIANGVIEN VALUES( 'NHD14', N'Nguyễn Mộng Hiền', '0989236103', 'nmhien@tvu.edu.vn', 'HV07', 'BM04')
INSERT INTO GIANGVIEN VALUES( 'NHD15', N'Ngô Thanh Huy', '0988332003', 'nthuy@tvu.edu.vn', 'HV03', 'BM04')
INSERT INTO GIANGVIEN VALUES( 'NHD16', N'Nguyễn Nhứt Lam', '0983303603', 'nnlam@tvu.edu.vn', 'HV07', 'BM04')
GO

--Them du lieu Bang SINHVIEN
INSERT INTO SINHVIEN VALUES( '110117001', N'Nguyễn Minh Thư', '0123456781', '110117001@sv.tvu.edu.vn', N'Nữ', '1998-01-01', N'Trà Vinh', 'DA15TT')
INSERT INTO SINHVIEN VALUES( '110117002', N'Nguyễn Minh Minh', '0123456782', '110117002@sv.tvu.edu.vn', N'Nữ', '1998-01-05', N'Vĩnh Long', 'DA15TT')
INSERT INTO SINHVIEN VALUES( '110117003', N'Nguyễn Minh Hảo', '0123456783', '110117003@sv.tvu.edu.vn', N'Nam', '1998-01-10', N'Trà Vinh', 'DA15TT')
INSERT INTO SINHVIEN VALUES( '110117004', N'Nguyễn Minh Duy', '0123456784', '110117004@sv.tvu.edu.vn', N'Nam', '1998-01-15', N'Trà Vinh', 'DA15TT')
INSERT INTO SINHVIEN VALUES( '110117005', N'Nguyễn Minh Tuấn', '0123456785', '110117005@sv.tvu.edu.vn', N'Nam', '1998-01-20', N'Châu Thành', 'DA15TT')
INSERT INTO SINHVIEN VALUES( '110117006', N'Nguyễn Minh Nhi', '0123456786', '110117006@sv.tvu.edu.vn', N'Nữ', '1998-01-25', N'Vĩnh Long', 'DA16TT')
INSERT INTO SINHVIEN VALUES( '110117007', N'Nguyễn Minh Tú', '0123456787', '110117007@sv.tvu.edu.vn', N'Nữ', '1998-01-30', N'Trà Vinh', 'DA16TT')
INSERT INTO SINHVIEN VALUES( '110117008', N'Nguyễn Minh Tài', '0123456788', '110117008@sv.tvu.edu.vn', N'Nam', '1998-02-02', N'Vĩnh Long', 'DA16TT')
INSERT INTO SINHVIEN VALUES( '110117009', N'Nguyễn Lê Dương', '0123456789', '110117009@sv.tvu.edu.vn', N'Nữ', '1998-02-04', N'Châu Thành', 'DA16TT')
INSERT INTO SINHVIEN VALUES( '110117010', N'Nguyễn Minh Hoa', '0123456710', '110117010@sv.tvu.edu.vn', N'Nữ', '1998-02-06', N'Châu Thành', 'DA16TT')
INSERT INTO SINHVIEN VALUES( '110117011', N'Nguyễn Minh Trúc', '0123456711', '110117011@sv.tvu.edu.vn', N'Nam', '1998-02-08', N'Châu Thành', 'DA15QTM')
INSERT INTO SINHVIEN VALUES( '110117012', N'Nguyễn Minh Kiệt', '0123456712', '110117012@sv.tvu.edu.vn', N'Nữ', '1998-02-10', N'Châu Thành', 'DA15QTM')
INSERT INTO SINHVIEN VALUES( '110117013', N'Nguyễn Minh Hòa', '0123456713', '110117013@sv.tvu.edu.vn', N'Nam', '1998-02-12', N'Trà Cú', 'DA15QTM')
INSERT INTO SINHVIEN VALUES( '110117014', N'Nguyễn Minh Linh', '0123456714', '110117014@sv.tvu.edu.vn', N'Nam', '1998-02-14', N'Trà Cú', 'DA15QTM')
INSERT INTO SINHVIEN VALUES( '110117015', N'Nguyễn Minh Liên', '0123456715', '110117015@sv.tvu.edu.vn', N'Nữ', '1998-02-16', N'Vĩnh Long', 'DA15QTM')
INSERT INTO SINHVIEN VALUES( '110117016', N'Dương Quốc Thư', '0123456716', '110117016@sv.tvu.edu.vn', N'Nữ', '1998-02-18', N'Trà Vinh', 'DA16QTM')
INSERT INTO SINHVIEN VALUES( '110117017', N'Dương Quốc Minh', '0123456717', '110117017@sv.tvu.edu.vn', N'Nam', '1998-02-20', N'Trà Vinh', 'DA16QTM')
INSERT INTO SINHVIEN VALUES( '110117018', N'Dương Quốc Hảo', '0123456718', '110117018@sv.tvu.edu.vn', N'Nam', '1998-02-22', N'Vĩnh Long', 'DA16QTM')
INSERT INTO SINHVIEN VALUES( '110117019', N'Dương Quốc Duy', '0123456719', '110117019@sv.tvu.edu.vn', N'Nam', '1998-02-24', N'Trà Vinh', 'DA16QTM')
INSERT INTO SINHVIEN VALUES( '110117020', N'Dương Quốc Tuấn', '0123456720', '110117020@sv.tvu.edu.vn', N'Nam', '1998-02-26', N'Vĩnh Long', 'DA16QTM')
INSERT INTO SINHVIEN VALUES( '110117021', N'Dương Quốc Nhi', '0123456721', '110117021@sv.tvu.edu.vn', N'Nữ', '1998-02-28', N'Trà Vinh', 'DA15KDHT')
INSERT INTO SINHVIEN VALUES( '110117022', N'Dương Quốc Tú', '0123456722', '110117022@sv.tvu.edu.vn', N'Nam', '1998-03-03', N'Vĩnh Long', 'DA15KDHT')
INSERT INTO SINHVIEN VALUES( '110117023', N'Dương Quốc Tài', '0123456723', '110117023@sv.tvu.edu.vn', N'Nam', '1998-03-06', N'Trà Vinh', 'DA15KDHT')
INSERT INTO SINHVIEN VALUES( '110117024', N'Dương Quốc Vũ', '0123456724', '110117024@sv.tvu.edu.vn', N'Nữ', '1998-03-09', N'Vĩnh Long', 'DA15KDHT')
INSERT INTO SINHVIEN VALUES( '110117025', N'Dương Quốc Châu', '0123456725', '110117025@sv.tvu.edu.vn', N'Nữ', '1998-03-12', N'Vĩnh Long', 'DA15KDHT')
INSERT INTO SINHVIEN VALUES( '110117026', N'Dương Quốc Toàn', '0123456726', '110117026@sv.tvu.edu.vn', N'Nam', '1998-03-15', N'Trà Vinh', 'DA16KDHT')
INSERT INTO SINHVIEN VALUES( '110117027', N'Dương Quốc Kiệt', '0123567227', '110117027@sv.tvu.edu.vn', N'Nam', '1998-03-18', N'Cần Thơ', 'DA16KDHT')
INSERT INTO SINHVIEN VALUES( '110117028', N'Dương Quốc Hòa', '0123456728', '110117028@sv.tvu.edu.vn', N'Nam', '1998-03-21', N'Trà Vinh', 'DA16KDHT')
INSERT INTO SINHVIEN VALUES( '110117029', N'Dương Quốc Nam', '0123456729', '110117029@sv.tvu.edu.vn', N'Nam', '1998-03-24', N'Cần Thơ', 'DA16KDHT')
INSERT INTO SINHVIEN VALUES( '110117030', N'Dương Quốc Ngân', '0123456730', '110117030@sv.tvu.edu.vn', N'Nữ', '1998-03-27', N'Cần Thơ', 'DA16KDHT')
INSERT INTO SINHVIEN VALUES( '110117031', N'Lê Trọng Khang', '0123456731', '110117031@sv.tvu.edu.vn', N'Nam', '1998-04-10', N'Cần Thơ', 'DA15DCN')
INSERT INTO SINHVIEN VALUES( '110117032', N'Lê Trọng Minh', '0123456732', '110117032@sv.tvu.edu.vn', N'Nam', '1998-04-20', N'Trà Vinh', 'DA15DCN')
INSERT INTO SINHVIEN VALUES( '110117033', N'Lê Trọng Hảo', '0123456733', '110117033@sv.tvu.edu.vn', N'Nam', '1998-04-22', N'Trà Cú', 'DA15DCN')
INSERT INTO SINHVIEN VALUES( '110117034', N'Lê Trọng Duy', '0123456734', '110117034@sv.tvu.edu.vn', N'Nam', '1998-04-25', N'Trà Cú', 'DA15DCN')
INSERT INTO SINHVIEN VALUES( '110117035', N'Lê Trọng Tuấn', '0123456735', '110117035@sv.tvu.edu.vn', N'Nữ', '1998-04-27', N'Trà Cú', 'DA15DCN')
INSERT INTO SINHVIEN VALUES( '110117036', N'Lê Trọng Nhi', '0123456736', '110117036@sv.tvu.edu.vn', N'Nữ', '1998-04-15', N'Trà Vinh', 'DA16DCN')
INSERT INTO SINHVIEN VALUES( '110117037', N'Lê Trọng Tú', '0123456737', '110117037@sv.tvu.edu.vn', N'Nữ', '1998-04-16', N'Trà Vinh', 'DA16DCN')
INSERT INTO SINHVIEN VALUES( '110117038', N'Lê Trọng Tài', '0123456738', '110117038@sv.tvu.edu.vn', N'Nam', '1998-04-19', N'Trà Vinh', 'DA16DCN')
INSERT INTO SINHVIEN VALUES( '110117039', N'Lê Trọng Dương', '0123453351', '110117039@sv.tvu.edu.vn', N'Nữ', '1998-07-03', N'Trà Vinh', 'DA16DCN')
INSERT INTO SINHVIEN VALUES( '110117040', N'Lê Trọng Châu', '0123456365', '110117040@sv.tvu.edu.vn', N'Nữ', '1998-08-04', N'Trà Vinh', 'DA16DCN')
INSERT INTO SINHVIEN VALUES( '110117041', N'Lê Trọng Toàn', '0123456739', '110117041@sv.tvu.edu.vn', N'Nam', '1998-08-05', N'Trà Vinh', 'DA15MN')
INSERT INTO SINHVIEN VALUES( '110117042', N'Lê Trọng Kiệt', '0123456740', '110117042@sv.tvu.edu.vn', N'Nam', '1998-08-06', N'Trà Vinh', 'DA15MN')
INSERT INTO SINHVIEN VALUES( '110117043', N'Lê Trọng Hòa', '0123456741', '110117043@sv.tvu.edu.vn', N'Nữ', '1998-08-16', N'Trà Vinh', 'DA15MN')
INSERT INTO SINHVIEN VALUES( '110117044', N'Lê Trọng Khang', '0123456742', '110117044@sv.tvu.edu.vn', N'Nam', '1998-08-17', N'Trà Vinh', 'DA15MN')
INSERT INTO SINHVIEN VALUES( '110117045', N'Lê Trọng Ngân', '0123456743', '110117045@sv.tvu.edu.vn', N'Nữ', '1998-08-18', N'Trà Vinh', 'DA15MN')
INSERT INTO SINHVIEN VALUES( '110117046', N'Nguyễn Huỳnh Trí', '0123456744', '110117046@sv.tvu.edu.vn', N'Nữ', '1998-08-20', N'Trà Vinh', 'DA16MN')
INSERT INTO SINHVIEN VALUES( '110117047', N'Nguyễn Huỳnh Tú', '0123456745', '110117047@sv.tvu.edu.vn', N'Nữ', '1998-08-22', N'Trà Vinh', 'DA16MN')
INSERT INTO SINHVIEN VALUES( '110117048', N'Nguyễn Huỳnh Hảo', '0123456746', '110117048@sv.tvu.edu.vn', N'Nam', '1998-08-21', N'Trà Vinh', 'DA16MN')
INSERT INTO SINHVIEN VALUES( '110117049', N'Nguyễn Huỳnh Duy', '0123456747', '110117049@sv.tvu.edu.vn', N'Nam', '1998-08-25', N'Trà Vinh', 'DA16MN')
INSERT INTO SINHVIEN VALUES( '110117050', N'Nguyễn Hữu Nghĩa', '0123456748', '110117050@sv.tvu.edu.vn', N'Nam', '1998-08-26', N'Trà Vinh', 'DA16MN')
INSERT INTO SINHVIEN VALUES( '110117051', N'Nguyễn Huỳnh Nhi', '0123456749', '110117051@sv.tvu.edu.vn', N'Nữ', '1998-08-29', N'Trà Vinh', 'DA15TH')
INSERT INTO SINHVIEN VALUES( '110117052', N'Nguyễn Huỳnh La', '0123456750', '110117052@sv.tvu.edu.vn', N'Nữ', '1998-11-03', N'Trà Vinh', 'DA15TH')
INSERT INTO SINHVIEN VALUES( '110117053', N'Nguyễn Huỳnh Tài', '0123456751', '110117053@sv.tvu.edu.vn', N'Nam', '1998-12-05', N'Trà Vinh', 'DA15TH')
INSERT INTO SINHVIEN VALUES( '110117054', N'Nguyễn Hữu Dương', '0123456752', '110117054@sv.tvu.edu.vn', N'Nam', '1998-12-16', N'Trà Vinh', 'DA15TH')
INSERT INTO SINHVIEN VALUES( '110117055', N'Nguyễn Hữu Châu', '0123456753', '110117055@sv.tvu.edu.vn', N'Nữ', '1998-04-03', N'Trà Vinh', 'DA15TH')
INSERT INTO SINHVIEN VALUES( '110117056', N'Nguyễn Hữu Toàn', '0123456754', '110117056@sv.tvu.edu.vn', N'Nam', '1998-04-14', N'Trà Vinh', 'DA16TH')
INSERT INTO SINHVIEN VALUES( '110117057', N'Nguyễn Huỳnh Kiệt', '0123456755', '110117057@sv.tvu.edu.vn', N'Nam', '1998-05-26', N'Trà Vinh', 'DA16TH')
INSERT INTO SINHVIEN VALUES( '110117058', N'Nguyễn Huỳnh Hòa', '0123456756', '110117058@sv.tvu.edu.vn', N'Nữ', '1998-10-10', N'Trà Vinh', 'DA16TH')
INSERT INTO SINHVIEN VALUES( '110117059', N'Nguyễn Hữu Khang', '0123456757', '110117059@sv.tvu.edu.vn', N'Nam', '1998-12-25', N'Trà Vinh', 'DA16TH')
INSERT INTO SINHVIEN VALUES( '110117060', N'Nguyễn Hữu Ngân', '0123456758', '110117060@sv.tvu.edu.vn', N'Nữ', '1998-12-19', N'Trà Vinh', 'DA16TH')
GO

--Them du lieu Bang KINHPHIHOTRO
INSERT INTO KINHPHIHOTRO VALUES( 1, 105, 1050000)
INSERT INTO KINHPHIHOTRO VALUES( 2, 103, 1030000)
INSERT INTO KINHPHIHOTRO VALUES( 3, 114, 1140000)
INSERT INTO KINHPHIHOTRO VALUES( 4, 43, 430000)
INSERT INTO KINHPHIHOTRO VALUES( 5, 42, 420000)
INSERT INTO KINHPHIHOTRO VALUES( 6, 111, 1110000)
INSERT INTO KINHPHIHOTRO VALUES( 7, 104, 1040000)
INSERT INTO KINHPHIHOTRO VALUES( 8, 104, 1040000)
INSERT INTO KINHPHIHOTRO VALUES( 9, 114, 1140000)
INSERT INTO KINHPHIHOTRO VALUES( 10, 26, 260000)
INSERT INTO KINHPHIHOTRO VALUES( 11, 31, 310000)
GO

--Them du lieu Bang DONVITHUCTAP
INSERT INTO DONVITHUCTAP VALUES( 'DV01', N'BStar Solutions Company', N'56 Yên Thế, Phường 2, Tân Bình, Hồ Chí Minh', '0918603812')
INSERT INTO DONVITHUCTAP VALUES( 'DV02', N'TMA Solutions', N'111 Nguyễn Đình Chính, Phường 15, Phú Nhuận, Hồ Chí Minh', '0989236113')
INSERT INTO DONVITHUCTAP VALUES( 'DV03', N'FPT Software', N'Đường D1, Khu Công Nghệ Cao, Phường Tân Phú, Quận 9, Hồ Chí Minh ', '0988332014')
INSERT INTO DONVITHUCTAP VALUES( 'DV04', N'Điện Lực Duyên Hải', N'19 Tháng 5, Long Toàn, Duyên Hải, Trà Vinh, Việt Nam', '0983303615')
INSERT INTO DONVITHUCTAP VALUES( 'DV05', N'Điện Lực Châu Thành', N'181, Khóm 3, Thị Trấn Châu Thành, Huyện Châu Thành, TT. Châu Thành, Châu Thành, Trà Vinh, Việt Nam', '0918603816')
INSERT INTO DONVITHUCTAP VALUES( 'DV06', N'Công ty TNHH Xây dựng và Lắp đặt kỹ thuật Việt', N'Số 74, đường 19, phường Linh Chiểu, quận Thủ Đức, Hồ Chí Minh', '0989236117')
INSERT INTO DONVITHUCTAP VALUES( 'DV07', N'Công Ty TNHH Một Thành Viên Wacontre', N' KCN Mỹ Phước 3, Phường Thới Hòa, Thị xã Bến Cát, Tỉnh Bình Dương', '0988332018')
INSERT INTO DONVITHUCTAP VALUES( 'DV08', N'Trường mầm non Việt Mỹ', N'95-97 Nguyễn Sơn, phường Phú Thọ Hoà, Tân Phú, Hồ Chí Minh, Việt Nam', '0983303619')
INSERT INTO DONVITHUCTAP VALUES( 'DV09', N'Trường Mầm non Quốc tế iBS', N'Cao ốc Horizon, Tầng 2, 214 Trần Quang Khải, P. Tân Định, Q.1, Tp. HCM', '0918603820')
INSERT INTO DONVITHUCTAP VALUES( 'DV10', N'Trường Tiểu Học Tiểu Cần A', N'khóm 2, TT Tiểu Cần, , Huyện Tiểu Cần, Trà Vinh', '0989236121')
INSERT INTO DONVITHUCTAP VALUES( 'DV11', N'Trường Tiểu Học Thị Trấn Vũng Liêm', N'Tỉnh lộ 902, Tt. Vũng Liêm, H. Vũng Liêm, T. Vĩnh Long', '0988332022')
GO

--Them du lieu Bang CANBODONVI
INSERT INTO CANBODONVI VALUES( 'NHD17', N'Phạm Thị Trúc Mai', '0918603804', 'pttmai@tvu.edu.vn', 'DV01')
INSERT INTO CANBODONVI VALUES( 'NHD18', N'Đoàn Phước Miền', '0989236104', 'dpmien@tvu.edu.vn', 'DV01')
INSERT INTO CANBODONVI VALUES( 'NHD19', N'Trầm Hoàng Nam', '0988332004', 'thnam@tvu.edu.vn', 'DV02')
INSERT INTO CANBODONVI VALUES( 'NHD20', N'Khấu Văn Nhựt', '0983303604', 'kvnhut@tvu.edu.vn', 'DV02')
INSERT INTO CANBODONVI VALUES( 'NHD21', N'Đỗ Minh Phúc', '0918603805', 'dmphuc@tvu.edu.vn', 'DV03')
INSERT INTO CANBODONVI VALUES( 'NHD22', N'Đỗ Thị Phương Nam', '0989236105', 'dtpn@tvu.edu.vn', 'DV03')
INSERT INTO CANBODONVI VALUES( 'NHD23', N'Đỗ Ngọc Vân Khanh', '0988332005', 'dnvkhanh@tvu.edu.vn', 'DV04')
INSERT INTO CANBODONVI VALUES( 'NHD24', N'Đỗ Bá Nhiệm', '0983303605', 'dbnhiem@tvu.edu.vn', 'DV04')
INSERT INTO CANBODONVI VALUES( 'NHD25', N'Đỗ Thái', '0918603806', 'dthai@tvu.edu.vn', 'DV05')
INSERT INTO CANBODONVI VALUES( 'NHD26', N'Phạm Trọng Hợp', '0989236106', 'pthop@tvu.edu.vn', 'DV05')
INSERT INTO CANBODONVI VALUES( 'NHD27', N'Đỗ Thành Thép', '0988332006', 'dtthep@tvu.edu.vn', 'DV06')
INSERT INTO CANBODONVI VALUES( 'NHD28', N'Đỗ Văn Hiếu', '0983303606', 'dvhieu@tvu.edu.vn', 'DV06')
INSERT INTO CANBODONVI VALUES( 'NHD29', N'Đỗ Phước Hưng', '0918603807', 'dphung@tvu.edu.vn', 'DV07')
INSERT INTO CANBODONVI VALUES( 'NHD30', N'Đỗ Hoàng Duy Thiện', '0989236107', 'dhdthien@tvu.edu.vn', 'DV07')
INSERT INTO CANBODONVI VALUES( 'NHD31', N'Khấu Thị Trúc Mai', '0918603808', 'dttmai@tvu.edu.vn', 'DV08')
INSERT INTO CANBODONVI VALUES( 'NHD32', N'Khấu Phước Miền', '0989236108', 'kpmien@tvu.edu.vn', 'DV08')
INSERT INTO CANBODONVI VALUES( 'NHD33', N'Khấu Hoàng Nam', '0988332008', 'khnam@tvu.edu.vn', 'DV09')
INSERT INTO CANBODONVI VALUES( 'NHD34', N'Phan Văn Nhựt', '0983303608', 'pvnhut@tvu.edu.vn', 'DV09')
INSERT INTO CANBODONVI VALUES( 'NHD35', N'Khấu Minh Phúc', '0918603809', 'kmphuc@tvu.edu.vn', 'DV10')
INSERT INTO CANBODONVI VALUES( 'NHD36', N'Khấu Thị Phương Nam', '0989236109', 'ktpn@tvu.edu.vn', 'DV10')
INSERT INTO CANBODONVI VALUES( 'NHD37', N'Khấu Ngọc Vân Khanh', '0988332009', 'knvkhanh@tvu.edu.vn', 'DV11')
INSERT INTO CANBODONVI VALUES( 'NHD38', N'Khấu Bá Nhiệm', '0983303609', 'kbnhiem@tvu.edu.vn', 'DV11')
GO

--Them du lieu Bang PHIEUCHAM
INSERT INTO PHIEUCHAM VALUES( '1', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117001', 'NHD01', NULL)
INSERT INTO PHIEUCHAM VALUES( '2', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117002', 'NHD01', NULL)
INSERT INTO PHIEUCHAM VALUES( '3', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117003', 'NHD01', NULL)
INSERT INTO PHIEUCHAM VALUES( '4', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117004', 'NHD01', NULL)
INSERT INTO PHIEUCHAM VALUES( '5', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117005', 'NHD01', NULL)
INSERT INTO PHIEUCHAM VALUES( '6', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117006', 'NHD02', NULL)
INSERT INTO PHIEUCHAM VALUES( '7', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117007', 'NHD02', NULL)
INSERT INTO PHIEUCHAM VALUES( '8', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117008', 'NHD02', NULL)
INSERT INTO PHIEUCHAM VALUES( '9', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117009', 'NHD02', NULL)
INSERT INTO PHIEUCHAM VALUES( '10', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117010', 'NHD02', NULL)
INSERT INTO PHIEUCHAM VALUES( '11', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117011', 'NHD03', NULL)
INSERT INTO PHIEUCHAM VALUES( '12', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117012', 'NHD03', NULL)
INSERT INTO PHIEUCHAM VALUES( '13', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117013', 'NHD03', NULL)
INSERT INTO PHIEUCHAM VALUES( '14', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117014', 'NHD03', NULL)
INSERT INTO PHIEUCHAM VALUES( '15', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117015', 'NHD03', NULL)
INSERT INTO PHIEUCHAM VALUES( '16', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117016', 'NHD04', NULL)
INSERT INTO PHIEUCHAM VALUES( '17', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117017', 'NHD04', NULL)
INSERT INTO PHIEUCHAM VALUES( '18', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117018', 'NHD04', NULL)
INSERT INTO PHIEUCHAM VALUES( '19', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117019', 'NHD04', NULL)
INSERT INTO PHIEUCHAM VALUES( '20', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117020', 'NHD04', NULL)
INSERT INTO PHIEUCHAM VALUES( '21', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117021', 'NHD05', NULL)
INSERT INTO PHIEUCHAM VALUES( '22', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117022', 'NHD05', NULL)
INSERT INTO PHIEUCHAM VALUES( '23', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117023', 'NHD05', NULL)
INSERT INTO PHIEUCHAM VALUES( '24', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117024', 'NHD05', NULL)
INSERT INTO PHIEUCHAM VALUES( '25', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117025', 'NHD05', NULL)
INSERT INTO PHIEUCHAM VALUES( '26', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117026', 'NHD06', NULL)
INSERT INTO PHIEUCHAM VALUES( '27', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117027', 'NHD06', NULL)
INSERT INTO PHIEUCHAM VALUES( '28', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117028', 'NHD06', NULL)
INSERT INTO PHIEUCHAM VALUES( '29', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117029', 'NHD06', NULL)
INSERT INTO PHIEUCHAM VALUES( '30', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117030', 'NHD06', NULL)
INSERT INTO PHIEUCHAM VALUES( '31', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117031', 'NHD07', NULL)
INSERT INTO PHIEUCHAM VALUES( '32', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117032', 'NHD07', NULL)
INSERT INTO PHIEUCHAM VALUES( '33', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117033', 'NHD07', NULL)
INSERT INTO PHIEUCHAM VALUES( '34', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117034', 'NHD07', NULL)
INSERT INTO PHIEUCHAM VALUES( '35', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117035', 'NHD07', NULL)
INSERT INTO PHIEUCHAM VALUES( '36', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117036', 'NHD08', NULL)
INSERT INTO PHIEUCHAM VALUES( '37', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117037', 'NHD08', NULL)
INSERT INTO PHIEUCHAM VALUES( '38', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117038', 'NHD08', NULL)
INSERT INTO PHIEUCHAM VALUES( '39', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117039', 'NHD08', NULL)
INSERT INTO PHIEUCHAM VALUES( '40', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117040', 'NHD08', NULL)
INSERT INTO PHIEUCHAM VALUES( '41', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117041', 'NHD09', NULL)
INSERT INTO PHIEUCHAM VALUES( '42', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117042', 'NHD09', NULL)
INSERT INTO PHIEUCHAM VALUES( '43', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117043', 'NHD09', NULL)
INSERT INTO PHIEUCHAM VALUES( '44', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117044', 'NHD10', NULL)
INSERT INTO PHIEUCHAM VALUES( '45', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117045', 'NHD10', NULL)
INSERT INTO PHIEUCHAM VALUES( '46', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117046', 'NHD11', NULL)
INSERT INTO PHIEUCHAM VALUES( '47', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117047', 'NHD11', NULL)
INSERT INTO PHIEUCHAM VALUES( '48', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117048', 'NHD11', NULL)
INSERT INTO PHIEUCHAM VALUES( '49', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117049', 'NHD12', NULL)
INSERT INTO PHIEUCHAM VALUES( '50', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117050', 'NHD12', NULL)
INSERT INTO PHIEUCHAM VALUES( '51', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117051', 'NHD13', NULL)
INSERT INTO PHIEUCHAM VALUES( '52', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117052', 'NHD13', NULL)
INSERT INTO PHIEUCHAM VALUES( '53', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117053', 'NHD13', NULL)
INSERT INTO PHIEUCHAM VALUES( '54', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117054', 'NHD14', NULL)
INSERT INTO PHIEUCHAM VALUES( '55', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117055', 'NHD14', NULL)
INSERT INTO PHIEUCHAM VALUES( '56', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117056', 'NHD15', NULL)
INSERT INTO PHIEUCHAM VALUES( '57', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117057', 'NHD15', NULL)
INSERT INTO PHIEUCHAM VALUES( '58', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117058', 'NHD15', NULL)
INSERT INTO PHIEUCHAM VALUES( '59', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117059', 'NHD16', NULL)
INSERT INTO PHIEUCHAM VALUES( '60', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117060', 'NHD16', NULL)
INSERT INTO PHIEUCHAM VALUES( '61', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117001', NULL, 'NHD17')
INSERT INTO PHIEUCHAM VALUES( '62', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117002', NULL, 'NHD17')
INSERT INTO PHIEUCHAM VALUES( '63', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117003', NULL, 'NHD17')
INSERT INTO PHIEUCHAM VALUES( '64', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117004', NULL, 'NHD18')
INSERT INTO PHIEUCHAM VALUES( '65', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117005', NULL, 'NHD18')
INSERT INTO PHIEUCHAM VALUES( '66', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117006', NULL, 'NHD19')
INSERT INTO PHIEUCHAM VALUES( '67', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117007', NULL, 'NHD19')
INSERT INTO PHIEUCHAM VALUES( '68', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117008', NULL, 'NHD20')
INSERT INTO PHIEUCHAM VALUES( '69', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117009', NULL, 'NHD20')
INSERT INTO PHIEUCHAM VALUES( '70', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117010', NULL, 'NHD20')
INSERT INTO PHIEUCHAM VALUES( '71', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117011', NULL, 'NHD21')
INSERT INTO PHIEUCHAM VALUES( '72', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117012', NULL, 'NHD21')
INSERT INTO PHIEUCHAM VALUES( '73', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117013', NULL, 'NHD21')
INSERT INTO PHIEUCHAM VALUES( '74', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117014', NULL, 'NHD21')
INSERT INTO PHIEUCHAM VALUES( '75', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117015', NULL, 'NHD21')
INSERT INTO PHIEUCHAM VALUES( '76', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117016', NULL, 'NHD22')
INSERT INTO PHIEUCHAM VALUES( '77', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117017', NULL, 'NHD22')
INSERT INTO PHIEUCHAM VALUES( '78', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117018', NULL, 'NHD22')
INSERT INTO PHIEUCHAM VALUES( '79', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117019', NULL, 'NHD22')
INSERT INTO PHIEUCHAM VALUES( '80', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117020', NULL, 'NHD22')
INSERT INTO PHIEUCHAM VALUES( '81', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117021', NULL, 'NHD23')
INSERT INTO PHIEUCHAM VALUES( '82', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117022', NULL, 'NHD23')
INSERT INTO PHIEUCHAM VALUES( '83', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117023', NULL, 'NHD23')
INSERT INTO PHIEUCHAM VALUES( '84', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117024', NULL, 'NHD24')
INSERT INTO PHIEUCHAM VALUES( '85', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117025', NULL, 'NHD24')
INSERT INTO PHIEUCHAM VALUES( '86', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117026', NULL, 'NHD25')
INSERT INTO PHIEUCHAM VALUES( '87', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117027', NULL, 'NHD25')
INSERT INTO PHIEUCHAM VALUES( '88', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117028', NULL, 'NHD25')
INSERT INTO PHIEUCHAM VALUES( '89', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117029', NULL, 'NHD26')
INSERT INTO PHIEUCHAM VALUES( '90', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117030', NULL, 'NHD26')
INSERT INTO PHIEUCHAM VALUES( '91', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117031', NULL, 'NHD27')
INSERT INTO PHIEUCHAM VALUES( '92', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117032', NULL, 'NHD27')
INSERT INTO PHIEUCHAM VALUES( '93', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117033', NULL, 'NHD27')
INSERT INTO PHIEUCHAM VALUES( '94', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117034', NULL, 'NHD28')
INSERT INTO PHIEUCHAM VALUES( '95', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117035', NULL, 'NHD28')
INSERT INTO PHIEUCHAM VALUES( '96', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117036', NULL, 'NHD29')
INSERT INTO PHIEUCHAM VALUES( '97', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117037', NULL, 'NHD29')
INSERT INTO PHIEUCHAM VALUES( '98', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117038', NULL, 'NHD29')
INSERT INTO PHIEUCHAM VALUES( '99', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117039', NULL, 'NHD30')
INSERT INTO PHIEUCHAM VALUES( '100', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117040', NULL, 'NHD30')
INSERT INTO PHIEUCHAM VALUES( '101', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117041', NULL, 'NHD31')
INSERT INTO PHIEUCHAM VALUES( '102', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117042', NULL, 'NHD31')
INSERT INTO PHIEUCHAM VALUES( '103', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117043', NULL, 'NHD31')
INSERT INTO PHIEUCHAM VALUES( '104', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117044', NULL, 'NHD32')
INSERT INTO PHIEUCHAM VALUES( '105', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117045', NULL, 'NHD32')
INSERT INTO PHIEUCHAM VALUES( '106', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117046', NULL, 'NHD33')
INSERT INTO PHIEUCHAM VALUES( '107', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117047', NULL, 'NHD33')
INSERT INTO PHIEUCHAM VALUES( '108', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117048', NULL, 'NHD33')
INSERT INTO PHIEUCHAM VALUES( '109', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117049', NULL, 'NHD34')
INSERT INTO PHIEUCHAM VALUES( '110', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117050', NULL, 'NHD34')
INSERT INTO PHIEUCHAM VALUES( '111', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117051', NULL, 'NHD35')
INSERT INTO PHIEUCHAM VALUES( '112', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117052', NULL, 'NHD35')
INSERT INTO PHIEUCHAM VALUES( '113', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117053', NULL, 'NHD35')
INSERT INTO PHIEUCHAM VALUES( '114', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117054', NULL, 'NHD36')
INSERT INTO PHIEUCHAM VALUES( '115', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117055', NULL, 'NHD36')
INSERT INTO PHIEUCHAM VALUES( '116', N'Phiếu Chấm Điểm', 10, '2018-09-05', N'Hoàn thành tốt, có trách nhiệm', '110117056', NULL, 'NHD37')
INSERT INTO PHIEUCHAM VALUES( '117', N'Phiếu Chấm Điểm', 9, '2018-09-05', N'Hoàn thành khá tốt', '110117057', NULL, 'NHD37')
INSERT INTO PHIEUCHAM VALUES( '118', N'Phiếu Chấm Điểm', 6, '2018-09-05', N'Cần cải thiện thêm', '110117058', NULL, 'NHD37')
INSERT INTO PHIEUCHAM VALUES( '119', N'Phiếu Chấm Điểm', 9.5, '2018-09-05', N'Hoàn thành tốt nhiệm vụ', '110117059', NULL, 'NHD38')
INSERT INTO PHIEUCHAM VALUES( '120', N'Phiếu Chấm Điểm', 5, '2018-09-05', N'Cần cố gắng thêm', '110117060', NULL, 'NHD38')
GO

--Them du lieu Bang CHUCVU
INSERT INTO CHUCVU VALUES( 'CV01', N'Trưởng Khoa')
INSERT INTO CHUCVU VALUES( 'CV02', N'Phó Khoa')
INSERT INTO CHUCVU VALUES( 'CV03', N'Trưởng phòng giáo vụ')
INSERT INTO CHUCVU VALUES( 'CV04', N'Trưởng Bộ Môn')
INSERT INTO CHUCVU VALUES( 'CV05', N'Phó Bộ Môn')
INSERT INTO CHUCVU VALUES( 'CV06', N'Giám đốc')
INSERT INTO CHUCVU VALUES( 'CV07', N'Phó giám đốc')
INSERT INTO CHUCVU VALUES( 'CV08', N'Nhân Viên')
INSERT INTO CHUCVU VALUES( 'CV09', N'Trưởng phòng')
GO

--Them du lieu Bang CHITIETTHUCTAP
INSERT INTO CHITIETTHUCTAP VALUES( '110117001', 1, 'DV01', 'NHD01', 'NHD17', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117002', 1, 'DV01', 'NHD01', 'NHD17', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117003', 1, 'DV01', 'NHD01', 'NHD17', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117004', 1, 'DV01', 'NHD01', 'NHD18', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117005', 1, 'DV01', 'NHD01', 'NHD18', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117006', 2, 'DV02', 'NHD02', 'NHD19', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117007', 2, 'DV02', 'NHD02', 'NHD19', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117008', 2, 'DV02', 'NHD02', 'NHD20', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117009', 2, 'DV02', 'NHD02', 'NHD20', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117010', 2, 'DV02', 'NHD02', 'NHD20', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117011', 3, 'DV03', 'NHD03', 'NHD21', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117012', 3, 'DV03', 'NHD03', 'NHD21', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117013', 3, 'DV03', 'NHD03', 'NHD21', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117014', 3, 'DV03', 'NHD03', 'NHD21', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117015', 3, 'DV03', 'NHD03', 'NHD21', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117016', 3, 'DV03', 'NHD04', 'NHD22', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117017', 3, 'DV03', 'NHD04', 'NHD22', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117018', 3, 'DV03', 'NHD04', 'NHD22', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117019', 3, 'DV03', 'NHD04', 'NHD22', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117020', 3, 'DV03', 'NHD04', 'NHD22', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117021', 4, 'DV04', 'NHD05', 'NHD23', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117022', 4, 'DV04', 'NHD05', 'NHD23', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117023', 4, 'DV04', 'NHD05', 'NHD23', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117024', 4, 'DV04', 'NHD05', 'NHD24', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117025', 4, 'DV04', 'NHD05', 'NHD24', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117026', 5, 'DV05', 'NHD06', 'NHD25', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117027', 5, 'DV05', 'NHD06', 'NHD25', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117028', 5, 'DV05', 'NHD06', 'NHD25', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117029', 5, 'DV05', 'NHD06', 'NHD26', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117030', 5, 'DV05', 'NHD06', 'NHD26', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117031', 6, 'DV06', 'NHD07', 'NHD27', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117032', 6, 'DV06', 'NHD07', 'NHD27', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117033', 6, 'DV06', 'NHD07', 'NHD27', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117034', 6, 'DV06', 'NHD07', 'NHD28', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117035', 6, 'DV06', 'NHD07', 'NHD28', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117036', 7, 'DV07', 'NHD08', 'NHD29', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117037', 7, 'DV07', 'NHD08', 'NHD29', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117038', 7, 'DV07', 'NHD08', 'NHD29', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117039', 7, 'DV07', 'NHD08', 'NHD30', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117040', 7, 'DV07', 'NHD08', 'NHD30', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117041', 8, 'DV08', 'NHD09', 'NHD31', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117042', 8, 'DV08', 'NHD09', 'NHD31', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117043', 8, 'DV08', 'NHD09', 'NHD31', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117044', 8, 'DV08', 'NHD10', 'NHD32', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117045', 8, 'DV08', 'NHD10', 'NHD32', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117046', 9, 'DV09', 'NHD11', 'NHD33', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117047', 9, 'DV09', 'NHD11', 'NHD33', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117048', 9, 'DV09', 'NHD11', 'NHD33', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117049', 9, 'DV09', 'NHD12', 'NHD34', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117050', 9, 'DV09', 'NHD12', 'NHD34', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117051', 10, 'DV10', 'NHD13', 'NHD35', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117052', 10, 'DV10', 'NHD13', 'NHD35', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117053', 10, 'DV10', 'NHD13', 'NHD35', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117054', 10, 'DV10', 'NHD14', 'NHD36', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117055', 10, 'DV10', 'NHD14', 'NHD36', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117056', 11, 'DV11', 'NHD15', 'NHD37', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117057', 11, 'DV11', 'NHD15', 'NHD37', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117058', 11, 'DV11', 'NHD15', 'NHD37', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117059', 11, 'DV11', 'NHD16', 'NHD38', '2018-06-01', '2018-08-31')
INSERT INTO CHITIETTHUCTAP VALUES( '110117060', 11, 'DV11', 'NHD16', 'NHD38', '2018-06-01', '2018-08-31')
GO



--Them du lieu Bang DAMNHANCHUCVU
INSERT INTO DAMNHANCHUCVU VALUES( 'CV01', 'NHD01', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV02', 'NHD02', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV03', 'NHD03', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV04', 'NHD04', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV05', 'NHD05', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD17', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD18', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD19', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD20', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD21', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD22', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD23', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD24', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD25', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD26', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD27', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD28', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD29', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD30', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD31', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD32', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD33', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD34', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD35', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD36', '2015-12-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV06', 'NHD37', '2015-09-01')
INSERT INTO DAMNHANCHUCVU VALUES( 'CV08', 'NHD38', '2015-12-01')
GO

--Kiem tra du lieu
SELECT * FROM KHOA
SELECT * FROM BOMON
SELECT * FROM NGANH
SELECT * FROM LOP
SELECT * FROM HOCVI
SELECT * FROM GIANGVIEN
SELECT * FROM SINHVIEN
SELECT * FROM KINHPHIHOTRO
SELECT * FROM DONVITHUCTAP
SELECT * FROM CANBODONVI
SELECT * FROM PHIEUCHAM
SELECT * FROM CHUCVU
SELECT * FROM CHITIETTHUCTAP
SELECT * FROM DAMNHANCHUCVU
GO

--Xoa
DROP TABLE KHOA
DROP TABLE BOMON
DROP TABLE NGANH
DROP TABLE LOP
DROP TABLE HOCVI
DROP TABLE GIANGVIEN
DROP TABLE SINHVIEN
DROP TABLE KINHPHIHOTRO
DROP TABLE DONVITHUCTAP
DROP TABLE CANBODONVI
DROP TABLE PHIEUCHAM
DROP TABLE CHUCVU
DROP TABLE CHITIETTHUCTAP
DROP TABLE DAMNHANCHUCVU
DELETE LOP
DELETE DONVITHUCTAP


GO

--Truy van
select sv.TenSV as 'Ten SV', DiemCB, DiemGV, DiemTrungBinh.[Diem Trung Binh] as 'Diem Trung Binh' 
from
	(
		select DiemCB.MaSV as 'MaSV' ,(DiemCB.DiemCB + DiemGV.DiemGV) / 2 as 'Diem Trung Binh', DiemCB.DiemCB, DiemGV.DiemGV
		from
			(
				select pc.SoDiem as 'DiemGV', sv.MaSV as 'MaSV'
				from SINHVIEN as sv, GIANGVIEN as gv, PHIEUCHAM as pc
				where sv.MaSV = pc.MaSV
				and gv.MaGV = pc.MaGV
			) as DiemGV,
			(
				select pc.SoDiem as 'DiemCB', sv.MaSV as 'MaSV'
				from SINHVIEN as sv, CANBODONVI as cb, PHIEUCHAM as pc
				where sv.MaSV = pc.MaSV
				and cb.MaCB = pc.MaCB
			) as DiemCB
		where DiemGV.MaSV = DiemCB.MaSV
	) as DiemTrungBinh, SINHVIEN as sv
where sv.MaSV = DiemTrungBinh.MaSV
GO

--Tạo View
-- Dùng view hiển thị danh sách cán bộ của từng đơn vị thực tập
create view view_DanhSachCanBo
as
select CB.MaCB, CB.TenCB, DV.TenDV
from CANBODONVI as CB, DONVITHUCTAP as DV
where CB.MaDV = DV.MaDV

	--kiem tra
	select * from view_DanhSachCanBo

-- Hiển thị danh sách giảng viên của từng bộ môn
create view view_DanhSachGiangVien
as
select gv.MaGV, gv.TenGV, bm.TenBoMon
from GIANGVIEN as gv, BOMON as bm
where bm.MaBoMon = gv.MaBoMon
	
	--kiem tra
	select * from view_DanhSachGiangVien

-- Hiển thị điểm của sinh viên (mã số sinh viên, tên sinh viên, điểm của cán bộ hướng dẫn, điểm của giảng viên hướng dẫn, điểm trung bình thực tập)
create view view_DiemSinhVien
as
select sv.MaSV,sv.TenSV as 'Ten SV', DiemCB, DiemGV, DiemTrungBinh.[Diem Trung Binh] as 'Diem Trung Binh' 
from
	(
		select DiemCB.MaSV as 'MaSV' ,(DiemCB.DiemCB + DiemGV.DiemGV) / 2 as 'Diem Trung Binh', DiemCB.DiemCB, DiemGV.DiemGV
		from
			(
				select pc.SoDiem as 'DiemGV', sv.MaSV as 'MaSV'
				from SINHVIEN as sv, GIANGVIEN as gv, PHIEUCHAM as pc
				where sv.MaSV = pc.MaSV
				and gv.MaGV = pc.MaGV
			) as DiemGV,
			(
				select pc.SoDiem as 'DiemCB', sv.MaSV as 'MaSV'
				from SINHVIEN as sv, CANBODONVI as cb, PHIEUCHAM as pc
				where sv.MaSV = pc.MaSV
				and cb.MaCB = pc.MaCB
			) as DiemCB
		where DiemGV.MaSV = DiemCB.MaSV
	) as DiemTrungBinh, SINHVIEN as sv
where sv.MaSV = DiemTrungBinh.MaSV

	--kiem tra
	select * from view_DiemSinhVien

-- Hiển thị thông tin thực tập của từng sinh viên 
-- (mã số sinh viên, tên sinh viên, ngày bắt đầu, ngày kết thúc, đơn vị thực tập, 
-- tên cán bộ hướng dẫn, tên giảng viên hướng dẫn, kinh phí hổ trợ, địa điểm thực tập)
create view view_ThongTinThucTap
as
select sv.MaSV, sv.TenSV, ct.NgayBatDauThucTap, ct.NgayKetThucThucTap, dv.TenDV, cb.TenCB, gv.TenGV, kp.SoTien, dv.DiaChiDV as 'DiaDiemTT'
from SINHVIEN as sv, CHITIETTHUCTAP as ct, CANBODONVI as cb, GIANGVIEN as gv, DONVITHUCTAP as dv, KINHPHIHOTRO as kp
where ct.MaDV = dv.MaDV
	and sv.MaSV = ct.MaSV
	and ct.MaCB = cb.MaCB
	and gv.MaGV = ct.MaGV
	and ct.IDKinhPhi = kp.IDKinhPhi

	--kiem tra
	select * from view_ThongTinThucTap
GO


--TRIGGER

-- SDT
-------CANBODONVI
create trigger trigger_sdt_CanBo
on CANBODONVI
for insert, update
as
	declare @sdt int
	select @sdt = LEN(SDTCB)
	from inserted
	if (@sdt < 10 or @sdt > 10)
	begin 
		print N'Số điện thoại phải bằng 10 chữ số'
		rollback transaction
		print N'Không thêm được'
end
	--kiem tra
	insert into CANBODONVI values ('MT01', N'Trần Mẩu Thử', '01230', 'tmthu@gmail.com', 'DV01')
	insert into CANBODONVI values ('MT01', N'Trần Mẩu Thử', '01230874691', 'tmthu@gmail.com', 'DV01') 

---------SINHVIEN
create trigger trigger_sdt_SinhVien
on SINHVIEN
for insert, update
as
	declare @sdt int
	select @sdt = LEN(SDTSV)
	from inserted
	if (@sdt < 10 or @sdt > 10)
	begin 
		print N'Số điện thoại phải bằng 10 chữ số'
		rollback transaction
		print N'Không thêm được'
end
	--kiem tra
	INSERT INTO SINHVIEN VALUES( '110117195', N'Nguyễn Minh Thư', '012341', '110117001@sv.tvu.edu.vn', N'Nữ', '1998-01-01', N'Trà Vinh', 'DA15TT')
---------DONVITHUCTAP
create trigger trigger_sdt_DonVi
on DONVITHUCTAP
for insert
as
	declare @sdt int
	select @sdt = LEN(SDTDV)
	from inserted
	if (@sdt < 10 or @sdt > 10)
	begin 
		print N'Số điện thoại phải bằng 10 chữ số'
		rollback transaction
		print N'Không thêm được'
end
	--kiem tra
	INSERT INTO DONVITHUCTAP VALUES( 'DV19', N'Trường mầm non Việt Mỹ', N'95-97 Nguyễn Sơn, phường Phú Thọ Hoà, Tân Phú, Hồ Chí Minh, Việt Nam', '098339')
--NGAY SINH
create trigger trigger_ngaysinh_SinhVien
on SINHVIEN
for insert, update 
as
	declare @ns int
	select @ns = (YEAR(GETDATE()) - YEAR(NgaySinh))
	from inserted
	if (@ns < 20) 
	begin 
		print N'Ngày hiện hành phải lớn hơn ngày sinh 20 năm'
		rollback transaction
		print N'Không thêm được'
	end

	--kiemtra
	INSERT INTO SINHVIEN VALUES( '110117195', N'Nguyễn Minh Thư', '0123411236', '110117001@sv.tvu.edu.vn', N'Nữ', '2019-01-01', N'Trà Vinh', 'DA15TT')

--So KM
create trigger trigger_soKm_KinhPhi
on KINHPHIHOTRO
for insert, update
as
	if (select Min(SoKM) from KINHPHIHOTRO) <= 0 
	begin 
		print N'Số km phải lớn hơn 0'
		rollback transaction
		print N'Không thêm được'
	end

	--kiem tra
	INSERT INTO KINHPHIHOTRO VALUES( 90, -5, 310000)
--So Tien
create trigger trigger_soTien_KinhPhi
on KINHPHIHOTRO
for insert, update
	as
	if (select Min(SoTien) from KINHPHIHOTRO) < 0 
	begin 
		print N'Số tiền phải lớn hơn hoặc bằng 0'
		rollback transaction
		print N'Không thêm được'
	end

	--Kiem tra
	INSERT INTO KINHPHIHOTRO VALUES( 90, 6, -3)


	select * from KINHPHIHOTRO

--Diem so
create trigger trigger_soDiem_PhieuCham
on PHIEUCHAM
for insert, update
as
	declare @diem float
	select @diem = inserted.SoDiem
	from inserted
	if (@diem < 0 or @diem > 10)
	begin 
		print N'Số điểm phải lơn hơn hoặc bằng 0 và nhỏ hơn hoặc bằng 10'
		rollback transaction
		print N'Không thêm được'
	end

--Ngay cham
create trigger trigger_ngayCham_PhieuCham
on PHIEUCHAM
for insert, update
as
	declare @numDay int
	select @numDay = (DATEDIFF(day, ct.NgayBatDauThucTap, ins.NgayCham))
	from inserted as ins, CHITIETTHUCTAP as ct
	where ins.MaSV = ct.MaSV
	if (@numDay < 30)
	begin 
		print N'Ngày chấm phải sau ngày thực tập ít nhất 30 ngày'
		rollback transaction
		print N'Không thêm được'
	end

	--kiem tra
	INSERT INTO PHIEUCHAM VALUES( '121', N'Phiếu Chấm Điểm', 10, '2018-06-02', N'Hoàn thành tốt, có trách nhiệm', '110117001', 'NHD01', NULL)

--Ngay ket thuc
create trigger trigger_ngayKetThuc_ChiTiet
on CHITIETTHUCTAP
for insert, update 
as
	declare @numDay int
	select @numDay = (DATEDIFF(day, NgayBatDauThucTap,NgayKetThucThucTap))
	from inserted
	if (@numDay < 30)
	begin 
		print N'Ngày kết thúc phải sau ngày bắt đầu thực tập ít nhất 30 ngày'
		rollback transaction
		print N'Không thêm được'
	end
	--kiem tra
	INSERT INTO CHITIETTHUCTAP VALUES( '110117001', 1, 'DV02', 'NHD01', 'NHD17', '2018-06-01', '2018-06-02')
-----------------------------------------
-----THỦ TỤC
-- Viết thủ tục trả về kinh phí hỗ trợ của sinh viên 
-- (với mã số sinh viên là tham số đầu vào, tham số đầu ra là kinh phí hỗ trợ).
create procedure proc_kinhPhi_SinhVien
	@maso varchar(10),
	@kinhphi float output
as
begin
	select @kinhphi = kp.SoTien
	from CHITIETTHUCTAP as ct, KINHPHIHOTRO as kp
	where kp.IDKinhPhi = ct.IDKinhPhi
		and ct.MaSV = @maso
end
go
	--Kiem tra
	declare @kp int
	exec proc_kinhPhi_SinhVien '110117048', @kp output
	print @kp


---Viết thủ tục tính điểm trung bình của sinh viên (với mã số sinh viên là tham số đầu vào)
create procedure proc_diemTB_SinhVien
	@maso varchar(10)
as
begin 
	select (sum(pc.SoDiem) / count(*)) as 'Diem TB'
	from PHIEUCHAM as pc
	where pc.MaSV = @maso
end
go
	--Kiem tra
	
	exec proc_diemTB_SinhVien '110117048'

	select * from view_DiemSinhVien


---Viết thủ tục cho biết số lượng sinh viên thực tập ở một đơn vị 
-- (với tham số đầu vào là mã đơn vị, tham số đầu ra là số lượng sinh viên)
create procedure proc_soLuong_SinhVien_TaiDonVi
	@maDV varchar(10),
	@soLuong int output
as
begin
	select @soLuong = count(*)
	from CHITIETTHUCTAP as ct
	where ct.MaDV = @maDV
end
go
	--kiem tra
	declare @soLuong int
	exec proc_soLuong_SinhVien_TaiDonVi 'DV01', @soLuon output
	print @soLuong

	select * from DONVITHUCTAP

--Viết thủ tục cho biết sinh viên có ngày bắt đầu thực tập là 1-6-2018
create proc proc_sinhVien_NgayBatDau
as
begin
	select sv.MaSV, sv.TenSV
	from CHITIETTHUCTAP as ct, SINHVIEN as sv
	where ct.MaSV = sv.MaSV
	and ct.NgayBatDauThucTap = '20180601'
end
	--Kiem tra
	exec proc_sinhVien_NgayBatDau


--Viết thủ tục cho biết tổng kinh phí hổ trợ của một năm (với tham số đầu vào là năm(int))
create proc proc_tongKP_1Nam
	@nam int
as
begin
	select sum(kp.SoTien) as 'Tong kinh phi ho tro'
	from CHITIETTHUCTAP as ct, KINHPHIHOTRO as kp
	where YEAR(ct.NgayBatDauThucTap) = @nam
	and ct.IDKinhPhi = kp.IDKinhPhi
end
	--Kiem tra
	exec proc_tongKP_1Nam 2018

--Viết thủ tục liệt kê các sinh viên không đạt sau khi thực tập (điểm trung bình < 4)
create proc proc_sinhVien_KhongDat
as
begin
	select sv.MaSV, sv.TenSV
	from  SINHVIEN as sv, view_DiemSinhVien as dsv
	where sv.MaSV = dsv.MaSV
	and dsv.[Diem Trung Binh] < 4
end
	--Kiem tra
	exec proc_sinhVien_KhongDat

--Viết thủ tục liệt kê danh sách sinh viên đi thực tập ở xa (số km > 60)
create proc proc_sinhVien_ThucTap
as
begin
	select sv.MaSV, sv.TenSV
	from  SINHVIEN as sv, KINHPHIHOTRO as kp, CHITIETTHUCTAP as ct
	where ct.IDKinhPhi = kp.IDKinhPhi
		and	sv.MaSV = ct.MaSV
		and kp.SoKM > 60
end
	--Kiem tra
	exec proc_sinhVien_ThucTap
