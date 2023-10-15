﻿


CREATE TABLE NHACC(
	MaNCC varchar(8) ,
	TenNCC varchar(40) ,
	DiaChiNCC varchar(40) ,
	DTNCC varchar(10) ,
	PRIMARY KEY (MaNCC)
);


CREATE TABLE LoaiNGK(
	MaLoaiNGK varchar(8) ,
	TenLoaiNGK varchar(40) ,
	MaNCC varchar(8) ,
	PRIMARY KEY (MaLoaiNGK),
	FOREIGN KEY (MaNCC) REFERENCES NHACC (MaNCC)
);


CREATE TABLE NGK(
	MaNGK varchar(8) ,
	TenNGK varchar(40) ,
	Quycach varchar(8) ,
	MaLoaiNGK varchar(8) ,
	PRIMARY KEY (MaNGK),
	FOREIGN KEY (MaLoaiNGK) REFERENCES LoaiNGK (MaLoaiNGK)
);

CREATE TABLE KH(
	MaKH varchar(8) ,
	TenKH varchar(40) ,
	DCKH varchar(40) ,
	DTKH varchar(10) ,
	PRIMARY KEY (MaKH)
);

CREATE TABLE DDH(
	SODDH varchar(8) ,
	NgayDH date ,
	MaNCC varchar(8) ,
	PRIMARY KEY (SODDH),
	FOREIGN KEY (MaNCC) REFERENCES NHACC (MaNCC)
);
CREATE TABLE CT_DDH(
	SODDH varchar(8) ,
	MaNGK varchar(8) ,
	SLDat integer,
	PRIMARY KEY (SODDH,MaNGK),
	FOREIGN KEY (MaNGK) REFERENCES NGK (MaNGK),
	FOREIGN KEY (SODDH) REFERENCES DDH (SODDH)
);

CREATE TABLE PHIEUGH(
	SoPGH varchar(8) ,
	NgayGH date ,
	SODDH varchar(8) ,
	PRIMARY KEY (SoPGH),
	FOREIGN KEY (SODDH) REFERENCES DDH (SODDH)
);
CREATE TABLE CT_PGH(
	SoPGH varchar(8) ,
	MaNGK varchar(8) ,
	SLGiao integer,
	DGGiao numeric,
	PRIMARY KEY (SoPGH,MaNGK),
	FOREIGN KEY (MaNGK) REFERENCES NGK (MaNGK),
	FOREIGN KEY (SoPGH) REFERENCES PHIEUGH (SoPGH)
);
CREATE TABLE HOADON(
	SoHD varchar(8) ,
	NgayLapHD date ,
	MaKH varchar(8) ,
	PRIMARY KEY (SoHD),
	FOREIGN KEY (MaKH) REFERENCES KH (MaKH)
);
CREATE TABLE CT_HOADON(
	SoHD varchar(8) ,
	MaNGK varchar(8) ,
	SLKHMua integer,
	DGBan numeric,
	PRIMARY KEY (SoHD,MaNGK),
	FOREIGN KEY (MaNGK) REFERENCES NGK (MaNGK),
	FOREIGN KEY (SoHD) REFERENCES HOADON (SoHD)
);
CREATE TABLE PHIEUHEN(
	SoPH varchar(8) ,
	NgayLapPH date ,
	NgayHenGiao date ,
	MaKH varchar(8) ,
	PRIMARY KEY (SoPH),
	FOREIGN KEY (MaKH) REFERENCES KH (MaKH)
);
CREATE TABLE CT_PH(
	SoPH varchar(8) ,
	MaNGK varchar(8) ,
	SLHen integer,
	PRIMARY KEY (SoPH,MaNGK),
	FOREIGN KEY (MaNGK) REFERENCES NGK (MaNGK),
	FOREIGN KEY (SoPH) REFERENCES PHIEUHEN (SoPH)
);
CREATE TABLE PHIEUTRANO(
	SoPTN varchar(8) ,
	NgayTra date ,
	SoTienTra numeric,
	SoHD varchar(8) ,
	PRIMARY KEY (SoPTN),
	FOREIGN KEY (SoHD) REFERENCES HOADON (SoHD)
);



SET DATEFORMAT dmy;  

-- NHACC
INSERT INTO NHACC(MaNCC,TenNCC,DiaChiNCC,DTNCC)
VALUES('NC1','Công ty NGK quốc tế Coca Cola','Xa lộ HN, Thủ Đức, TpHCM','088967908');
INSERT INTO NHACC(MaNCC,TenNCC,DiaChiNCC,DTNCC)
VALUES('NC2','Công ty NGK quốc tế Pepsi','Bến Chương Dương, Q.1, TpHCM','083663366');
INSERT INTO NHACC(MaNCC,TenNCC,DiaChiNCC,DTNCC) 
VALUES('NC3','Công ty NGK Bến Chương Dương','Hàm Tử, Q.5, TpHCM','089456677');

-- LOAI NGK
INSERT INTO LoaiNGK(MaLoaiNGK,TenLoaiNGK,MaNCC)
VALUES('NK1','Nước uống co gas','NC1');
INSERT INTO LoaiNGK(MaLoaiNGK,TenLoaiNGK,MaNCC)
VALUES('NK2','Nước uống khong gas','NC2');
INSERT INTO LoaiNGK(MaLoaiNGK,TenLoaiNGK,MaNCC)
VALUES('NK3','Trà','NC1');
INSERT INTO LoaiNGK(MaLoaiNGK,TenLoaiNGK,MaNCC)
VALUES('NK4','Sữa','NC2');


