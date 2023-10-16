-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-10-09 16:01:51
-- 服务器版本： 8.0.17
-- PHP 版本： 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `ruan`
--

-- --------------------------------------------------------

--
-- 表的结构 `checkin`
--

CREATE TABLE `checkin` (
  `checknumber` char(10) NOT NULL,
  `coursenumber` char(10) NOT NULL,
  `studentnumber` char(20) NOT NULL,
  `checktime` char(10) NOT NULL,
  `checkstatus` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `course`
--

CREATE TABLE `course` (
  `coursenumber` char(10) NOT NULL,
  `teachernumber` char(20) NOT NULL,
  `coursename` char(10) NOT NULL,
  `ClassSchedule` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `courseselect`
--

CREATE TABLE `courseselect` (
  `coursenumber` char(10) NOT NULL,
  `studentnumber` char(20) NOT NULL,
  `EnrollmentDate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `studentnumber` char(20) NOT NULL,
  `name` char(10) NOT NULL,
  `speciallized` char(10) NOT NULL,
  `gender` char(2) NOT NULL,
  `ContactInformation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE `teacher` (
  `teachernumber` char(20) NOT NULL,
  `name` char(10) NOT NULL,
  `gender` char(2) NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `password` char(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转储表的索引
--

--
-- 表的索引 `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`checknumber`),
  ADD UNIQUE KEY `签到记录_PK` (`checknumber`),
  ADD KEY `Relationship_5_FK` (`coursenumber`,`studentnumber`);

--
-- 表的索引 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`coursenumber`),
  ADD UNIQUE KEY `课程_PK` (`coursenumber`),
  ADD KEY `Relationship_4_FK` (`teachernumber`);

--
-- 表的索引 `courseselect`
--
ALTER TABLE `courseselect`
  ADD PRIMARY KEY (`coursenumber`,`studentnumber`),
  ADD UNIQUE KEY `选课_PK` (`coursenumber`,`studentnumber`),
  ADD KEY `Relationship_2_FK` (`studentnumber`),
  ADD KEY `Relationship_3_FK` (`coursenumber`);

--
-- 表的索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentnumber`),
  ADD UNIQUE KEY `学生_PK` (`studentnumber`);

--
-- 表的索引 `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teachernumber`),
  ADD UNIQUE KEY `教师_PK` (`teachernumber`);

--
-- 限制导出的表
--

--
-- 限制表 `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `FK_CHECKIN_RELATIONS_COURSESE` FOREIGN KEY (`coursenumber`,`studentnumber`) REFERENCES `courseselect` (`coursenumber`, `studentnumber`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `FK_COURSE_RELATIONS_TEACHER` FOREIGN KEY (`teachernumber`) REFERENCES `teacher` (`teachernumber`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `courseselect`
--
ALTER TABLE `courseselect`
  ADD CONSTRAINT `FK_COURSESE_RELATIONS_COURSE` FOREIGN KEY (`coursenumber`) REFERENCES `course` (`coursenumber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_COURSESE_RELATIONS_STUDENT` FOREIGN KEY (`studentnumber`) REFERENCES `student` (`studentnumber`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
