-- 创建用户表 --  
CREATE TABLE USER (
 id VARCHAR(32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime timestamp,
 updateTime timestamp,
 userName VARCHAR(100),
 password VARCHAR(100),
	userRole VARCHAR(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE USER ADD PRIMARY KEY (id);

-- 创建任务书信息表 -- 
CREATE TABLE taskbook (
 id VARCHAR(32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime timestamp,
 updateTime timestamp,
 serialNumber INT,
 courseCode VARCHAR(100),
courseName VARCHAR(100),
teachingNumber VARCHAR(100),
major VARCHAR(100),
schoolZone VARCHAR(100),
classAndStudent VARCHAR(100),
grade VARCHAR(100),
totalStudent INT,
testType VARCHAR(100),
weekTime VARCHAR(100),
totalTime VARCHAR(100),
startAndEndWeek VARCHAR(100),
classHour INT,
teacherSign VARCHAR(100),
title VARCHAR(100),
courseProperty VARCHAR(100),
mergeClassOpinion VARCHAR(100),
classRoomType VARCHAR(100),
term VARCHAR(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE taskbook ADD PRIMARY KEY (id);

-- 创建学校表 -- 
CREATE TABLE school( id VARCHAR(32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime timestamp,
 updateTime timestamp,
 schoolName VARCHAR(100),
schoolDes VARCHAR(255)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE school ADD PRIMARY KEY (id);

-- 创建学院表 -- 
CREATE TABLE college(
 id VARCHAR(32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime timestamp,
 updateTime timestamp,
 collegeName VARCHAR(100),
collegeDes VARCHAR(255),
schoolId VARCHAR(32)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE college ADD PRIMARY KEY (id);

DROP TABLE teacher;
-- 创建教师表 -- 
CREATE TABLE teacher (
 id VARCHAR(32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime timestamp,
 updateTime timestamp,
 teacherName VARCHAR(100),
 sex VARCHAR(100),
	bornDate TIMESTAMP,
classId VARCHAR(32),
collegeId VARCHAR(32),
schoolId VARCHAR(32)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE teacher ADD PRIMARY KEY (id);

-- 创建班级信息表 -- 
CREATE TABLE class (
 id VARCHAR(32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime timestamp,
 updateTime timestamp,
 className VARCHAR(100),
 classDes VARCHAR(255),
collegeId VARCHAR(32),
schooolId VARCHAR(32)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE class ADD PRIMARY KEY (id);


CREATE TABLE teacher_taskbook(
 id VARCHAR(32) NOT NULL,
 isDelete INT DEFAULT 1,
 createTime timestamp,
 updateTime timestamp,
 teacherId VARCHAR(32),
 taskbookId VARCHAR(32)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE teacher_taskbook ADD PRIMARY KEY (id);