-- NGK
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('CC1','Coca Cola','chai','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('CC2','Coca Cola','lon','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('PS1','Pepsi','chai','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('PS2','Pepsi','lon','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('SV1','Seven Up','chai','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('SV2','Seven Up','lon','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('NO1','Number One','chai','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('NO2','Number One','lon','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('ST1','Sting','chai','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('ST2','Sting','lon','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('C2','Trà C2','chai','NK2');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('OD','Trà xanh 0 độ','chai','NK2');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('ML1','Sữa tươi tiệt trùng','bịch','NK1');
INSERT INTO NGK(MaNGK,TenNGK,Quycach,MaLoaiNGK)
VALUES('WT1','Nước uống đóng chai','chai','NK2');

--CT_DDH
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH01', 'CC1', 20);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH01', 'CC2', 15);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH01', 'PS1', 18);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH01', 'SV2', 12);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH02', 'CC2', 30);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH02', 'PS1', 10);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH02', 'SV1', 5);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH02', 'ST1', 15);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH02', 'C2', 10);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH03', 'OD', 45);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH04', 'CC1', 8);
INSERT INTO CT_DDH(SODDH, MaNGK,SLDat)
VALUES ('DDH04', 'ST2', 12);


-- KH
INSERT INTO KH(MaKH,TenKH,DCKH,DTKH)
VALUES('KH01','Cửa hàng BT','144 XVNT','088405996');
INSERT INTO KH(MaKH,TenKH,DCKH,DTKH)
VALUES('KH02','Cửa hàng Tra','198/42 NNT','085974572');
INSERT INTO KH(MaKH,TenKH,DCKH,DTKH)
VALUES('KH03','Sieu Thi Coop','24 DTH','086547888');

--DDH
INSERT INTO DDH(SODDH,NgayDH,MaNCC)
VALUES('DDH01','10-05-2011','NC1');
INSERT INTO DDH(SODDH,NgayDH,MaNCC)
VALUES('DDH02','20-05-2011','NC1');
INSERT INTO DDH(SODDH,NgayDH,MaNCC)
VALUES('DDH03','26-05-2011','NC2');
INSERT INTO DDH(SODDH,NgayDH,MaNCC)
VALUES('DDH04','3-06-2011','NC2');



--PHIEUGH
INSERT INTO PHIEUGH(SoPGH,NgayGH,SODDH)
VALUES('PGH01','12-5-2010','DDH01');
INSERT INTO PHIEUGH(SoPGH,NgayGH,SODDH)
VALUES('PGH02','15-5-2010','DDH01');
INSERT INTO PHIEUGH(SoPGH,NgayGH,SODDH)
VALUES('PGH03','21-5-2010','DDH02');
INSERT INTO PHIEUGH(SoPGH,NgayGH,SODDH)
VALUES('PGH04','22-5-2010','DDH02');
INSERT INTO PHIEUGH(SoPGH,NgayGH,SODDH)
VALUES('PGH05','28-5-2010','DDH03');

--CT_PGH
INSERT INTO CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao)
VALUES ('PGH01', 'CC1', 15, 5000);
INSERT INTO CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao)
VALUES ('PGH01', 'CC2', 15, 4000);
INSERT INTO CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao)
VALUES ('PGH01', 'SV2', 10, 4000);
INSERT INTO CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao)
VALUES ('PGH02', 'SV2', 2, 4000);
INSERT INTO CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao)
VALUES ('PGH03', 'CC2', 30, 5000);
INSERT INTO CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao)
VALUES ('PGH03', 'PS2', 10, 4000);
INSERT INTO CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao)
VALUES ('PGH03', 'ST1', 15, 9000);
INSERT INTO CT_PGH(SoPGH, MaNGK, SLGiao, DGGiao)
VALUES ('PGH03', 'C2', 10, 8000);

--HOADON
INSERT INTO HOADON(SoHD, NgayLapHD, MaKH)
VALUES ('HD01', '10-05-2010', 'KH01');
INSERT INTO HOADON(SoHD, NgayLapHD, MaKH)
VALUES ('HD02', '20-05-2010', 'KH01');
INSERT INTO HOADON(SoHD, NgayLapHD, MaKH)
VALUES ('HD03', '05-06-2010', 'KH02');
INSERT INTO HOADON(SoHD, NgayLapHD, MaKH)
VALUES ('HD04', '16-06-2010', 'KH02');
INSERT INTO HOADON(SoHD, NgayLapHD, MaKH)
VALUES ('HD05', '22-06-2011', 'KH02');
INSERT INTO HOADON(SoHD, NgayLapHD, MaKH)
VALUES ('HD06', '08-07-2010', 'KH03');

