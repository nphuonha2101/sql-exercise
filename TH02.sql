


CREATE TABLE NHACC(
	MaNCC varchar(8) ,
	TenNCC varchar(40) ,
	DiaChiNCC varchar(40) ,
	DTNCC varchar(10) ,
	PRIMARY KEY (MaNCC)
);


CREATE TABLE NGK(
	MaNGK varchar(8) ,
	TenNGK varchar(40) ,
	Quycach varchar(8) ,
	MaLoaiNGK varchar(8) ,
	PRIMARY KEY (MaNGK),
	FOREIGN KEY (MaLoaiNGK) REFERENCES LoaiNGK (MaLoaiNGK)
);

CREATE TABLE LoaiNGK(
	MaLoaiNGK varchar(8) ,
	TenLoaiNGK varchar(40) ,
	MaNCC varchar(8) ,
	PRIMARY KEY (MaLoaiNGK),
	FOREIGN KEY (MaNCC) REFERENCES NHACC (MaNCC)
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
CREATE TABLE PHIEUTRANNO(
	SoPTN varchar(8) ,
	NgayTra date ,
	SoTienTra numeric,
	SoHD varchar(8) ,
	PRIMARY KEY (SoPTN),
	FOREIGN KEY (SoHD) REFERENCES HOADON (SoHD)
);



SET DATEFORMAT dmy;  

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


-- NHACC
INSERT INTO NHACC(MaNCC,TenNCC,DiaChiNCC,DTNCC)
VALUES('NC1','Công ty NGK quốc tế Coca Cola','Xa lộ HN, Thủ Đức, TpHCM','088967908');
INSERT INTO NHACC(MaNCC,TenNCC,DiaChiNCC,DTNCC)
VALUES('NC2','Công ty NGK quốc tế Pepsi','Bến Chương Dương, Q.1, TpHCM','083663366');
INSERT INTO NHACC(MaNCC,TenNCC,DiaChiNCC,DTNCC) 
VALUES('NC3','Công ty NGK Bến Chương Dương','Hàm Tử, Q.5, TpHCM','089456677');

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
INSERT INTO PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN01', '18-05-2010', '500000', 'HD01');
INSERT INTO PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN02', '01-06-2010', '350000', 'HD01');
INSERT INTO PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN03', '02-06-2010', '650000', 'HD02');
INSERT INTO PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN04', '15-06-2010', '1020000', 'HD03');
INSERT INTO PHIEUTRANNO(SoPTN, NgayTra, SoTienTra, SoHD)
VALUES ('PTN05', '01-07-2010', '1080000', 'HD03');


-- 1. Liet ke cac NGK va cac loai NGK tuong ung
select * from ngk inner join loaingk on ngk.maloaingk = loaingk.maloaingk;

-- 2. Cho biet thong tin ve nha cung cap o TP.HCM
select * from nhacc  where diachincc like '%TpHCM%';

-- 3. Liet ke cac hoa don mua hang trong thang 5/2010
select * from hoadon where DATEPART(month, ngaylaphd) = 5 and DATEPART(year, ngaylaphoadon) = 2010;

-- 4. Cho biet ten nha cung cap co NGK 'Coca Cola)
select * 
from nhacc inner join loaingk 
on nhacc.mancc = loaingk.mancc
inner join ngk on ngk.maloaingk = loaingk.maloaingk
where ngk.tenngk = 'Coca Cola';

-- 5. Cho biet ten nha cung cap co nhieu loai ngk nhat
select nhacc.tenncc, count(loaingk.maloaingk)
from nhacc inner join loaingk 
on nhacc.mancc = loaingk.mancc
group by nhacc.tenncc, loaingk.mancc
having count(loaingk.maloaingk) >= all (select count(maloaingk)
																		from loaingk
																		group by mancc);

-- 6. Cho biet ten nha cc khong co kha nang cung cap ngk la pepsi
select distinct nhacc.tenncc
from nhacc inner join loaingk
on nhacc.mancc = loaingk.mancc
inner join ngk on ngk.maloaingk = loaingk.maloaingk
where nhacc.mancc not in (select loaingk.MaNCC
												from loaingk inner join ngk	
												on loaingk.maloaingk = ngk.maloaingk
												where ngk.tenngk = 'Pepsi');

-- 7. Hien thi thong tin cua ngk chua ban duoc
select * 
from ngk 
where mangk not in (select mangk
									from ct_ddh);

-- 8. Hien thi ten va so luong ban cua tung ngk
select ngk.tenngk, sum(ct_ddh.sldat) as sl_dat
from ngk inner join ct_ddh
on ngk.mangk = ct_ddh.mangk
group by  ngk.tenngk;

-- 9. Hien thi ten va so luong cua ngk nhap ve
select ngk.tenngk, count(ct_pgh.slgiao)
from ngk inner join ct_pgh 
on ngk.mangk = ct_pgh.mangk
group by ngk.tenngk;

-- 10. Hien thi don dat hang da dat ngk voi so luong nhieu nhat so voi cac DDH khac co dat ngk do.
-- Thong tin hien thi: SoDDH, MaNGK, SLDatNhieuNhat
select soddh, mangk, sum(sldat) as SLDatNhieuNhat
from ct_ddh
group by soddh, mangk
having sum(sldat) >= all (select sum(sldat)
											from ct_ddh
											group by mangk);

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


