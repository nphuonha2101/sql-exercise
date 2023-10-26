
use TH03;

create table HOCVIEN(
	MAHV varchar(10) not null primary key,
	HO nvarchar(3000),
	TEN nvarchar(3000),
	NGSINH date,
	GIOITINH varchar(10),
	NOISINH nvarchar(3000),
	MALOP varchar(10)
);

create table KHOA(
	MAKHOA varchar(10) not null primary key,
	TENKHOA nvarchar(3000),
	NGTLAP date,
	TRGKHOA varchar(10)
);

create table GIAOVIEN(
	MAGV varchar(10) not null primary key,
	HOTEN nvarchar(3000),
	HOCVI nvarchar(3000),
	HOCHAM nvarchar(3000),
	GIOITINH varchar(10),
	NGSINH date,
	NGVL date,
	HESO numeric,
	MUCLUONG int,
	MAKHOA varchar(10) references KHOA(MAKHOA)
);

create table MONHOC(
	MAMH varchar(10) not null primary key,
	TENMH nvarchar(3000),
	TCLT int,
	TCTH int,
	MAKHOA varchar(10) references KHOA(MAKHOA)
);

create table LOP(
	MALOP varchar(10) not null primary key,
	TENLOP nvarchar(3000),
	TRGLOP varchar(10) references HOCVIEN(MAHV),
	SISO int,
	MAGVCN varchar(10) references GIAOVIEN(MAGV)
);

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
	NAM int,
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
	KQUA varchar(255),
	primary key(MAHV, MAMH, LANTHI)
);