--CT_HOADON
INSERT INTO CT_HOADON(SoHD,MaNGK,SLKHMua,DGBan)
VALUES('HD01','CC1',20,6000);
INSERT INTO CT_HOADON(SoHD,MaNGK,SLKHMua,DGBan)
VALUES('HD01','CC2',50,5000);
INSERT INTO CT_HOADON(SoHD,MaNGK,SLKHMua,DGBan)
VALUES('HD02','ST1',40,10000);
INSERT INTO CT_HOADON(SoHD,MaNGK,SLKHMua,DGBan)
VALUES('HD03','SV2',60,5000);
INSERT INTO CT_HOADON(SoHD,MaNGK,SLKHMua,DGBan)
VALUES('HD04','PS2',25,5000);

--PHIEUHEN
INSERT INTO PHIEUHEN(SoPH, NgayLapPH, NgayHenGiao, MaKH)
VALUES ('PH01', '08-05-2010', '09-06-2010', 'KH01');
INSERT INTO PHIEUHEN(SoPH, NgayLapPH, NgayHenGiao, MaKH)
VALUES ('PH02', '25-05-2010', '28-06-2010', 'KH02');
INSERT INTO PHIEUHEN(SoPH, NgayLapPH, NgayHenGiao, MaKH)
VALUES ('PH03', '01-06-2010', '02-06-2010', 'KH03');

--CT_PH
INSERT INTO CT_PH(SoPH,MaNGK,SLHen)
VALUES ('PH01','ST2',10);
INSERT INTO CT_PH(SoPH,MaNGK,SLHen)
VALUES ('PH01','OD',8);
INSERT INTO CT_PH(SoPH,MaNGK,SLHen)
VALUES ('PH02','CC1',20);
INSERT INTO CT_PH(SoPH,MaNGK,SLHen)
VALUES ('PH03','ST1',7);
INSERT INTO CT_PH(SoPH,MaNGK,SLHen)
VALUES ('PH03','SV2',12);
INSERT INTO CT_PH(SoPH,MaNGK,SLHen)
VALUES ('PH03','CC2',9);
INSERT INTO CT_PH(SoPH,MaNGK,SLHen)
VALUES ('PH04','PS2',15);


--PHIEU TRA NO
INSERT INTO PHIEUTRANO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN01', '18-05-2010', '500000', 'HD01');
INSERT INTO PHIEUTRANO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN02', '01-06-2010', '350000', 'HD01');
INSERT INTO PHIEUTRANO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN03', '02-06-2010', '650000', 'HD02');
INSERT INTO PHIEUTRANO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN04', '15-06-2010', '1020000', 'HD03');
INSERT INTO PHIEUTRANO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN05', '01-07-2010', '1080000', 'HD03');


-- 1. Liet ke cac NGK va cac loai NGK tuong ung
select * from NGK inner join LoaiNGK on NGK.MaLoaiNGK = LoaiNGK.MaLoaiNGK;

-- 2. Cho biet thong tin ve nha cung cap o TP.HCM
select * from NHACC  where DiaChiNCC like '%TpHCM%';

-- 3. Liet ke cac hoa don mua hang trong thang 5/2010
select * from HOADON where DATEPART(month, NgayLapHD) = 5 and DATEPART(year, NgayLapHD) = 2010;

-- 4. Cho biet ten nha cung cap co NGK 'Coca Cola)
select * 
from NHACC inner join LoaiNGK 
on NHACC.MaNCC = LoaiNGK.MaNCC
inner join NGK on NGK.MaLoaiNGK = LoaiNGK.MaLoaiNGK
where NGK.TenNGK = 'Coca Cola';

-- 5. Cho biet ten nha cung cap co nhieu loai ngk nhat
select NHACC.TenNCC, count(LoaiNGK.MaLoaiNGK) as SoLoaiNGK
from NHACC inner join LoaiNGK 
on NHACC.MaNCC = LoaiNGK.MaNCC
group by NHACC.TenNCC, LoaiNGK.MaNCC
having count(LoaiNGK.MaLoaiNGK) >= all (select count(MaLoaiNGK)
										from LoaiNGK
										group by MaNCC);

-- 6. Cho biet ten nha cc khong co kha nang cung cap ngk la pepsi
select distinct NHACC.TenNCC
from NHACC inner join LoaiNGK
on NHACC.MaNCC = LoaiNGK.MaNCC
inner join NGK on NGK.MaLoaiNGK = LoaiNGK.MaLoaiNGK
where NHACC.MaNCC not in (select LoaiNGK.MaNCC
						  from LoaiNGK inner join NGK	
						  on LoaiNGK.MaLoaiNGK = NGK.MaLoaiNGK
						  where NGK.TenNGK = 'Pepsi');

-- 7. Hien thi thong tin cua ngk chua ban duoc
select * 
from NGK 
where MaNGK not in (select MaNGK
					from CT_DDH);

-- 8. Hien thi ten va so luong ban cua tung ngk
select NGK.TenNGK, sum(CT_DDH.SLDat) as SL_Dat
from NGK inner join CT_DDH
on NGK.MaNGK = CT_DDH.MaNGK
group by  NGK.TenNGK;

-- 9. Hien thi ten va so luong cua ngk nhap ve
select NGK.TenNGK, count(CT_PGH.SLGiao)
from ngk inner join CT_PGH 
on NGK.MaNGK = CT_PGH.MaNGK
group by NGK.TenNGK;

