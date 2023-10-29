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
('Sữa', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Thịt', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Mì Tôm', 'Gói', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Bánh mì', 'Túi', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Trứng', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Cà Phê', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Bia', 'Thùng', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Rau muống', 'Bó', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Bắp', 'Trái', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Gạo', 'KG', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Bột mì', 'KG', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Đường', 'KG', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Nước mắm', 'Chai', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Sữa chua', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Snack', 'Túi', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Bơ', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Bàn chải đánh răng', 'Cái', 100, 25, 5, '2023-01-02', 2, '2023-01-05'),
('Kem đánh răng', 'Hộp', 100, 25, 5, '2023-01-02', 2, '2023-01-05');
