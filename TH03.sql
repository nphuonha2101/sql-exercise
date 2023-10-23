create table HOCVIEN(
	MAHV varchar(10) not null primary key,
	HO nvarchar,
	TEN nvarchar,
	NGSINH date,
	GIOITINH varchar(10),
	NOISINH nvarchar,
	MALOP varchar(10)
);

create table KHOA(
	MAKHOA varchar(10) not null primary key,
	TENKHOA nvarchar,
	NGTLAP date,
	TRGKHOA varchar(10)
);

create table GIAOVIEN(
	MAGV varchar(10) not null primary key,
	HOTEN nvarchar,
	HOCVI nvarchar,
	HOCHAM nvarchar,
	GIOITINH varchar(10),
	NGSINH date,
	NGVL date,
	HESO numeric,
	MUCLUONG int,
	MAKHOA varchar(10) references KHOA(MAKHOA)
);

alter table KHOA add constraint FK_TRUONGKHOA foreign key (TRGKHOA) references GIAOVIEN(MAGV) on delete cascade on update cascade;


create table MONHOC(
	MAMH varchar(10) not null primary key,
	TENMH nvarchar,
	TCLT int,
	TCTH int,
	MAKHOA varchar(10) references KHOA(MAKHOA)
);

create table LOP(
	MALOP varchar(10) not null primary key,
	TENLOP nvarchar,
	TRGLOP varchar(10) references HOCVIEN(MAHV),
	SISO int,
	MAGVCN varchar(10) references GIAOVIEN(MAGV)
);

alter table HOCVIEN add constraint FK_MALOP foreign key (MALOP) references LOP(MALOP) on delete cascade on update cascade;


create table DIEUKIEN(
	MAMH varchar(10) references MONHOC(MAMH),
	MAMH_TRUOC varchar(10) references MONHOC(MAMH),
	primary key (MAMH, MAMH_TRUOC)
);



create table GIANGDAY(
	MALOP varchar(10) references LOP(MALOP),
	MAMH varchar(10) references MONHOC(MAMH),
	MAGV varchar(10) references GIAOVIEN(MAGV),
	HOCKY int,
	TUNGAY date,
	DENNGAY date,
	primary key (MALOP, MAMH)
);

create table KETQUATHI(
	MAHV varchar(10) references HOCVIEN(MAHV),
	MAMH varchar(10) references MONHOC(MAMH),
	LANTHI int,
	NGTHI date,
	DIEM numeric,
	KQUA numeric,
	primary key(MAHV, MAMH, LANTHI)
);

set dateformat dmy;
-- insert
insert into KHOA(MAKHOA, TENKHOA, NGTLAP, TRGKHOA)
values
('KHMT', 'Khoa học máy tính', 7/6/2005, 'GV01'),
('HTTT', 'Hệ thống thông tin', 7/6/2005, 'GV02'),
('CNPM', 'Công nghệ phần mềm', 7/6/2005, 'GV04'),
('MMT', 'Mạng và truyền thông', 20/10/2005, 'GV03'),
('KTMT', 'Kỹ thuật máy tính', 20/12/2005, null);

insert into LOP(MALOP, TENLOP, TRGLOP, SISO, MAGVCN)
values
('K11', 'Lớp 1 khoá 1', 'K1108', 11, 'GV07'),
('K12', 'Lớp 2 khoá 1', 'K1205', 12, 'GV09'),
('K13', 'Lớp 3 khoá 1', 'K1305', 12, 'GV14');

insert into MONHOC(MAMH, TENMH, TCLT, TCTH, MAKHOA)
values
('THDC', 'Tin học đại cương', 4, 1, 'KHMT'),
('CTRR', 'Cấu trúc rời rạc', 5, 0, 'KHMT'),
('CSDL', 'Cơ sở dữ liệu', 3, 1, 'HTTT'),
('CTDLGT', 'Cấu trúc dữ liệu và giải thuật', 3, 1, 'KHMT'),
('PTTKTT', 'Phân tích thiết kế thuật toán', 3, 0, 'KHMT'),
('DHMT', 'Đồ hoạ máy tính', 3, 1, 'KHMT'),
('KTMT', 'Kiến trúc máy tính', 3, 0, 'KTMT'),
('TKCSDL', 'Thiết kế cơ sở dữ liệu', 3, 1, 'HTTT'),
('PTTKHTTT', 'Phân tích thiết kế hệ thống thông tin', 4, 1, 'HTTT'),
('HDH', 'Hệ điều hành', 4, 0, 'KTMT'),
('NMCNPM', 'Nhập môn công nghệ phần mềm', 3, 0, 'CNPM'),
('LRCFW', 'Lập trình C for Win', 3, 1, 'CNPM'),
('LTHDT', 'Lập trình hướng đối tượng', 3, 1, 'CNPM');

