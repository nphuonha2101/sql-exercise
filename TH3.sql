
use TH03;
set dateformat dmy;

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
	HESO float,
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
	DIEM float,
	KQUA varchar(255),
	primary key(MAHV, MAMH, LANTHI)
);


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

-- BATCHS
-- 1. Su dung kieu du lieu CURSOR, viet doan chuong trinh in ra danh sach giao vien cua tung khoa
go
declare @ma_khoa varchar(10), @ten_khoa nvarchar(3000), @ten_gv nvarchar(3000), @hocvi nvarchar(3000), @hocham nvarchar(3000);
declare khoa_cursor cursor for select MAKHOA, TENKHOA from KHOA;
open khoa_cursor;
fetch next from khoa_cursor into @ma_khoa, @ten_khoa;
while @@FETCH_STATUS = 0
begin 
	declare @index int = 0;
	print('----DANH SACH GIANG VIEN KHOA ' + @ten_khoa);
	declare gv_cursor cursor for select HOTEN, HOCVI, HOCHAM from GIAOVIEN where MAKHOA = @ma_khoa;
	open gv_cursor;
	fetch next from gv_cursor into @ten_gv, @hocvi, @hocham;
	while @@FETCH_STATUS = 0
	begin 
		set @index = @index + 1;
		print(cast(@index as varchar(5)) + ' ' + @ten_gv + ' ' + @hocvi + ' ' + @hocham);
		fetch next from gv_cursor into @ten_gv, @hocvi, @hocham;
	end
	
	deallocate gv_cursor;
	fetch next from khoa_cursor into @ma_khoa, @ten_khoa;
end

deallocate khoa_cursor;



--2. Su dung cau truc vong lap while, su dung sequence de tao TENMH, MAMH, nhap 10 mau MONHOC voi noi dung:
-- MAMH: 'M1', 'M2', ...
-- TENMH: 'Mon 1', 'Mon 2', ...
go
declare  @count int = 1;
while (@count <= 10) 
begin 
	insert into MONHOC values ('M' + cast(@count as varchar(10)) , 'Mon ' + cast(@count as varchar(10)) , 0, 0, null);
	set @count = @count + 1;
end;

select * from MONHOC;

-- FUNCTIONS
-- 1. Tao ham F_DTB cho biet diem trung binh cac mon thi cua hoc vien. Moi mon thi, chi lay diem sau cung, ma hoc vien la tham so cua ham.
go
create function f_dtb(@mahv varchar(10))
returns float
as
begin
return (
	select avg(DIEM)
	from HOCVIEN inner join KETQUATHI on HOCVIEN.MAHV = KETQUATHI.MAHV
	where HOCVIEN.MAHV = @mahv and KETQUATHI.LANTHI in (select MAX(KETQUATHI.LANTHI)
														from KETQUATHI 
														where MAHV = @mahv
														group by MAMH)
	group by HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN
)
end

print(dbo.f_dtb('k1102'));
select DTB from dbo.f_dtb('k1102');
drop function f_dtb;

-- 2. Tao ham f_xl co ma hoc vien la tham so, cho biet ket qua xep loai cua hoc vien nhu sau:
-- DTB >= 9 -> 'XS'
-- 8 <= DTB < 9 -> 'G'
-- 6.5 <= DTB < 8 -> 'K'
-- 5 <= DTB < 6.5 -> 'TB'
-- DTB < 5 -> 'Y'
go
create function f_xl(@mahv varchar(10))
returns varchar(5)
begin 
	declare @dtb float = dbo.f_dtb(@mahv);
	if (@dtb >= 9)
	begin 
		return 'XS';
	end
	if (8 <= @dtb and @dtb < 9)
	begin 
		return 'G';
	end
	if (6.5 <= @dtb and @dtb < 8)
	begin 
	return 'K';
	end
	if (5 <= @dtb and @dtb < 6.5)
	begin 
		return 'TB';
	end
	return 'Y';
end

print(dbo.f_xl('K1102'));

drop function f_xl;

