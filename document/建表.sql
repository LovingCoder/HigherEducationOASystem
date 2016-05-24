-- 创建用户表 --  
CREATE TABLE USER (
 id VARCHAR (32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 userName VARCHAR (100),
 PASSWORD VARCHAR (100),
 userRole VARCHAR (100)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE USER ADD PRIMARY KEY (id);

ALTER TABLE USER MODIFY userRole INT (11);
ALTER TABLE USER ADD email VARCHAR(255);

-- 创建任务书信息表 -- 
CREATE TABLE taskbook (
 id VARCHAR (32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 serialNumber INT,
 courseCode VARCHAR (100),
 courseName VARCHAR (100),
 teachingNumber VARCHAR (100),
 major VARCHAR (100),
 schoolZone VARCHAR (100),
 classAndStudent VARCHAR (100),
 grade VARCHAR (100),
 totalStudent INT,
 testType VARCHAR (100),
 weekTime VARCHAR (100),
 totalTime VARCHAR (100),
 startAndEndWeek VARCHAR (100),
 classHour INT,
 teacherSign VARCHAR (100),
 title VARCHAR (100),
 courseProperty VARCHAR (100),
 mergeClassOpinion VARCHAR (100),
 classRoomType VARCHAR (100),
 term VARCHAR (100)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE taskbook ADD PRIMARY KEY (id);

ALTER TABLE taskbook ADD teacherId VARCHAR (32);

-- 创建学校表 -- 
CREATE TABLE school (
 id VARCHAR (32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 schoolName VARCHAR (100),
 schoolDes VARCHAR (255)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE school ADD PRIMARY KEY (id);

-- 创建学院表 -- 
CREATE TABLE college (
 id VARCHAR (32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 collegeName VARCHAR (100),
 collegeDes VARCHAR (255),
 schoolId VARCHAR (32)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE college ADD PRIMARY KEY (id);

-- 创建教师表 --
CREATE TABLE teacher (
 id VARCHAR (32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 teacherName VARCHAR (100),
 sex INT (11),
 bornDate TIMESTAMP,
 majorId VARCHAR (32),
 collegeId VARCHAR (32),
 schoolId VARCHAR (32),
 userId VARCHAR(32),
 email VARCHAR (255)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE teacher ADD PRIMARY KEY (id);



-- 创建专业信息表 --
CREATE TABLE major (
 id VARCHAR (32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 majorName VARCHAR (100),
 majorDes VARCHAR (255),
 collegeId VARCHAR (32),
 schooolId VARCHAR (32)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE major ADD PRIMARY KEY (id);

CREATE TABLE teacher_taskbook (
 id VARCHAR (32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 teacherId VARCHAR (32),
 taskbookId VARCHAR (32)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE teacher_taskbook ADD PRIMARY KEY (id);

CREATE TABLE dictionary (
 id VARCHAR (32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 field VARCHAR (100),

 VALUE
 INT (11),
 mean VARCHAR (100)
);

ALTER TABLE dictionary ADD PRIMARY KEY (id);

INSERT INTO dictionary (
 id,
 isDelete,
 createTime,
 updateTime,
 field,

 VALUE
 ,
 mean
)
VALUES
 (
  REPLACE (UUID(), '-', ''),
  0,
  NOW(),
  NOW(),
  'userRole',
  0,
  '教务主任'
 );

INSERT INTO dictionary (
 id,
 isDelete,
 createTime,
 updateTime,
 field,

 VALUE
 ,
 mean
)
VALUES
 (
  REPLACE (UUID(), '-', ''),
  0,
  NOW(),
  NOW(),
  'userRole',
  1,
  '任课教师'
 );

-- 日常办公事物 -- 
CREATE TABLE daily_work (
 id VARCHAR (32) NOT NULL,
 isDelete INT (11),
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 commanderId VARCHAR (32),
 executorId VARCHAR (32),
 workType INT (11),
 beginTime TIMESTAMP,
 endTime TIMESTAMP,
 title VARCHAR (100),
 desText LONGTEXT
);

ALTER TABLE daily_work ADD PRIMARY KEY (id);



INSERT INTO dictionary (
 id,
 isDelete,
 createTime,
 updateTime,
 field,

 VALUE
 ,
 mean
)
VALUES
 (
  REPLACE (UUID(), '-', ''),
  0,
  NOW(),
  NOW(),
  'workType',
  1,
  '打扫卫生'
 );

INSERT INTO dictionary (
 id,
 isDelete,
 createTime,
 updateTime,
 field,

 VALUE
 ,
 mean
)
VALUES
 (
  REPLACE (UUID(), '-', ''),
  0,
  NOW(),
  NOW(),
  'workType',
  2,
  '公派值日'
 );

INSERT INTO dictionary (
 id,
 isDelete,
 createTime,
 updateTime,
 field,

 VALUE
 ,
 mean
)
VALUES
 (
  REPLACE (UUID(), '-', ''),
  0,
  NOW(),
  NOW(),
  'workType',
  3,
  '日常事务安排'
 );

-- 初始化用户表 -- 
INSERT INTO USER
(id,isDelete,createTime,updateTime,userName,password,userRole,email)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'Admin','123456',0,'13007513690@163.com');

INSERT INTO USER
(id,isDelete,createTime,updateTime,userName,password,userRole,email)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'Coder','123456',1,'CoderKK@163.com');

-- 初始化学校表 -- 
INSERT INTO school
(id,isDelete,createTime,updateTime,schoolName,schoolDes)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'河南工业大学','河工大');

INSERT INTO school
(id,isDelete,createTime,updateTime,schoolName,schoolDes)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'郑州大学','郑大');

INSERT INTO school
(id,isDelete,createTime,updateTime,schoolName,schoolDes)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'解放军信息工程大学','信大');

INSERT INTO school
(id,isDelete,createTime,updateTime,schoolName,schoolDes)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'河南大学','河大');

-- 初始化学院信息表 --
-- 工大 -- 
INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'信息科学与工程学院','信息学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'粮油食品学院','粮院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'机电工程学院','机电学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'土木建筑学院','土建学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'化学化工学院','化工学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'生物工程学院','生物学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'材料科学与工程学院','材料学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'电气工程学院','电气学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'管理学院','管院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'经济贸易学院','经贸学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'理学院','理学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'外语学院','外语学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'法学院','法学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'新闻与传播学院','新传学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'设计艺术学院','设艺学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'国际教育学院','国际学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'中英国际学院','中英国际学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'职业技术学院','职业学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'体育学院','体院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'马克思主义学院','马克思主义学院','0d041de6208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'继续教育学院','继续教育学院','0d041de6208c11e693a80862663018eb');

-- 郑大 -- 
INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'数学与统计学院','数学与统计学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'化学与分子工程学院','化学与分子工程学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'物理工程学院','物理工程学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'信息工程学院','信息工程学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'电气工程学院','电气工程学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'材料科学与工程学院','材料科学与工程学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'机械工程学院','机械工程学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'土木工程学院','土木工程学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'水利与环境学院','水利与环境学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'化工与能源学院','化工与能源学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'建筑学院','建筑学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'管理工程学院','管理工程学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'力学与工程科学学院','力学与工程科学学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'生命科学学院','生命科学学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'商学院','商学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'公共管理学院','公共管理学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'法学院','法学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'文学院','文学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'新闻与传播学院','新闻与传播学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'外语学院','外语学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'马克思主义学院','马克思主义学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'教育系','教育系','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'历史学院','历史学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'信息管理学院','信息管理学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'体育学院（校本部）','体育学院（校本部）','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'音乐学院','音乐学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'美术学院','美术学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'基础医学院','基础医学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'临床医学系','临床医学系','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'医学检验系','医学检验系','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'公共卫生学院','公共卫生学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'护理学院','护理学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'药学院','药学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'第一临床学院','第一临床学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'第二临床学院','第二临床学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'第三临床学院','第三临床学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'第五临床学院','第五临床学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'口腔医学院','口腔医学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'软件与应用科技学院','软件与应用科技学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'远程教育学院','远程教育学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'继续教育学院','继续教育学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'国际教育学院','国际教育学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'国际学院','国际学院','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'体育学院（中外合作）','体育学院（中外合作）','0d0ee1fc208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'西亚斯国际学院（中外合作）','西亚斯国际学院（中外合作）','0d0ee1fc208c11e693a80862663018eb');

-- 河南大学 -- 
INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'马克思主义学院','马克思主义学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'哲学与公共管理学院','哲学与公共管理学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'经济学院','经济学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'法学院','法学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'教育科学学院','教育科学学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'体育学院','体育学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'文学院','文学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'外语学院','外语学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'新闻与传播学院','新闻与传播学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'历史文化学院','历史文化学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'数学与信息科学学院','数学与信息科学学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'物理与电子学院','物理与电子学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'化学化工学院','化学化工学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'生命科学学院','生命科学学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'计算机与信息工程学院','计算机与信息工程学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'土木建筑学院','土木建筑学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'医学院','医学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'东京临床学院','东京临床学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'淮河临床学院','淮河临床学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'护理学院','护理学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'药学院','药学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'工商管理学院','工商管理学院','0d249b10208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'艺术学院','艺术学院','0d249b10208c11e693a80862663018eb');

-- 信息工程大学 -- 
INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'信息系统工程学院','信息系统工程学院','0d16a64c208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'地理空间信息学院','地理空间信息学院','0d16a64c208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'密码工程学院','密码工程学院','0d16a64c208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'网络空间安全学院','网络空间安全学院','0d16a64c208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'导航与空天目标工程学院','导航与空天目标工程学院','0d16a64c208c11e693a80862663018eb');

INSERT INTO college
(id,isDelete,createTime,updateTime,collegeName,collegeDes,schoolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'指挥军官基础教育学院','指挥军官基础教育学院','0d16a64c208c11e693a80862663018eb');

-- 专业信息 -- 
-- 河工大信息学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'计算机科学与技术',NULL,'0376588d208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'电子信息工程',NULL,'0376588d208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'电子信息科学与技术',NULL,'0376588d208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'物联网工程',NULL,'0376588d208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'计算机类','软件工程、空间信息与数字技术','0376588d208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大粮院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'食品科学与工程',NULL,'037ea6de208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'粮食工程',NULL,'037ea6de208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'食品质量与安全',NULL,'037ea6de208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'食品营养与检验教育',NULL,'037ea6de208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大经贸学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'国际经济与贸易',NULL,'03aca413208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'经济学',NULL,'03aca413208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'财政学',NULL,'03aca413208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'金融学',NULL,'03aca413208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大生物学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'生物工程',NULL,'039861cf208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'生物技术',NULL,'039861cf208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'制药工程',NULL,'039861cf208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'动物科学',NULL,'039861cf208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大管理学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'电子商务',NULL,'03a6635f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'工商管理',NULL,'03a6635f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'	物流管理',NULL,'03a6635f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'旅游管理',NULL,'03a6635f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'财务管理 ',NULL,'03a6635f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大化工学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'化学工程与工艺 ',NULL,'03945379208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'应用化学 ',NULL,'03945379208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'环境工程 ',NULL,'03945379208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'化学 ',NULL,'03945379208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大新闻学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'新闻与传播学类','广播电视学、广告学','03c1a4e3208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'网络与新媒体',NULL,'03c1a4e3208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'播音与主持艺术',NULL,'03c1a4e3208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大机电学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'机械设计制造及其自动化',NULL,'03868c07208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'过程装备与控制工程',NULL,'03868c07208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'机械类','材料成型及控制工程、车辆工程','03868c07208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'包装工程','包装工艺装备方向','03868c07208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大设计学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'设计学类','视觉传达设计、环境设计、产品设计、数字媒体艺术','03c59270208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'动画',NULL,'03c59270208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大外语学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'英语',NULL,'03b727aa208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'日语',NULL,'03b727aa208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大法学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'法学',NULL,'03bca1d2208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大电气工程学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'自动化',NULL,'03a276b5208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'电气工程及其自动化',NULL,'03a276b5208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'测控技术与仪器',NULL,'03a276b5208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'轨道交通信号与控制',NULL,'03a276b5208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大国际教育学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'市场营销',NULL,'03c9fad0208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'人力资源管理',NULL,'03c9fad0208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'会计学',NULL,'03c9fad0208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'生物技术',NULL,'03c9fad0208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'食品科学与工程',NULL,'03c9fad0208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大材料科学学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'材料科学与工程',NULL,'039d8839208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'高分子材料与工程',NULL,'039d8839208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'无机非金属材料工程',NULL,'039d8839208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大理学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'数学类','数学与应用数学、信息与计算科学','03b070dd208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'应用物理学',NULL,'03b070dd208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大土建学院 --
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'土木工程',NULL,'038e2d1f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'工程管理',NULL,'038e2d1f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'建筑学',NULL,'038e2d1f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'土木类','建筑环境与能源应用工程、道路桥梁与渡河工程','038e2d1f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'工程力学',NULL,'038e2d1f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'交通工程',NULL,'038e2d1f208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大职业学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'磨料磨具制造','3年制专科','03d2c5f4208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'材料工程技术','3年制专科','03d2c5f4208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

-- 工大中英国际学院 -- 
INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'机械制造与自动化','3年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'金融与证券','3年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'会计','3年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'艺术设计','3年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'主持与播音','3年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'工程造价','3年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'机电一体化技术','3年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'汽车技术服务与营销','3年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'食品营养与检测','3年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'软件技术','2年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'网络系统管理','2年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'计算机信息管理','2年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO major
(id,isDelete,createTime,updateTime,majorName,majorDes,collegeId,schooolId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'图像制作','2年制专科','03cdffa9208e11e693a80862663018eb','0d041de6208c11e693a80862663018eb');

INSERT INTO teacher
(id,isDelete,createTime,updateTime,email,userId)
VALUES
 (REPLACE(UUID(),'-',''),0,NOW(),NOW(),'13007513690@163.com','73b79890208c11e693a80862663018eb');