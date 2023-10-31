create table MatHang(
	MaMH int primary key identity(1, 1),
	TenMH nvarchar(3000), 
	DVT nvarchar(3000),
	SLTonDau int,
	TGTonDau int,
	SLNhap int, 
	TGNhap date, 
	SLXuat int, 
	TGXuat date,
	check (SLTonDau >= 0)
);

create table NhaCC(
	MaNCC int primary key identity(1, 1),
	TenNCC nvarchar(3000) not null,
	DiaChiNCC nvarchar(3000),
	NoDau int,
);

create table DonHang(
	SoDH int primary key identity(1, 1),
	NgayDH date not null,
	MaNCC int references NhaCC(MaNCC),
	TriGia float,
	HinhThuTT int,
	check (HinhThuTT = 1 or HinhThuTT = 2)
);

create table CTDonHang(
	SoDH int references DonHang(SoDH),
	MaMH int references MatHang(MaMH),
	SLDat int, 
	DonGia float,
	check (SLDat > 0 and DonGia > 0),
	primary key(SoDH, MaMH)
);

create table NhanHang(
	SoPNH int primary key identity(1, 1),
	NgayNH date not null, 
	NguoiNhan nvarchar(3000),
	SoDH int references DonHang(SoDH),
);

create table CTNhanHang(
	SoPNH int references NhanHang(SoPNH),
	MaMH int references MatHang(MaMH),
	SLNhan int,
	primary key (SoPNH, MaMH)
);

create table PhieuXuat(
	SoPX int primary key identity(1, 1),
	NgayXuat date,
	NguoiXuat nvarchar(3000),
	LyDoXuat nvarchar(3000)
);

create table CTXuat(
	SoPX int references PhieuXuat(SoPX),
	MaMH int references MatHang(MaMH),
	SLXuat int, 
	DonGiaXuat float,
	check (SLXuat > 0 and DonGiaXuat > 0)
);

create table ThanhToan(
	SoCT int primary key identity(1, 1),
	NgayCT date not null,
	DienGiai nvarchar(3000),
	SoHD int,
	SoTien float,
);