-- 10. Hien thi don dat hang da dat ngk voi so luong nhieu nhat so voi cac DDH khac co dat ngk do.
-- Thong tin hien thi: SoDDH, MaNGK, SLDatNhieuNhat
--select soddh, mangk, sum(sldat) as SLDatNhieuNhat
--from ct_ddh
--group by soddh, mangk
--having sum(sldat) >= all (select sum(sldat)
--											from ct_ddh
--											group by mangk);

select * 
from CT_DDH
where SLDat in (select max(SLDat) as SLDatNhieuNhat
from CT_DDH
group by MaNGK);

-- 11. Hien thi cac NGK khong duoc nhap trong thang 1 nam 2010
select  NGK.* 
from NGK inner join CT_PGH on NGK.MaNGK = CT_PGH.MaNGK
inner join PHIEUGH on CT_PGH.SoPGH = PHIEUGH.SoPGH
where NGK.MaNGK not in (select CT_PGH.MaNGK 
												from CT_PGH inner join PHIEUGH on CT_PGH.SoPGH = PHIEUGH.SoPGH
												where DATEPART(month, PHIEUGH.NgayGH) = 1 and DATEPART(year, PHIEUGH.NgayGH) = 2010);
					
-- 12. Hien thi ten NGK khong ban duoc trong thang 6 nam 2010
select NGK.* 
from NGK inner join CT_HOADON on NGK.MaNGK = CT_HOADON.MaNGK
inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD
where NGK.MaNGK not in (select CT_HOADON.MaNGK
												from CT_HOADON inner join HOADON 
												on CT_HOADON.SoHD = HOADON.SoHD
												where DATEPART(month, HOADON.NgayLapHD) = 6 and DATEPART(year, HOADON.NgayLapHD) = 2010);

-- 13. Cho biet cua hang ban bao nhieu thu NGK
select count(CT_HOADON.MaNGK)
from NGK inner join CT_HOADON on NGK.MaNGK = CT_HOADON.MaNGK
inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD;

-- 14. Cho biet cua hang ban bao nhieu loai NGK
select count(distinct LoaiNGK.MaLoaiNGK)
from NGK inner join CT_HOADON on NGK.MaNGK = CT_HOADON.MaNGK
inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD
inner join LoaiNGK on NGK.MaLoaiNGK = LoaiNGK.MaLoaiNGK;

-- 15. Hien thi thong tin khach hang co giao dich voi cua hang nhieu nhat
select KH.*, count(HOADON.SoHD) as SoLanGD
from KH inner join HOADON on KH.MaKH = HOADON.MaKH
group by KH.MaKH, KH.TenKH, Kh.DTKH, KH.DCKH
having count(HOADON.SoHD) >= all (select count(SoHD)
									from HOADON
									group by MaKH);


-- 16. Tinh doanh thu nam 2010 cua cua hang
select sum(CT_HOADON.SLKHMua * CT_HOADON.DGBan) as DoanhThu2010
from CT_HOADON inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD
where DATEPART(year, HOADON.NgayLapHD) = 2010;

-- 17. Liet ke 5 loai NGK ban chay nhat doanh thu (05/2010)
select top 5 NGK.MaLoaiNGK
from CT_HOADON inner join NGK on CT_HOADON.MaNGK = NGK.MaNGK
inner join HOADON on HOADON.SoHD = CT_HOADON.SoHD
group by NGK.MaLoaiNGK
having sum(CT_HOADON.SLKHMua * CT_HOADON.DGBan) >= all (
												select sum(CT_HOADON.SLKHMua * CT_HOADON.DGBan)
												from CT_HOADON inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD
												where DATEPART(month, HOADON.NgayLapHD) = 5 and DATEPART(year, HOADON.NgayLapHD) = 2010
												group by CT_HOADON.MaNGK
												)

;
-- 18. Liet ke thong tin ban NGK cua thang 05/2010 maNGK, tenNGK, SLBAN
select NGK.MaNGK, NGK.TenNGK, CT_HOADON.SLKHMua as SoLuongBan
from CT_HOADON inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD
inner join NGK on CT_HOADON.MaNGK = NGK.MaNGK
where DATEPART(month, HOADON.NgayLapHD) = 5 and DATEPART(year, HOADON.NgayLapHD) = 2010;

-- 19. Liet ke thong tin cua NGK co nhieu nguoi mua nhat

select NGK.*, CT_HOADON.SLKHMua
from NGK inner join CT_HOADON on NGK.MaNGK = CT_HOADON.MaNGK
where CT_HOADON.SLKHMua >= all (
								select SLKHMua
								from CT_HOADON
								);

-- 20. Hien thi lan nhap hang gan nhat cua cua hang
select CT_PGH.*
from PHIEUGH inner join CT_PGH on PHIEUGH.SoPGH = CT_PGH.SoPGH
where PHIEUGH.NgayGH = (select max(PHIEUGH.NgayGH)
								from PHIEUGH inner join CT_PGH on PHIEUGH.SoPGH = CT_PGH.SoPGH);

-- 21. Cho biet so lan mua hang cua khach co ma la KH01
select count(MaKH)
from HOADON
where MaKH = 'KH01';

-- 22. Cho biet tong tien cua tung hoa don
select SoHD, sum(SLKHMua * DGBan) as TongTien
from CT_HOADON
group by SoHD;

