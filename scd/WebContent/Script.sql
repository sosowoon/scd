
CREATE database scd;

use scd;

create table opcl(
opcl_no int(30) not null primary key,
catecode varchar(30) not null,
bizcode varchar(30) not null,
byyear int(30) not null,
quart int(30) not null,
op int(30) not null,
cl int(30) not null);

create table Business_change_indicators(
	bciid integer(30) primary key,
	year integer(30),
	quarter integer(30),
	sigungucode integer(30),
	sigungucodename varchar(30),
	ci varchar(30),
	ciname varchar(30)
);

alter table Business_change_indicators add OBMA integer(30);
alter table Business_change_indicators add CBMA integer(30);
alter table Business_change_indicators add SOSMA integer(30);
alter table Business_change_indicators add SCSMA integer(30);

desc Business_change_indicators;
delete from Business_change_indicators;

drop table Business_change_indicators;

select * from Business_change_indicators;


select * from Business_change_indicators where year=2019 and quarter=1 and sigungucodename='������';
select * from Business_change_indicators where year=2019 and quarter=1;

select count(year) from business_change_indicators where year = 2019;

select year, quarter, SOSMA, SCSMA from Business_change_indicators group by year, quarter;

select year, quarter, ci, sosma from business_change_indicators group by year, quarter, ci;


INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS100001','�ѽ�������')
,('CS100002','�߽�������')
,('CS100003','�Ͻ�������')
,('CS100004','���������')
,('CS100005','�н�������')
,('CS100006','�н�ƮǪ����')
,('CS100007','ġŲ������')
,('CS100008','������')
,('CS100009','Ŀ�ǡ�����')
,('CS100010','ȣ������������')
;
INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS200001','�Ϲݱ����п�')
,('CS200002','�ܱ����п�')
,('CS200003','��ü���п�')
,('CS200004','ġ���ǿ�')
,('CS200005','���ǿ�')
,('CS200006','�Ϲ��ǿ�')
,('CS200007','������ǰ����')
,('CS200008','�ε����߰���')
,('CS200009','���ھ�')
,('CS200010','�뷡��')
;

INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS200011','PC��')
,('CS200012','�籸��')
,('CS200013','��Ź��(����)')
,('CS200014','������Ŭ��')
,('CS200015','�ڵ�������������')
,('CS200016','�ι߹̿��')
,('CS200017','���ϼ�')
,('CS200018','�Ǻΰ�����')
,('CS300001','���۸���')
,('CS300002','������')
;
INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS300003','��ǻ�͡��ֺ����')
,('CS300004','�ڵ���')
,('CS300005','�ķ�ǰ')
,('CS300006','�ǰ�������ǰ')
,('CS300007','�Ƿ���')
,('CS300008','�мǿ�ǰ')
,('CS300009','�Ǿࡤ�Ƿ��ǰ')
,('CS300010','����������')
,('CS300011','ȭ��ǰ')
,('CS300012','�������')
;
INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS300013','������ǰ')
,('CS300014','ȭ�ʡ��ֿ�')
,('CS300015','����������')
,('CS300016','�ֹ桤������ǰ')
,('CS300017','����Ǹž�')
;



select `commercialDistrictCode`,`commercialDistrictName`,latitude,longitude from commercialdistricts;
select `SellCategoryCode`,`SellCategoryName` from sellcategories;
select opcl_no, `SellCatrgoryCode`, `commercialDistrictCode`, year, quarter, op, cl  from opcl; 

SELECT * FROM product, stock WHERE product.product_no = stock.product_no;
SELECT * FROM commercialdistricts, sellcategories, opcl 
	WHERE commercialdistricts.commercialDistrictCode = opcl.commercialDistrictCode 
	and sellcategories.SellCategoryCode = opcl.SellCategoryCode;

select c.CommercialDistrictName, s.Year, s.Quarter, d.SellCategoryName, s.SellAmount 
	from sellamounts s 
		LEFT OUTER JOIN commercialdistricts c on s.CommercialDistrictCode = c.CommercialDistrictCode 
		left join sellcategories d on s.SellCategoryCode = d.SellCategoryCode 
	where Year = 2017 and Quarter = 1 and SellCategoryName = '�ѽ�������' 
	order by 'SellAmount' desc limit 10
	
select c.commercialDistrictCode, c.commercialDistrictName, o.Year, o.Quarter, d.sellCategoryName, o.op, o.cl, c.latitude, c.longitude
	from opcl o 
		LEFT OUTER JOIN commercialdistricts c on o.commercialDistrictCode = c.commercialDistrictCode 
		left join sellcategories d on o.SellCatrgoryCode = d.SellCategoryCode
	where o.year = 2017 and o.quarter = 1 and d.SellCategoryName = '�ѽ�������'
	order by o.op desc limit 5;

select c.commercialDistrictCode, c.commercialDistrictName, o.Year, o.Quarter, d.sellCategoryName, o.op, o.cl, c.latitude, c.longitude
	from opcl o 
		LEFT OUTER JOIN commercialdistricts c on o.commercialDistrictCode = c.commercialDistrictCode 
		left join sellcategories d on o.SellCatrgoryCode = d.SellCategoryCode
	where o.year = 2017 and o.quarter = 1 and d.SellCategoryName = '�ѽ�������'
	order by o.cl desc limit 5;