set dateformat dmy;
-- insert
insert into KHOA(MAKHOA, TENKHOA, NGTLAP, TRGKHOA)
values
('KHMT', 'Khoa học máy tính', '7/6/2005', 'GV01'),
('HTTT', 'Hệ thống thông tin', '7/6/2005', 'GV02'),
('CNPM', 'Công nghệ phần mềm', '7/6/2005', 'GV04'),
('MMT', 'Mạng và truyền thông', '20/10/2005', 'GV03'),
('KTMT', 'Kỹ thuật máy tính', '20/12/2005', null);

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
('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '12/1/1980', '15/5/2005', 2.67, 1201500, 'MMT'),
('GV12', 'Tran Van Anh', 'CN', null, 'Nu', '29/3/1981', '15/5/2005', 1.69, 760500, 'CNPM'),
('GV13', 'Nguyen Linh Dan', 'CN', null, 'Nu', '23/5/1980', '15/5/2005', 1.69, 760500, 'KTMT'),
('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '30/11/1976', '15/5/2005', 3.00, 1350000, 'MMT'),
('GV15', 'Le Ha Thanh', 'PTS', 'GV', 'Nam', '4/5/1978', '15/5/2005', 3.00, 1350000, 'KHMT');

insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP)
values
('K1101', 'Nguyen Van', 'A', '27/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1102', 'Tran Ngoc', 'Han', '14/3/1986', 'Nu', 'Kien Giang', 'K11'),
('K1103', 'Ha Duy', 'Lap', '18/4/1986', 'Nam', 'Nghe An', 'K11'),
('K1104', 'Tran Ngoc', 'Linh', '30/3/1986', 'Nu', 'Tay Ninh', 'K11'),
('K1105', 'Tran Minh', 'Long', '27/2/1986', 'Nam', 'TP.HCM', 'K11'),
('K1106', 'Le Nhat', 'Minh', '24/1/1986', 'Nam', 'TP.HCM', 'K11'),
('K1107', 'Nguyen Nhu', 'Nhut', '27/1/1986', 'Nam', 'Ha Noi', 'K11'),
('K1108', 'Nguyen Manh', 'Tam', '27/2/1986', 'Nam', 'Kien Giang', 'K11'),
('K1109', 'Phan Thi Thanh', 'Tam', '21/1/1986', 'Nu', 'Vinh Long', 'K11'),
('K1110', 'Le Hoai', 'Thuong', '5/2/1986', 'Nu', 'Can Tho', 'K11'),
('K1111', 'Le Ha', 'Vinh', '25/12/1986', 'Nam', 'Vinh Long', 'K11'),
('K1201', 'Nguyen Van', 'B', '11/2/1986', 'Nam', 'TP.HCM', 'K12'),
('K1202', 'Nguyen Thi Kim', 'Duyen', '25/12/1986', 'Nam', 'TP.HCM', 'K12'),
('K1203', 'Tran Thi Kim', 'Duyen', '17/9/1986', 'Nu', 'TP.HCM', 'K12'),
('K1204', 'Truong My', 'Hanh', '19/5/1986', 'Nu', 'Dong Nai', 'K12'),
('K1205', 'Nguyen Thanh', 'Nam', '17/4/1986', 'Nam', 'TP.HCM', 'K12'),
('K1206','Nguyen Thi Truc','Thanh','04/03/1986','Nu','Kien Giang','K12'),
('K1207','Tran Thi Bich','Thuy','08/02/1986','Nu','Nghe An','K12'),
('K1208','Huynh Thi Kim','Trieu','08/04/1986','Nu',' Tay Ninh','K12'),
('K1209','Phạm Thanh','Trieu','23/02/1986','Nam','TP.HCM','K12'),
('K1210', 'Ngo Thanh', 'Tuan', '14/02/1986', 'Nam', 'TP.HCM', 'K12'),
('K1211', 'Do Thi', 'Xuan', '09/03/1986', 'Nu', 'Ha Noi', 'K12'),
('K1212', 'Le Thi Phi', 'Yen', '12/03/1986', 'Nu', 'TP.HCM', 'K12'),
('K1301', 'Nguyen Thi Kim', 'Cuc', '09/06/1986', 'Nu', 'Kien Giang', 'K13'),
('K1302', 'Truong Thi My', 'Hien', '18/03/1986', 'Nu', 'Nghe An', 'K13'),
('K1303', 'Le Duc', 'Hien', '21/03/1986', 'Nam', 'Tay Ninh', 'K13'),
('K1304', 'Le Quang', 'Hien ', '18/04/1986', 'Nam ', 'TP.HCM ', 'K13'),
('K1305', 'Le Thi', 'Huong', '27/03/1986 ', 'Nu', 'TP.HCM', 'K13'),
('K1306', 'Nguyen Thai', 'Huu ', '30/03/1986', 'Nam', 'Ha Noi', 'K13'),
('K1307', 'Tran Minh', 'Man ', '28/05/1986 ', 'Nam', 'TP.HCM ', 'K13'),
('K1308', 'Nguyen Hieu', 'Nghia', '08/04/1986', 'Nam', 'Kien Giang', 'K13'),
('K1309', 'Nguyen Trung', 'Nghia', '18/01/1987', 'Nam', 'Nghe An', 'K13'),
('K1310', 'Tran Thi Hong','Tham', '22/04/1986','Nu','Tay Ninh', 'K13'),
('K1311', 'Tran Minh', 'Thuc', ' 04/04/1986', 'Nam', 'TP.HCM', 'K13'),
('K1312', 'Nguyen Thi Kim', 'Yen', '07/09/1986', 'Nu', 'TP.HCM', 'K13');


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

insert into GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
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
('K13', 'DHMT', 'GV07', 3, 2006, '1/8/2006', '15/12/2006'),
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


insert into KETQUATHI(MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) 
values
('K1101', 'CSDL', 1, '20/7/2006', 10.00, 'Dat'),
('K1101', 'CTDLGT', 1, '28/12/2006', 9.00, 'Dat'),
('K1101', 'THDC', 1, '20/5/2006', 9.00, 'Dat'),
('K1101', 'CTRR', 1, '13/5/2006', 9.50, 'Dat'),
('K1102', 'CSDL', 1, '20/7/2006', 4.00, 'Khong Dat'),
('K1102', 'CSDL', 2, '27/7/2006', 4.25, 'Khong Dat'),
('K1102', 'CSDL', 3, '10/8/2006', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 1, '28/12/2006', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 2, '5/1/2007', 4.00, 'Khong Dat'),
('K1102', 'CTDLGT', 3, '15/1/2007', 6.00, 'Dat'),
('K1102', 'THDC', 1, '20/5/2006', 5.00, 'Dat'),
('K1102', 'CTRR', 1, '13/5/2006', 7.00, 'Dat'),
('K1103', 'CSDL', 1, '20/7/2006', 3.50, 'Khong Dat'),
('K1103', 'CSDL', 2, '27/7/2006', 8.25, 'Dat'),
('K1103', 'CTDLGT', 1, '28/12/2006', 7.00, 'Dat'),
('K1103', 'THDC', 1, '20/5/2006', 8.00, 'Dat'),
('K1103', 'CTRR', 1, '13/5/2006', 6.50, 'Dat'),
('K1104', 'CSDL', 1, '20/7/2006', 3.75, 'Khong Dat'),
('K1104', 'CTDLGT', 1, '28/12/2006', 4.00, 'Khong Dat'),
('K1104', 'THDC', 1, '20/5/2006', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 1, '13/5/2006', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 2, '20/5/2006', 3.50, 'Khong Dat'),
('K1104', 'CTRR', 3, '30/6/2006', 4.00, 'Khong Dat'),
('K1201', 'CTDLGT', 1, '28/12/2006', 5.00, 'Dat'),
('K1201', 'THDC', 1, '20/5/2006', 8.50, 'Dat'),
('K1201', 'CTRR', 1, '13/5/2006', 9.00, 'Dat'),
('K1202', 'CSDL', 1, '20/7/2006', 8.00, 'Dat'),
('K1202', 'CTDLGT', 1, '28/12/2006', 4.00, 'Khong Dat'),
('K1202', 'CTDLGT', 2, '5/1/2007', 5.00, 'Dat'),
('K1202', 'THDC', 1, '20/5/2006', 4.00, 'Khong Dat'),
('K1202', 'THDC', 2, '27/5/2006', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 1, '13/5/2006', 3.00, 'Khong Dat'),
('K1202', 'CTRR', 2, '20/05/2006', 4.00, 'Khong Dat'),
('K1202', 'CSDL', 3, '30/06/2006', 6.25, 'Dat'),
('K1203', 'CTDLGT', 1, '20/07/2006', 9.25, 'Dat'),
('K1203', 'THDC', 1, '28/12/2006', 9.50, 'Dat'),
('K1203', 'CTRR', 1, '20/05/2006', 10.00, 'Dat'),
('K1203', 'CSDL', 1, '13/05/2006', 10.00, 'Dat'),
('K1204', 'CTDLGT', 1, '20/07/2006', 8.50, 'Dat'),
('K1204', 'THDC', 1, '28/12/2006', 6.75, 'Dat'),
('K1204', 'CTRR', 1, '20/05/2006', 4.00, 'Khong Dat'),
('K1204', 'CSDL', 1, '13/05/2006', 6.00, 'Dat'),
('K1301', 'CTDLGT', 1, '20/12/2006', 4.25, 'Khong Dat'),
('K1301', 'THDC', 1, '25/07/2006', 8.00, 'Dat'),
('K1301', 'CTRR', 1, '20/05/2006', 7.75, 'Dat'),
('K1301', 'CSDL', 1, '13/05/2006', 8.00, 'Dat'),
('K1302', 'CTDLGT', 1, '20/12/2006', 6.75, 'Dat'),
('K1302', 'THDC', 1, '25/07/2006', 5.00, 'Dat'),
('K1302', 'CTRR', 1, '13/05/2006', 8.50, 'Dat'),
('K1303', 'CSDL', 1, '20/12/2006', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 1, '25/07/2006', 4.50, 'Khong Dat'),
('K1303', 'CTDLGT', 2, '07/08/2006', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 3, '15/08/2006', 4.25, 'Khong Dat'),
('K1303', 'THDC', 1, '20/05/2006', 4.50, 'Khong Dat'),
('K1303', 'CTRR', 1, '13/05/2006', 3.25, 'Khong Dat'),
('K1303', 'CTRR', 2, '20/05/2006', 5.00, 'Dat'),
('K1304', 'CSDL', 1, '20/12/2006', 7.75, 'Dat'),
('K1304', 'CTDLGT', 1, '25/07/2006', 9.75, 'Dat'),
('K1304', 'THDC', 1, '20/05/2006', 5.50, 'Dat'),
('K1304', 'CTRR', 1, '13/05/2006', 5.00, 'Dat'),
('K1305', 'CSDL', 1, '20/12/2006', 9.25, 'Dat'),
('K1305', 'CTDLGT', 1, '25/07/2006', 10.00, 'Dat'),
('K1305', 'THDC', 1, '20/05/2006', 8.00, 'Dat'),
('K1305', 'CTRR', 1, '13/05/2006', 10.00, 'Dat');


-- Contraints
alter table KHOA add constraint FK_TRUONGKHOA foreign key (TRGKHOA) references GIAOVIEN(MAGV);
alter table GIAOVIEN add constraint FK_MAKHOA foreign key (MAKHOA) references KHOA(MAKHOA);
alter table HOCVIEN add constraint FK_MALOP foreign key (MALOP) references LOP(MALOP);


