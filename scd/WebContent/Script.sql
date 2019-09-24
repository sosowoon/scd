
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


select * from Business_change_indicators where year=2019 and quarter=1 and sigungucodename='강동구';
select * from Business_change_indicators where year=2019 and quarter=1;

select count(year) from business_change_indicators where year = 2019;

select year, quarter, SOSMA, SCSMA from Business_change_indicators group by year, quarter;

select year, quarter, ci, sosma from business_change_indicators group by year, quarter, ci;


INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS100001','한식음식점')
,('CS100002','중식음식점')
,('CS100003','일식음식점')
,('CS100004','양식음식점')
,('CS100005','분식전문점')
,('CS100006','패스트푸드점')
,('CS100007','치킨전문점')
,('CS100008','제과점')
,('CS100009','커피·음료')
,('CS100010','호프·간이주점')
;
INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS200001','일반교습학원')
,('CS200002','외국어학원')
,('CS200003','예체능학원')
,('CS200004','치과의원')
,('CS200005','한의원')
,('CS200006','일반의원')
,('CS200007','가전제품수리')
,('CS200008','부동산중개업')
,('CS200009','숙박업')
,('CS200010','노래방')
;

INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS200011','PC방')
,('CS200012','당구장')
,('CS200013','세탁소(가정)')
,('CS200014','스포츠클럽')
,('CS200015','자동차수리·세차')
,('CS200016','두발미용업')
,('CS200017','네일숍')
,('CS200018','피부관리실')
,('CS300001','슈퍼마켓')
,('CS300002','편의점')
;
INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS300003','컴퓨터·주변기기')
,('CS300004','핸드폰')
,('CS300005','식료품')
,('CS300006','건강보조식품')
,('CS300007','의류점')
,('CS300008','패션용품')
,('CS300009','의약·의료용품')
,('CS300010','서적·문구')
,('CS300011','화장품')
,('CS300012','오락·운동')
;
INSERT INTO scd.sellcategories (`SellCategoryCode`,`SellCategoryName`) VALUES 
('CS300013','섬유제품')
,('CS300014','화초·애완')
,('CS300015','가구·가전')
,('CS300016','주방·가정용품')
,('CS300017','통신판매업')
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
	where Year = 2017 and Quarter = 1 and SellCategoryName = '한식음식점' 
	order by 'SellAmount' desc limit 10
	
select c.commercialDistrictCode, c.commercialDistrictName, o.Year, o.Quarter, d.sellCategoryName, o.op, o.cl, c.latitude, c.longitude
	from opcl o 
		LEFT OUTER JOIN commercialdistricts c on o.commercialDistrictCode = c.commercialDistrictCode 
		left join sellcategories d on o.SellCatrgoryCode = d.SellCategoryCode
	where o.year = 2017 and o.quarter = 1 and d.SellCategoryName = '한식음식점'
	order by o.op desc limit 5;

select c.commercialDistrictCode, c.commercialDistrictName, o.Year, o.Quarter, d.sellCategoryName, o.op, o.cl, c.latitude, c.longitude
	from opcl o 
		LEFT OUTER JOIN commercialdistricts c on o.commercialDistrictCode = c.commercialDistrictCode 
		left join sellcategories d on o.SellCatrgoryCode = d.SellCategoryCode
	where o.year = 2017 and o.quarter = 1 and d.SellCategoryName = '한식음식점'
	order by o.cl desc limit 5;