-- 3. Tao ham f_dsmon cho  biet danh sach diem cac mon hoc ma hoc vien co ket qua 'Dat'
-- DS gom: MAMH, TENMH, DIEM
-- Ma hoc vien la tham so cua ham
go
create function f_dsmon(@mahv varchar(10))
returns table
as
return (
	select MONHOC.MAMH,MONHOC.TENMH, KETQUATHI.DIEM
	from MONHOC inner join KETQUATHI on MONHOC.MAMH = KETQUATHI.MAMH
	inner join HOCVIEN on HOCVIEN.MAHV = KETQUATHI.MAHV
	where HOCVIEN.MAHV = @mahv and KETQUATHI.LANTHI in (select max(KETQUATHI.LANTHI) from KETQUATHI group by MAMH) and KETQUATHI.DIEM >= 5
);

select * from f_dsmon('K1102');

-- 4. Tao ham f_dsgv cho biet danh sach hoc vien da day ma khoa phu trach. Ham co tham so la ma khoa
go
create function f_dsgv(@makhoa varchar(10))
returns table
as 
return (
	select GIAOVIEN.* 
	from GIAOVIEN inner join GIANGDAY on GIAOVIEN.MAGV = GIANGDAY.MAGV
	where GIANGDAY.MAMH in (select MONHOC.MAMH
							from MONHOC where MAKHOA = @makhoa)
);

select * from dbo.f_dsgv('HTTT');

-- 5. Tao ham tra ve danh sach hoc vien va ket qua xep loai tung hoc vien cua lop
-- Thong tin gom: MAHV, Ho & ten HV, DTB, Xep loai
-- Ma lop la tham so cua ham
go
create function f_tk_lop(@malop varchar(10))
returns table
as
return (
	select HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN, dbo.f_dtb(HOCVIEN.MAHV) as DTB, dbo.f_xl(HOCVIEN.MAHV) as XEPLOAI
	from HOCVIEN 
	where HOCVIEN.MALOP = @malop
);

select * from dbo.f_tk_lop('K12');

-- PROCEDURES
use TH03
go
create proc p_kqmh @p_mahv varchar(10)
as 
select HOCVIEN.MAHV,HOCVIEN.HO, HOCVIEN.TEN, MONHOC.MAMH, MONHOC.TENMH, KETQUATHI.DIEM
from HOCVIEN inner join KETQUATHI on HOCVIEN.MAHV = KETQUATHI.MAHV
inner join MONHOC on MONHOC.MAMH = KETQUATHI.MAMH
where HOCVIEN.MAHV = @p_mahv and KETQUATHI.LANTHI in (select MAX(LANTHI)
							from KETQUATHI 
							where KETQUATHI.MAHV = @p_mahv
							group by MAMH)

go;

exec p_kqmh 'k1102';

drop proc p_kqmh;

-- 2. Tao thu tuc p_gvmh, cho biet danh sach sinh vien hoc mon (p_mamh), do giao vien (p_mgv) phu trach trong hoc ky (p_hocky), nam hoc(p_nam)

use TH03
go
create proc p_gvmh @p_mamh varchar(10), @p_magv varchar(10), @p_hocky int, @p_nam int
as
select GIAOVIEN.MAGV, GIANGDAY.MAMH, HOCVIEN.HO, HOCVIEN.TEN
from HOCVIEN inner join LOP on HOCVIEN.MALOP = LOP.MALOP
inner join GIANGDAY on LOP.MALOP = GIANGDAY.MALOP
inner join GIAOVIEN on GIANGDAY.MAGV = GIAOVIEN.MAGV
where GIAOVIEN.MAGV = @p_magv and GIANGDAY.MAMH = @p_mamh and GIANGDAY.HOCKY = @p_hocky and GIANGDAY.NAM = @p_nam
go;

exec p_gvmh 'CTDLGT', 'GV15', 2, 2006;

-- 3. Tao thu tuc p_lop cho biet danh sach hoc vien cua lop (p_malop)
-- Thong tin gom: ma lop, ma gvcn, ten truong lop, mahv, ho & ten hoc vien
-- thu tuc nhan mot tham so dau vao la ma lop

use TH03
go
create proc p_lop @malop varchar(10)
as
declare @ten_truonglop nvarchar(3000);
select @ten_truonglop = HOCVIEN.TEN from HOCVIEN inner join LOP on HOCVIEN.MAHV = LOP.TRGLOP where LOP.MALOP = 'K11';