insert into GIANGDAY(MALOP, MAMH, MAGV, HOCKY, TUNGAY, DENNGAY)
values
('K11', 'THDC', 'GV07', 1, 2006, '2/1/2006', '12/5/2006'),
('K12', 'THDC', 'GV06', 1, 2006, '2/1/2006', '12/5/2006'),
('K13', 'THDC', 'GV15', 1, 2006, '2/1/2006', '12/5/2006'),
('K11', 'CTRR', 'GV02', 1, 2006, '9/1/2006', '17/5/2006'),
('K12', 'CTRR', 'GV02', 1, 2006, '9/1/2006', '17/5/2006'),
('K13', 'CTRR', 'GV08', 1, 2006, '9/1/2006', '17/5/2006'),
('K11', 'CSDL', 'GV05', 2, 2006, '1/6/2006', '15/7/2006'),
('K12', 'CSDL', 'GV09', 2, 2006, '1/6/2006', '15/7/2006'),
('K13', 'CTDLGT', 'GV15', 2, 2006, '1/6/2006', '15/7/2006'),
('K13', 'CSDL', 'GV05', 3, 2006, '1/8/2006', '15/12/2006'),
('K13', 'DGMT', 'GV07', 3, 2006, '1/8/2006', '15/12/2006'),
('K11', 'CTDLGT', 'GV15', 3, 2006, '1/8/2006', '15/12/2006'),
('K12', 'CTDLGT', 'GV15', 3, 2006, '1/8/2006', '15/12/2006'),
('K11', 'HDH', 'GV04', 1, 2007, '2/1/2007', '18/2/2007'),
('K12', 'HDH', 'GV04', 1, 2007, '2/1/2007', '20/3/2007'),
('K11', 'DHMT', 'GV07', 1, 2007, '18/2/2007', '20/3/2007');

insert into DIEUKIEN(MAMH, MAMH_TRUOC)
values
('CSDL', 'CTRR'),
('CSDL', 'CTDLGT'),
('CTDLGT', 'THDC'),
('PTTKTT', 'THDC'),
('PTTKTT', 'CTDLGT'),
('DHMT', 'THDC'),
('LTHDT', 'THDC'),
('PTTKHTTT', 'CSDL');

insert into GIAOVIEN(MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA)
values
('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '2/5/1950', '11/1/2004', 5.00, 2250000, 'KHMT'),
('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '17/12/1965', '20/4/2004', 4.50, 2025000, 'HTTT'),
('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1/8/1950', '23/9/2004', 4.00, 1800000, 'CNPM'),
('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '22/2/1961', '12/1/2005', 4.50, 2025000, 'KTMT'),
('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '12/3/1958', '12/1/2005', 3.00, 1350000, 'HTTT'),
('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '11/3/1953', '12/1/2005', 4.50, 2050000, 'KTMT'),
('GV07', 'Nguyen Minh Tien', 'GV', 'GS', 'Nam', '23/11/1971', '1/3/2005', 4.00, 1800000, 'KTMT'),
('GV08', 'Le Thi Tran', 'KS', null, 'Nu', '26/3/1974', '1/3/2005', 1.69, 760500, 'KTMT'),
('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '31/12/1966', '1/3/2005', 4.00, 1800000, 'HTTT'),
('GV10', 'Le Tran Anh Loan', 'KS', null, 'Nu', '17/7/1972', '1/3/2005', 1.86, 837000, 'CNPM'),
('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '12/1/1980', '15/5/2005', 2.67, 1201500, 'MTT'),
('GV12', 'Tran Van Anh', 'CN', null, 'Nu', '29/3/1981', '15/5/2005', 1.69, 760500, 'CNPM'),
('GV13', 'Nguyen Linh Dan', 'CN', null, 'Nu', '23/5/1980', '15/5/2005', 1.69, 760500, 'KTMT'),
('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '30/15/1976', '15/5/2005', 3.00, 1350000, 'MTT'),
('GV15', 'Le Ha Thanh', 'PTS', 'GV', 'Nam', '4/5/1978', '15/5/2005', 3.00, 1350000, 'KHMT');


insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NGSINH, MALOP)
values
('K1101', 'Nguyen Van', 'A', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1102', 'Tran Ngoc', 'Han', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1103', 'Ha Duy', 'Lap', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1104', 'Tran Ngoc', 'Linh', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1105', 'Tran Minh', 'Long', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1106', 'Le Nhat', 'Minh', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1107', 'Nguyen Nhu', 'Nhut', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1108', 'Nguyen Manh', 'Tam', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1109', 'Phan Thi Thanh', 'Tam', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1110', 'Le Hoai', 'Thuong', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1111', 'Le Ha', 'Vinh', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