-- INSERT
INSERT INTO MatHang(TenMH, DVT, SLTonDau, TGTonDau, SLNhap, TGNhap, SLXuat, TGXuat)
VALUES
('Sữa', 'Hộp', 100, 25, 50, '2023-01-02', 2, '2023-01-05'),
('Thịt', 'Hộp', 100, 5, 45, '2023-01-02', 2, '2023-01-05'),
('Mì Tôm', 'Gói', 100, 25, 34, '2023-01-02', 2, '2023-01-05'),
('Bánh mì', 'Túi', 100, 5, 9, '2023-01-02', 2, '2023-01-05'),
('Trứng', 'Hộp', 130, 5, 5, '2023-01-02', 2, '2023-01-05'),
('Cà Phê', 'Hộp', 110, 25, 7, '2023-01-02', 2, '2023-01-05'),
('Bia', 'Thùng', 120, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Rau muống', 'Bó', 150, 2, 5, '2023-01-02', 2, '2023-01-05'),
('Bắp', 'Trái', 100, 5, 2, '2023-01-02', 2, '2023-01-05'),
('Gạo', 'KG', 120, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Bột mì', 'KG', 100, 13, 5, '2023-01-02', 2, '2023-01-05'),
('Đường', 'KG', 90, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Nước mắm', 'Chai', 120, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Sữa chua', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Snack', 'Túi', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Bơ', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Bàn chải đánh răng', 'Cái', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Kem đánh răng', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05');


-- VIEWS
-- 1.
create view V_CHTD
as
select DonHang.SoDH, DonHang.NgayDH, CTDonHang.MaMH, MatHang.TenMH, MatHang.DVT, CTDonHang.SLDat, CTDonHang.DonGia, DonHang.TriGia
from DonHang inner join CTDonHang on DonHang.SoDH = CTDonHang.SoDH
inner join MatHang on CTDonHang.MaMH = MatHang.MaMH;

select * from V_CHTD;

-- 2.
create view V_TK_NHAP 
as 
select sum(CTDonHang.SLDat) as Tong_SLDat, sum(CTDonHang.DonGia) as Tong_Giatri
from CTDonHang inner join NhanHang on CTDonHang.SoDH = NhanHang.SoDH
group by CTDonHang.MaMH;

select * from V_TK_NHAP;

-- 3.
create view V_TK_XUAT
as
select sum(CTXuat.SLXuat) as Tong_SLXuat, sum(CTXuat.DonGiaXuat) as Tong_Giatri_Xuat
from PhieuXuat inner join CTXuat on PhieuXuat.SoPX = CTXuat.SoPX
group by CTXuat.MaMH;

select * from V_TK_XUAT;

-- PROCEDURES
-- 1.
-- Mat Hang
create proc insert_mathang @ten_mh nvarchar(3000), @dvt nvarchar(3000), @sl_ton_dau int, @tg_ton_dau int, @sl_nhap int, @tg_nhap date, @sl_xuat int, @tg_xuat date
as
begin
	insert into MatHang(TenMH, DVT, SLTonDau, TGTonDau, SLNhap, TGNhap, SLXuat, TGXuat) values(@ten_mh, @dvt, @sl_ton_dau, @tg_ton_dau, @sl_nhap, @tg_nhap, @sl_xuat, @tg_xuat);
end;

exec insert_mathang 'Sữa đậu nành', 'Hộp', 60, 10, 120, '2023-10-28', 5, '2023-10-29';

-- Nha CC
create proc insert_nhacc @ten_ncc nvarchar(3000), @dia_chi_ncc nvarchar(3000), @no_dau int
as 
begin
	insert into NhaCC(TenNCC, DiaChiNCC, NoDau) values(@ten_ncc, @dia_chi_ncc, @no_dau);
end;

exec insert_nhacc 'Vinasoy', 'P. Bến Nghé, Q1, TPHCM ', 500000;

-- Don Hang
create proc insert_donhang @ngay_dh date, @ma_ncc int, @trigia float, @hinhthuc_TT int
as 
begin
	insert into DonHang(NgayDH, MaNCC, TriGia, HinhThuTT) values (@ngay_dh, @ma_ncc, @trigia, @hinhthuc_TT);
end;

exec insert_donhang '2023-09-29', 1, 650000, 1;

-- CT Don Hang
create proc insert_ct_donhang @so_dh int, @ma_mh int, @sl_dat int, @don_gia float
as
begin
	insert into CTDonHang(SoDH, MaMH, SLDat, DonGia) values (@so_dh, @ma_mh, @sl_dat, @don_gia);
end;

exec insert_ct_donhang 1, 1, 5, 63000;

-- Nhan Hang
create proc insert_nhanhang @ngay_nh date, @nguoi_nhan nvarchar(3000), @so_dh int
as
begin
	insert into NhanHang(NgayNH, NguoiNhan, SoDH) values (@ngay_nh, @nguoi_nhan, @so_dh);
end;

exec insert_nhanhang '2023-10-29', 'Nguyen Van A', 1;

-- CT Nhan Hang
create proc insert_ct_nhanhang @so_pnh int, @ma_mh int, @sl_nhan int
as 
begin
	insert into CTNhanHang(SoPNH, MaMH, SLNhan) values(@so_pnh, @ma_mh, @sl_nhan);
end;

exec insert_ct_nhanhang 1, 2, 53;

-- Phieu Xuat
create proc insert_phieuxuat @ngay_xuat date, @nguoi_xuat nvarchar(3000), @ly_do_xuat nvarchar(3000)
as 
begin
	insert into PhieuXuat(NgayXuat, NguoiXuat, LyDoXuat) values (@ngay_xuat, @nguoi_xuat, @ly_do_xuat);
end;

exec insert_phieuxuat '2023-10-25', 'Nguyen Thi D', 'Xuất hàng cho công ty ABC';

-- CT Xuat
create proc insert_ct_xuat @so_px int, @ma_mh int, @sl_xuat int, @don_gia_xuat int
as 
begin
	insert into CTXuat(SoPX, MaMH, SLXuat, DonGiaXuat) values (@so_px,@ma_mh, @sl_xuat, @don_gia_xuat);
end;

exec insert_ct_xuat 1, 1, 6, 54000;

-- Thanh Toan 
create proc insert_thanh_toan @ngay_ct date, @dien_giai nvarchar(3000), @so_hd int, @so_tien float
as 
begin
	insert into ThanhToan(NgayCT, DienGiai, SoHD, SoTien) values (@ngay_ct, @dien_giai, @so_hd, @so_tien);
end;

exec insert_thanh_toan '2023-10-20', 'CT hoá đơn 01', 1, 670000;

-- 2.
-- Mat Hang
create proc delete_mathang @ma_mh int
as 
begin
	delete from CTDonHang where MaMH = @ma_mh;
	delete from CTNhanHang where MaMH = @ma_mh;
	delete from CTXuat where MaMH = @ma_mh;
	delete from MatHang where MaMH = @ma_mh;
end;

exec delete_mathang 1;
select * from MatHang;

drop proc delete_mathang;

-- Don Hang

create proc delete_donhang @so_dh int
as begin
	set @so_dh = (select top(1) SoPNH from NhanHang where SoDH = @so_dh);

	delete from NhanHang where SoDH = @so_dh;
	delete from CTDonHang where SoDH = @so_dh;
end;


-- Nha CC

create proc delete_nhacc @mancc int
as begin
	declare @ma_dh int, @so_pnh int;
	set @ma_dh = (select top(1) SoDH from DonHang where MaNCC = @mancc);

	set @so_pnh = (select top(1) SoPNH from NhanHang where SoDH = @ma_dh);

	exec dbo.delete_donhang @ma_dh;

	delete from NhaCC where MaNCC = @mancc;
end;

-- CT Don Hang
create proc delete_ct_donhang @so_dh int
as begin
	delete from CTDonHang where SoDH = @so_dh;
end;


-- CT Nhan Hang

create proc delete_ct_nhanhang @so_pnh int
as begin
	delete from CTNhanHang where SoPNH = @so_pnh;
end;

-- Nhan Hang

create proc delete_nhanhang @so_pnh int
as begin
	exec dbo.delete_ct_nhanhang @so_pnh;
	delete from NhanHang where SoPNH = @so_pnh;
end;


-- CT Xuat
create proc delete_ct_xuat @so_px int
as begin
	delete from CTXuat where SoPX = @so_px;
end;


-- Phieu Xuat

create proc delete_phieuxuat @so_px int
as begin
	exec dbo.delete_ct_xuat @so_px;
	delete from PhieuXuat where SoPX = @so_px;
end;


-- Thanh Toan 

create proc delete_thanhtoan @so_ct int
as begin
	delete from ThanhToan where SoCT = @so_ct;
end;

-- 3.
create proc update_ct_donhang @so_dh int, @ma_mh int, @sl_dat int
as begin
	update CTDonHang
	set SLDat = @sl_dat
	where SoDH = @so_dh and MaMH = @ma_mh;
end;

-- 4. 
create proc list_ct_donhang @so_dh int
as begin
	select MatHang.MaMH, MatHang.TenMH, CTDonHang.SLDat
	from MatHang inner join CTDonHang on MatHang.MaMH = CTDonHang.MaMH
	where CTDonHang.SoDH = @so_dh;
end;

-- 5.
create proc list_nhanhang @begin_date date, @end_date date
as begin
	select CTNhanHang.MaMH, sum(CTNhanHang.MaMH)
	from CTNhanHang inner join NhanHang on NhanHang.SoPNH = CTNhanHang.SoPNH
	where NgayNH > @begin_date and NgayNH < @end_date
	group by CTNhanHang.MaMH;
end;