-- 23. Cho biet danh sach cac hoa don gom SoHD, NgaylapHD, MaKH, TenKH va tong gia tri tung hoa don
-- Danh sach xep tang dan theo ngay va giam dan theo tong gia tri hoa don
select HOADON.SoHD, HOADON.NgayLapHD, KH.MaKH, KH.TenKH, sum(SLKHMua * DGBan) as TongTien
from HOADON inner join KH on HOADON.MaKH = KH.MaKH
inner join CT_HOADON on HOADON.SoHD = CT_HOADON.SoHD
group by HOADON.SoHD, HOADON.NgayLapHD, KH.MaKH, KH.TenKH
order by HOADON.NgayLapHD asc , TongTien desc;

--24. Cho biet cac hoa don co tong gia tri lon hon tong gia tri trung binh cua cac hoa don trong ngay 18/06/2010
select HOADON.SoHD, sum(SLKHMua * DGBan) as TongTien
from HOADON inner join CT_HOADON on HOADON.SoHD = CT_HOADON.SoHD
group by HOADON.SoHD
having sum(SLKHMua * DGBan) >= all (select sum(SLKHMua * DGBan) / count(HOADON.SoHD)
									from HOADON inner join CT_HOADON on HOADON.SoHD = CT_HOADON.SoHD
									where NgayLapHD = '18-06-2010')

-- 25. Cho biet luong NGK tieu thu theo tung thang cua nam 2010
select DATEPART(month, HOADON.NgayLapHD) as Thang, sum(CT_HOADON.SLKHMua) as LuongNGK
from HOADON inner join CT_HOADON on HOADON.SoHD = CT_HOADON.SoHD
where DATEPART(year, HOADON.NgayLapHD) = 2010
group by DATEPART(month, HOADON.NgayLapHD);

-- 26. Dua ra danh sach NGK khong ban duoc trong thang 9 nam 2010
select * 
from NGK
where MaNGK not in (select CT_HOADON.MaNGK
					from CT_HOADON inner join HOADON on HOADON.SoHD = CT_HOADON.SoHD
					where DATEPART(month, HOADON.NgayLapHD) = 9 and DATEPART(month, HOADON.NgayLapHD) = 2010);

-- 27. Dua ra danh KH co dia chi o TPHCM va tung mua NGK trong thang 9 nam 2010
select KH.*
from KH inner join HOADON on KH.MaKH = HOADON.MaKH
where KH.DCKH like '%TpHCM%' and DATEPART(month, HOADON.NgayLapHD) = 9 and DATEPART(year, HOADON.NgayLapHD) = 2010;

-- 28. Dua ra so luong tuong ung cua tung NGK trong thang 10 nam 2010
select CT_HOADON.MaNGK, sum(CT_HOADON.SLKHMua) as SoLuong
from CT_HOADON inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD
where  DATEPART(month, HOADON.NgayLapHD) = 10 and DATEPART(year, HOADON.NgayLapHD) = 2010
group by CT_HOADON.MaNGK;

-- 29. Hien thi thong tin cua khach hang da tung mua va so luong NGK tai cua hang
select KH.*, sum(CT_HOADON.SLKHMua) as SLDaMua
from HOADON inner join KH on HOADON.MaKH = KH.MaKH
inner join CT_HOADON on HOADON.SoHD = CT_HOADON.SoHD
group by KH.MaKH, KH.TenKH, KH.DTKH, KH.DCKH;

-- 30. Cho biet trong nam 2010, KH nao da mua no nhieu nhat
select KH.*, sum(PHIEUTRANO.SoTienTra)
from PHIEUTRANO inner join HOADON on PHIEUTRANO.SoHD = HOADON.SoHD
inner join KH on HOADON.MaKH = KH.MaKH 
where DATEPART(year, HOADON.NgayLapHD) = 2010
group by KH.MaKH, KH.TenKH, KH.DTKH, KH.DCKH
having sum(PHIEUTRANO.SoTienTra) >= all (select sum(PHIEUTRANO.SoTienTra)
										from PHIEUTRANO inner join HOADON on PHIEUTRANO.SoHD = HOADON.SoHD
										inner join KH on HOADON.MaKH = KH.MaKH 
										where DATEPART(year, HOADON.NgayLapHD) = 2010
										group by KH.MaKH, KH.TenKH, KH.DTKH, KH.DCKH);

-- 31. Co bao nhieu hoa don chua thanh toan het so tien
select count(HOADON.SoHD) as SoHoaDonChuaThanhToanHet
from HOADON
where  HOADON.SoHD in (select HOADON.SoHD 
					   from HOADON inner join CT_HOADON on HOADON.SoHD = CT_HOADON.SoHD
					   inner join PHIEUTRANO on HOADON.SoHD = PHIEUTRANO.SoHD
					   group by HOADON.SoHD
					   having sum(CT_HOADON.SLKHMua * CT_HOADON.DGBan) > sum (PHIEUTRANO.SoTienTra)
					   );


-- 32. Liet ke cac hoa don cung ten cua kh tuong ung da mua ngk va thanh toan tien 1 lan (ko co phieu tra no)
select * 
from KH inner join HOADON on KH.MaKH = HOADON.MaKH
where KH.MaKH not in (select HOADON.MaKH
					from PHIEUTRANO inner join HOADON on PHIEUTRANO.SoHD = HOADON.SoHD);