select LOP.MALOP, LOP.MAGVCN, GIAOVIEN.HOTEN as TEN_GVCN, @ten_truonglop as TEN_TRUONGLOP, HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN
from HOCVIEN inner join LOP on LOP.MALOP = HOCVIEN.MALOP 
inner join GIAOVIEN on LOP.MAGVCN = GIAOVIEN.MAGV
where LOP.MALOP = 'K11'

go;

exec p_lop 'K11';

drop proc p_lop;

-- 4. Tao thu tuc p_topN liet ke danh sach n mon hoc co so luong dang ky hoc nhieu nhat
-- Thong tin gom: ma mon hoc, ten mon hoc, so luong hoc vien
-- Nhan vao mot tham so n

use TH03
go
create proc p_topn @n int
as
select top(@n) MONHOC.MAMH, MONHOC.TENMH, count(HOCVIEN.MAHV) as SLDK
from MONHOC inner join GIANGDAY on MONHOC.MAMH = GIANGDAY.MAMH
inner join LOP on GIANGDAY.MALOP = LOP.MALOP
inner join HOCVIEN on LOP.MALOP = HOCVIEN.MALOP
group by MONHOC.MAMH, MONHOC.TENMH
order by count(HOCVIEN.MAHV) desc
go;

exec p_topn 9;

-- 5. Tao thu tuc p_tk, thong ke so luong hoc vien cua tung mon hoc ma giao vien (p_magv) da phu trach giang day
-- Thong tin gom: magv, ten gv, ma mh, ten mh, so luong hoc vien
-- Thu tuc nhan 1 tham so dau vao la ma giao vien (p_magv)

use TH03
go
create proc p_tk @p_magv varchar(10)
as
select  GIAOVIEN.MAGV, GIAOVIEN.HOTEN, MONHOC.MAMH, MONHOC.TENMH, count(HOCVIEN.MAHV) as SL_HOCVIEN
from MONHOC inner join GIANGDAY on MONHOC.MAMH = GIANGDAY.MAMH
inner join LOP on GIANGDAY.MALOP = LOP.MALOP
inner join HOCVIEN on LOP.MALOP = HOCVIEN.MALOP
inner join GIAOVIEN on GIAOVIEN.MAGV = GIANGDAY.MAGV
group by GIAOVIEN.MAGV, GIAOVIEN.HOTEN, MONHOC.MAMH, MONHOC.TENMH

go;

exec p_tk 'GV15';

-- TRIGGERS
-- 1. 
go
create trigger ketquathi_insert_update on KETQUATHI after insert, update 
as 
begin
declare @solanthi int;

	set @solanthi = (select LANTHI from inserted)

	if (@solanthi > 3)
	begin 
		raiserror('Mot hoc vien khong duoc thi mot mon qua 3 lan', 16, 1);
		rollback;
	end
end;

drop trigger ketquathi_insert_update;

insert into KETQUATHI
values
('K1104', 'CTRR', 4, '30/6/2006', 5.00, 'Dat');

-- 2.
go
create trigger giangday_insert_update on GIANGDAY after insert, update
as
begin
declare @hocky int;

	set @hocky = (select HOCKY from inserted);

	if (@hocky < 1 or @hocky > 3)
	begin 
		raiserror('Hoc ky chi co gia tri tu 1 den 3', 16, 1);
		rollback;
	end
end;

insert into GIANGDAY
values
('K13', 'LRCFW', 'GV07', 4, 2008, '2/1/2006', '12/5/2006');

-- 3
go
create trigger giaovien_hovi_insert_update on GIAOVIEN after insert, update
as
begin
	declare @hocvi nvarchar(3000);

	set @hocvi = (select HOCVI from inserted);

	if (@hocvi not in ('CN', 'KS', 'ThS', 'TS', 'PTS'))
	begin 
		raiserror('Hoc vi cua giao vien khong hop le', 16, 1);
		rollback;
	end
end;

insert into GIAOVIEN
values
('GV16', 'Nguyen Van C', 'Professor', 'GV', 'Nam', '4/5/1991', '15/5/2005', 3.00, 6350000, 'KHMT');

