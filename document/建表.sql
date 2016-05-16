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
 sex VARCHAR (100),
 bornDate TIMESTAMP,
 classId VARCHAR (32),
 collegeId VARCHAR (32),
 schoolId VARCHAR (32)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE teacher ADD PRIMARY KEY (id);

ALTER TABLE teacher ADD email VARCHAR (255);

ALTER TABLE teacher ADD userId VARCHAR (32);

ALTER TABLE teacher MODIFY sex INT (11);

-- 创建班级信息表 --
CREATE TABLE class (
 id VARCHAR (32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime TIMESTAMP,
 updateTime TIMESTAMP,
 className VARCHAR (100),
 classDes VARCHAR (255),
 collegeId VARCHAR (32),
 schooolId VARCHAR (32)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE class ADD PRIMARY KEY (id);

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