-- 33. Thong ke cho biet thong tin dat hang cua CH trong nam 2010: MaNGK, TenNGK, TongSLDat
select NGK.MaNGK, NGK.TenNGK, sum(CT_PGH.SLGiao) as TongSLDat
from NGK inner join CT_PGH on NGK.MaNGK = CT_PGH.MaNGK
inner join PHIEUGH on CT_PGH.SoPGH = PHIEUGH.SoPGH
where DATEPART(year, PHIEUGH.NgayGH) = 2010
group by NGK.MaNGK, NGK.TenNGK;

-- 34. Liet ke danh sach KH da mua NGK voi tong so tien tuong ung trong nam 2010
select KH.*, sum(CT_HOADON.DGBan * CT_HOADON.SLKHMua) as TongTien 
from KH inner join HOADON on KH.MaKH = HOADON.MaKH
inner join CT_HOADON on HOADON.SoHD = CT_HOADON.SoHD
where DATEPART(year, HOADON.NgayLapHD) = 2010
group by KH.MaKH, KH.TenKH, KH.DCKH, KH.DTKH;


-- VIEWs
-- 1. Tao view V_NGK tong hop du lieu ve tung NGK da duoc ban. Cau  truc View bao gom cac thuoc tinh: MaNGK, TenNGK, Quycach, SoLuongBan, TongTien = DonGiaBan * So luong

create view V_NGK 
as 
select NGK.MaNGK, NGK.TenNGK, sum(CT_HOADON.SLKHMua) as SoLuongBan, sum(CT_HOADON.SLKHMua * CT_HOADON.DGBan) as TongTien
from NGK inner join CT_HOADON on NGK.MaNGK = CT_HOADON.MaNGK
inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD
group by NGK.MaNGK, NGK.TenNGK;

-- 2. Tao view V_khachhang tong hop du lieu ve 10 khach hang lon. Danh sach gom MaKH, TenKH, DTKH, TongTien = Soluong * DGBan

create view V_khachhang 
as 
select KH.MaKH, KH.TenKH, KH.DTKH, sum(CT_HOADON.DGBan * CT_HOADON.SLKHMua) as TongTien
from KH inner join HOADON on KH.MaKH = HOADON.MaKH
inner join CT_HOADON on HOADON.SoHD = CT_HOADON.SoHD
group by KH.MaKH, KH.TenKH, KH.DTKH;

-- 3. Tao view V_trano cho biet danh sach khach hang da thu hon 2 lan nhung chua tra het tien. Danh sach gom: MaKH, TenKH, DTKH, Tong tien phai tra, Tong tien da tra, So lan thu tien
create view v_trano
as
select KH.MaKH, KH.TenKH, KH.DTKH, sum(CT_HOADON.DGBan * CT_HOADON.SLKHMua) as TongTienPhaiTra,  sum (PHIEUTRANO.SoTienTra) as SoTienDaTra, count(PHIEUTRANO.SoPTN) as SoLanThuTien
from HOADON inner join CT_HOADON on HOADON.SoHD = CT_HOADON.SoHD
inner join PHIEUTRANO on HOADON.SoHD = PHIEUTRANO.SoHD
inner join KH on HOADON.MaKH = KH.MaKH
group by KH.MaKH, KH.TenKH, KH.DTKH, HOADON.SoHD
having sum(CT_HOADON.SLKHMua * CT_HOADON.DGBan) > sum (PHIEUTRANO.SoTienTra) and count(PHIEUTRANO.SoPTN) > 2;

select * from v_trano;

-- 4. Tao view V_ton cho biet danh sach nuoc giai khat chua ban duoc

create view v_ton
as
select NGK.* 
from NGK 
where NGK.MaNGK not in  (select MaNGK
					     from CT_HOADON);



-- PROCEDUREs
-- 1. Liet ke tat ca nuoc giai khat va loai ngk tuong ung
use TH02
go
create proc sp_ngk
as 
select * from NGK inner join LoaiNGK on NGK.MaLoaiNGK = LoaiNGK.MaLoaiNGK
go;

exec sp_ngk;

-- 2. Cho biet thong tin ve ncc voi ma ncc la tham so dau vao
use TH02
go 
create proc sp_ncc @NCC VARCHAR(255)
as 
select * from NHACC WHERE NHACC.MaNCC = @NCC
go;

exec sp_ncc 'NC1';

-- 3. Hien thi thong tin nuoc giai khat chua ban duoc
use TH02 
go 
create proc sp_ton 
as 
select * from NGK 
where MaNGK not in (select MaNGK
					from CT_HOADON)
go;

exec sp_ton;

-- 4. Tinh tong doanh thu cua nam voi nam la tham so dau vao va doanh thu la tham so dau  ra
use TH02
go
create proc sp_dt @nam int, @doanhthu int output
as 
select @doanhthu = (select sum(CT_HOADON.SLKHMua * CT_HOADON.DGBan) 
					from CT_HOADON inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD
					where DATEPART(year, HOADON.NgayLapHD) = @nam
				)
go;

declare @dt int = 0;
exec sp_dt @nam = 2010, @doanhthu = @dt output;
print @dt;


-- 5. Giong cau 4

