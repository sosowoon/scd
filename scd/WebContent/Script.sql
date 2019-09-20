
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


select * from Business_change_indicators where year=2019 and quarter=1 and sigungucodename='°­µ¿±¸';
select * from Business_change_indicators where year=2019 and quarter=1;

select year, quarter, SOSMA, SCSMA from Business_change_indicators group by year, quarter;












