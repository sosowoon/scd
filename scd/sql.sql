CREATE TABLE `business_change_indicators` (
  `bciid` int(30) NOT NULL,
  `year` int(30) DEFAULT NULL,
  `quarter` int(30) DEFAULT NULL,
  `sigungucode` int(30) DEFAULT NULL,
  `sigungucodename` varchar(30) DEFAULT NULL,
  `ci` varchar(30) DEFAULT NULL,
  `ciname` varchar(30) DEFAULT NULL,
  `OBMA` int(30) DEFAULT NULL,
  `CBMA` int(30) DEFAULT NULL,
  `SOSMA` int(30) DEFAULT NULL,
  `SCSMA` int(30) DEFAULT NULL,
  PRIMARY KEY (`bciid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `members` (
  `m_id` varchar(30) NOT NULL,
  `pw` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `age` int(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `opcl` (
  `opcl_no` int(30) NOT NULL,
  `SellCatrgoryCode` varchar(30) NOT NULL,
  `commercialDistrictCode` varchar(30) NOT NULL,
  `year` int(30) NOT NULL,
  `quarter` int(30) NOT NULL,
  `op` int(30) NOT NULL,
  `cl` int(30) NOT NULL,
  PRIMARY KEY (`opcl_no`),
  KEY `opcl_fk3` (`commercialDistrictCode`),
  CONSTRAINT `opcl_fk` FOREIGN KEY (`commercialDistrictCode`) REFERENCES `commercialdistricts` (`commercialDistrictCode`),
  CONSTRAINT `opcl_fk2` FOREIGN KEY (`SellCatrgoryCode`) REFERENCES `sellcategories` (`SellCatrgoryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

drop table opcl;

create table opcl(
  opcl_no int(30) NOT null primary key,
  sellCategoryCode varchar(30) NOT NULL,
  commercialDistrictCode varchar(30) NOT NULL,
  year int(30) NOT NULL,
  quarter int(30) NOT NULL,
  op int(30) NOT NULL,
  cl int(30) NOT NULL,
  FOREIGN KEY (sellCategoryCode) REFERENCES sellcategories (sellCategoryCode),
  FOREIGN KEY (commercialDistrictCode) REFERENCES commercialdistricts (commercialDistrictCode)
);

CREATE TABLE `sellcategories` (
  `sellCategoryCode` varchar(30),
  `sellCategoryName` varchar(50),
  PRIMARY KEY (`SellCategoryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

drop table sellcategories;