--6. Liet ke N loai NGK ban chay nhat (doanh thu) trong thang voi n va thang la tham so dau vao
use TH02
go 
create proc sp_danhsach @n int, @thang int
as
select top(@n) NGK.MaNGK,sum(CT_HOADON.SLKHMua* CT_HOADON.DGBan)	
from NGK inner join CT_HOADON on NGK.MaNGK=CT_HOADON.MaNGK
inner join HOADON on HOADON.SoHD=CT_HOADON.SoHD
where DATEPART(month,HOADON.NgayLapHD) = @thang
group by  NGK.MaNGK
order by sum(CT_HOADON.SLKHMua* CT_HOADON.DGBan) desc

go;

exec sp_danhsach 5, 6;

-- 7. Nhan vao cac tham so tuong ung voi thong tin cua mot dong trong ct_pgh, neu cac dk sau duoc thoa mang thi them dong moi tuong ung voi cac thong tin da cho vao table ct_pgh
-- so_pgh phai ton tai trong table CT_DDH
-- mangk tuong ung voi soddh phai ton tai trong table CT_DDH
-- slgiao < sldat

use TH02
go
create proc sp_insert_CTPGH @SoPGH varchar(8), @MaNGK varchar(8), @SLGiao integer, @DGGiao numeric
as
if exists (select @SoPGH from PHIEUGH)
and exists (select @MaNGK from DDH inner join CT_DDH on DDH.SODDH = CT_DDH.SODDH
inner join PHIEUGH on DDH.SODDH = PHIEUGH.SODDH where PHIEUGH.SoPGH = @SoPGH) 
and  @SLGiao < (select SLDat from DDH inner join CT_DDH on DDH.SODDH = CT_DDH.SODDH
inner join PHIEUGH on DDH.SODDH = PHIEUGH.SODDH where PHIEUGH.SoPGH = @SoPGH)
begin
	 insert into CT_PGH values (@SoPGH, @MaNGK, @SLGiao, @DGGiao);
end
go;

exec sp_insert_CTPGH 'PGH05', 'OD', 7, 6000;

drop proc sp_insert_CTPGH;

-- test
select * from CT_PGH;
select * from PHIEUGH;
select * from DDH;
select * from CT_DDH;


-- 8. Tao sp_delete_CTPH nhan vao tham so tuong ung voi thong tin trong CTPH, thuc hien yeu cau sau:
-- Xoa dong tuong ung trong CTPH
-- Neu phieu hen ko con dong chi tiet tuong ung thi xoa luon phieu hen do

create proc sp_delete_CTPH @SoPH varchar(8), @MaNGK varchar(8), @SLHen integer
as
if exists (select * from CT_PH where SoPH = @SoPH and MaNGK = @MaNGK and SLHen = @SLHen)
begin 
	delete from CT_PH where SoPH = @SoPH and MaNGK = @MaNGK and SLHen = @SLHen
end
if not exists (select * from CT_PH inner join PHIEUHEN on CT_PH.SoPH = PHIEUHEN.SoPH where CT_PH.SoPH = @SoPH and CT_PH.MaNGK = @MaNGK and CT_PH.SLHen = @SLHen)
begin 
	delete from PHIEUHEN where SoPH = @SoPH;
end
go;

exec sp_delete_CTPH 'PH03', 'CC2', 9;

-- test
select * from CT_PH inner join PHIEUHEN on CT_PH.SoPH = PHIEUHEN.SoPH where CT_PH.SoPH = 'PH04';
select * from PHIEUHEN;
select * from CT_PH;
select * from CT_PH inner join PHIEUHEN on CT_PH.SoPH = PHIEUHEN.SoPH;

-- FUNCTIONs 
-- 1. Tao ham f_list nhan vao hai tham so la Ngay 1 va Ngay 2, cho biet danh sach NGK da duoc ban trong thoi gian tren
-- thong tin gom MaNGK, TenNGK, DVT, SoLuong
create function f_list(@Ngay1 date, @Ngay2 date)
returns table 
as
return (select NGK.MaNGK, NGK.TenNGK, NGK.Quycach as DVT, sum(CT_HOADON.SLKHMua) as SoLuong
from NGK inner join CT_HOADON on CT_HOADON.MaNGK = NGK.MaNGK
inner join HOADON on HOADON.SoHD = CT_HOADON.SoHD
where HOADON.NgayLapHD between @Ngay1 and @Ngay2
group by NGK.MaNGK, NGK.TenNGK, NGK.Quycach)
;


select * from dbo.f_list('01-01-2010', '30-12-2010');

-- 2. Tao ham f_max cho biet ddh da dat NGK voi so luong nhieu nhat so voi cac DDH co dat NGK do
-- thong tin hien thi: SoDDH, MaNGK, SLDatNhieuNhat
create function f_max()
returns table
as 
return (select distinct CT_DDH.SODDH, CT_DDH.MaNGK, CT_DDH.SLDat as SLDatNhieuNhat
		from CT_DDH
		where SLDat in (select max(SLDat)
						from CT_DDH
						group by MaNGK, SODDH));
		
select * from dbo.f_max();