-- 4
go
create trigger hocvien_tuoi_insert_update on HOCVIEN after insert, update
as
begin 
	declare @tuoi int;

	set @tuoi = (select DATEPART(year, GETDATE()) - DATEPART(year, NGSINH) from inserted);
	if (@tuoi < 18)
	begin 
		raiserror('Hoc vien it nhat la 18 tuoi', 16, 1);
		rollback;
	end
end;

insert into HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP)
values
('K1313', 'Nguyen Tran', 'D', '27/1/2008', 'Nam', 'TP.HCM', 'K13');

-- 5
go
create trigger giangday_ngay_insert_update on GIANGDAY after insert, update
as
begin
	declare @tu_ngay date, @den_ngay date

	select @tu_ngay = TUNGAY, @den_ngay = DENNGAY from inserted;

	if (@tu_ngay > @den_ngay)
	begin 
		raiserror('Ngay bat dau phai nho hon hoac bang ngay ket thuc', 16, 1);
		rollback;
	end
end;

insert into GIANGDAY
values
('K13', 'LRCFW', 'GV07', 1, 2008, '2/1/2006', '12/12/2005');

-- 6
go
create trigger giaovien_tuoi_insert_update on GIAOVIEN after insert, update
as
begin 
	declare @tuoi int;

	set @tuoi = (select DATEPART(year, GETDATE()) - DATEPART(year, NGSINH) from inserted);

	if (@tuoi < 22)
	begin 
		raiserror('Giao vien khi vao lam it nhat 22 tuoi', 16, 1);
		rollback;
	end
end;

insert into GIAOVIEN
values
('GV16', 'Nguyen Van C', 'KS', 'GV', 'Nam', '4/5/2003', '15/5/2005', 3.00, 1350000, 'KHMT');

-- 7
go
create trigger monhoc_tinchi_insert_update on MONHOC after insert, update
as
begin
	declare @tc_lt int, @tc_th int;

	select @tc_lt = TCLT, @tc_th = TCTH from inserted;

	if (abs(@tc_lt - @tc_th) > 3)
	begin 
		raiserror('Cac mon hoc co TCLT va TCTH khong lech nhau qua 3TC', 16, 1);
		rollback;
	end
end;

insert into MONHOC(MAMH, TENMH, TCLT, TCTH, MAKHOA)
values
('GTNM', 'Giao tiep nguoi may', 4, 8, 'KHMT');

-- 8
go
create trigger giangday_monhoc_lop_insert_update on GIANGDAY after insert, update
as
begin 
	declare @count_mh int;

	set @count_mh = (select count(GIANGDAY.MAMH) 
					from GIANGDAY inner join inserted
					on GIANGDAY.MALOP = inserted.MALOP
					where GIANGDAY.HOCKY = inserted.HOCKY
					group by GIANGDAY.MALOP)

	if (@count_mh > 3)
	begin
		raiserror('Moi mot lop chi duoc hoc toi da 3 mon trong hoc ky', 16, 1);
		rollback;
	end
end;

insert into GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
values
('K11', 'NMCNPM', 'GV07', 1, 2006, '2/1/2006', '12/5/2006');

drop trigger giangday_monhoc_lop_insert_update;

select * from GIANGDAY;

delete from GIANGDAY where MALOP = 'K11' and MAMH = 'NMCNPM';

-- 9
go
create trigger lop_siso_update on LOP after update
as
begin
	declare @update_siso int, @siso_thuc int, @malop varchar(10);
	set @malop = (select MALOP from inserted);

	set @update_siso = (select count(HOCVIEN.MAHV)
						from HOCVIEN inner join LOP on HOCVIEN.MALOP = LOP.MALOP
						where LOP.MALOP = @malop
						group by LOP.MALOP);

	set @siso_thuc = (select SISO from inserted);

	if (@update_siso <> @siso_thuc)
	begin
		raiserror('Si so phai bang so luong hoc vien cua lop do', 16, 1);
		rollback;
	end
end;

-- si so lop k11 la 11
update LOP 
set SISO = 10 where MALOP = 'K11';

drop trigger lop_siso_update;