-- 3.Tao f_kh hien thi thong tin kh giao dich voi cua hang nhieu nhat (can cu vao so lan mua hang)
create function f_kh() 
returns table
as 
return (select KH.*, count(HOADON.SoHD) as SoLanMuaHang
		from KH inner join HOADON on KH.MaKH = HOADON.MaKH
		inner join CT_HOADON on CT_HOADON.SoHD = HOADON.SoHD
		group by KH.MaKH, KH.TenKH, KH.DTKH, KH.DCKH
		having count(HOADON.SoHD) >= all (select count(HOADON.SoHD)
										  from HOADON 
										  group by HOADON.MaKH));

select * from dbo.f_kh();

-- 4. Tao f_xlkh nhan vao tham so @MaKH, tinh tong tien Khach da tra (TongTien = sum(SLKHMua * DGBan))
-- Tra ve: 
-- Tong tien > 800.000 => KH VIP
-- Tong tien > 500.000 => KH THANH VIEN
-- Tong tien <= 500.000 => KH THAN THIET

create function f_xlkh(@MaKH varchar(8))
returns varchar(50)
as 
begin 
	declare	@tongTien int = 0;
	set @tongTien = (select sum(CT_HOADON.SLKHMua * CT_HOADON.DGBan)
					from CT_HOADON inner join HOADON on CT_HOADON.SoHD = HOADON.SoHD
					
					where HOADON.MaKH = @MaKH)
	if (@tongTien > 800000)
	begin
		return 'KH VIP'
	end
	if (@tongTien > 500000)
	begin
		return 'KH THANH VIEN'
	end
	return 'KH THAN THIET'
end;

print dbo.f_xlkh('KH04');

-- TRIGGERs
-- 1. Tao trigger ph_insert tren bang PHIEUHEN kiem tra rang buoc toan ven 
-- MaKH phai ton tai trong bang KH
-- Ngay hen giao ko the truoc ngay lap phieu hen

create trigger ph_insert on PHIEUHEN after insert
as
begin
	-- kiem tra dong vua them trong bang inserted co ton tai trong bang KH hay khong
	if not exists (select inserted.MaKH from KH inner join inserted on KH.MaKH = inserted.MaKH)
	begin 
		raiserror('Nguoi dung khong ton tai trong bang KH', 16, 1)
		rollback
		return
	end
	if exists (select inserted.SoPH from inserted where inserted.NgayHenGiao  < inserted.NgayLapPH)
	begin 
		 raiserror('Loi: Ngay Hen Giao < Ngay Lap PH',16, 1)
		rollback
		return
	end
end;

select * from PHIEUHEN;

drop trigger ph_insert;


insert into PHIEUHEN values('PH04', '15-10-2010', '14-10-2010', 'KH03');

-- 2. Tao trigger CTPH_insert tren bang CT_PH kiem tra moi khi them mot dong vao bang CT_PH: "Tong SL hen cho moi MaNGK khong duoc vuot qua 20"

create trigger CTPH_insert on CT_PH after insert
as
begin 

	if exists (select * from inserted where SLHen > 20)
	begin 
		raiserror('So luong NGK lon hon 20!', 16, 1);
		rollback
		return
	end
end;

drop trigger  CTPH_insert;
select * from CT_PH;
insert into CT_PH values('PH03', 'OD', 22);

-- 3. Viet trigger pt_insert tren bang PHIEUTRANO kiem tra khi them mot dong vao bang PHIEUTRANO
-- "Khach hang chi co the tra toi da 3 lan tren 1 hoa don"
create trigger PT_insert on PHIEUTRANO after insert
as
begin 
	declare @countSLTraNo int = 0;
	set @countSLTraNo = (select count(PHIEUTRANO.SoPTN)
						from PHIEUTRANO inner join inserted on PHIEUTRANO.SoHD = inserted.SoHD
						where PHIEUTRANO.SoHD = inserted.SoHD
						group by PHIEUTRANO.SoHD)

	if @countSLTraNo > 3
	begin 
		raiserror('Khach hang chi co the tra toi da 3 lan tren 1 hoa don!', 16, 1);
		rollback
		return
	end
end;

select * from PHIEUTRANO;
drop trigger PT_insert;

insert into PHIEUTRANO values('PTN06', '16-10-2010', 12000, 'HD01');

delete from PHIEUTRANO where SoPTN = 'PTN06'

-- 4. Viet trigger HD_update tren bang HOADON kiem tra rang buoc toan ven sau moi khi cap nhat 1 dong tren bang HOADON
-- Ko duoc cap nhat SoHD
-- MaKH phai ton tai trong bang KH
-- NgayLapHD < Ngay hien tai

create trigger HD_update on HOADON after update
as 
begin
	if not exists (select inserted.SoHD from inserted inner join deleted on inserted.SoHD = deleted.SoHD)
	begin 
		raiserror('So HD da duoc thay doi!', 16, 1);
		rollback 
		return
	end
	if not exists (select inserted.MaKH from inserted inner join KH on inserted.MaKH = KH.MaKH)
	begin 
		raiserror('Ma KH khong ton tai trong bang KH!', 16, 1);
		rollback 
		return
	end
	if exists (select * from inserted where inserted.NgayLapHD > cast(getdate() as date))
	begin 
		raiserror('Ngay Lap HD > Ngay hien tai!', 16, 1);
		rollback 
		return
	end
end;


select * from HOADON;

update HOADON set SoHD = 'HD01', NgayLapHD = '17-10-2023', MaKH = 'KH01' where SoHD = 'HD01';