-- 10
go
create trigger dieukien_insert_update on DIEUKIEN after insert, update
as 
begin 
	declare @ma_mh varchar(10), @ma_mhtruoc varchar(10);

	select @ma_mh = MAMH, @ma_mhtruoc = MAMH_TRUOC from inserted;

	if (@ma_mh = @ma_mhtruoc)
	begin
		raiserror('Ma mon hoc va ma mon hoc truoc khong duoc giong nhau', 16, 1);
		rollback;
	end
	
	if exists (select * from DIEUKIEN where MAMH = @ma_mhtruoc and MAMH_TRUOC = @ma_mh)
	begin
		raiserror('Ma mon hoc va ma mon hoc truoc khong duoc phu thuoc nhau', 16, 1);
		rollback;
	end
end;

insert into DIEUKIEN(MAMH, MAMH_TRUOC)
values
('CTRR', 'CSDL');

-- 11
go
create trigger giaovien_luong_insert_update on GIAOVIEN after insert, update
as
begin
	declare @hocvi nvarchar(3000), @hocham nvarchar(3000), @muc_luong int, @mucluong_ud_ins int;

	select @hocvi = HOCVI, @hocham = HOCHAM, @mucluong_ud_ins = MUCLUONG from inserted;

	set @muc_luong = (select top(1) MUCLUONG from GIAOVIEN where HOCVI = @hocvi and HOCHAM = @hocham);

	if (@muc_luong <> @mucluong_ud_ins)
	begin 
		raiserror('Muc luong cua giao vien chua hop ly', 16, 1);
		rollback;
	end
end;

-- muc luong cua PTS va GS la: 2250000
insert into GIAOVIEN(MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA)
values
('GV16', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '2/5/1950', '11/1/2004', 5.00, 2260000, 'KHMT');

delete from GIAOVIEN where MAGV = 'GV16';

-- 12
go
create trigger ketqua_thilai_insert on KETQUATHI after insert
as
begin
	declare @mahv varchar(10), @mamh varchar(10), @solanthi int, @diem float;

	select @mahv = MAHV, @mamh = MAMH from inserted;

	set @solanthi = (select LANTHI - 1 from inserted);

	set @diem = (select KETQUATHI.DIEM from KETQUATHI
	where KETQUATHI.MAMH = @mamh and KETQUATHI.MAHV = @mahv and KETQUATHI.LANTHI = @solanthi);

	if (@diem >= 5)
	begin 
		raiserror('Thong tin thi lai khong hop le', 16, 1);
		rollback;
	end
end;

drop trigger ketqua_thilai_insert;

insert into KETQUATHI
values
('K1305', 'CTRR', 2, '13/05/2006', 10.00, 'Dat');

delete from KETQUATHI where  MAHV = 'K1305' and MAMH = 'CTRR' and LANTHI = 2;

select * from KETQUATHI;

-- 13
go
create trigger ketqua_ngaythi_insert on KETQUATHI after insert
as
begin
	declare @mahv varchar(10), @mamh varchar(10), @ngaythitruoc date, @ngaythihientai date, @solanthitruoc int;

	select @mahv = MAHV, @mamh = MAMH, @solanthitruoc = LANTHI - 1, @ngaythihientai = NGTHI from inserted;

	select @ngaythitruoc = NGTHI from KETQUATHI where MAHV = @mahv and MAMH = @mamh and LANTHI = @solanthitruoc;

	if (@ngaythihientai <= @ngaythitruoc)
	begin 
		raiserror('Ngay thi hien tai phai lon hon  ngay thi truoc', 16, 1);
		rollback;
	end
end;

insert into KETQUATHI
values
('K1303', 'THDC', 2, '20/05/2005', 4.50, 'Khong Dat');

-- 14
go
create trigger giangday_khoaphutrach_insert_update on GIANGDAY after insert, update
as
begin
	declare @magv varchar(10), @makhoa varchar(10), @mamh varchar(10);

	select @magv = MAGV, @mamh = MAMH from inserted;

	set @makhoa = (select MAKHOA from GIAOVIEN where MAGV = @magv);

	if exists (select @mamh from MONHOC where MAKHOA = @makhoa)
	begin
		raiserror('Mon hoc khong thuoc khoa cua GV phu trach', 16, 1);
		rollback;
	end
end;

-- NMCNPM thuoc KHOA CNPM, GV06 thuoc KHOA CTMT
insert into GIANGDAY(MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
values
('K12', 'NMCNPM', 'GV06', 2, 2006, '2/1/2006', '12/5/2006');
