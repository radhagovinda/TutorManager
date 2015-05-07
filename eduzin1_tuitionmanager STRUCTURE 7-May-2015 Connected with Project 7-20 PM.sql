-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 07, 2015 at 02:13 PM
-- Server version: 5.6.21-70.1-log
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `eduzin1_tuitionmanager`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `attendancerecords`
--
CREATE TABLE IF NOT EXISTS `attendancerecords` (
`ID` int(11)
,`StudentID` int(11)
,`FullName` varchar(203)
,`FathersName` varchar(100)
,`BatchID` int(11)
,`BatchName` varchar(100)
,`Date` date
,`MobileNumber` varchar(10)
,`FathersMobileNumber` varchar(10)
,`IsPresent` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `BatchID` int(11) NOT NULL AUTO_INCREMENT,
  `BatchName` varchar(100) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BatchID`),
  UNIQUE KEY `BatchName` (`BatchName`,`SubjectID`,`ClassID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `Class` varchar(10) NOT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `examresultview`
--
CREATE TABLE IF NOT EXISTS `examresultview` (
`ResultID` int(11)
,`StudentID` int(11)
,`FullName` varchar(203)
,`ExamID` int(11)
,`ExamName` varchar(50)
,`Class` varchar(10)
,`Subject` varchar(100)
,`MarksObtained` int(11)
,`ClassID` int(11)
,`SubjectID` int(11)
,`MobileNumber` varchar(10)
,`FathersMobileNumber` varchar(10)
,`FullMarks` int(11)
,`ExamDate` date
);
-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE IF NOT EXISTS `exams` (
  `ExamID` int(11) NOT NULL AUTO_INCREMENT,
  `ExamName` varchar(50) DEFAULT NULL,
  `SubjectID` int(11) NOT NULL,
  `ForClass` int(11) DEFAULT NULL,
  `ExamDate` date DEFAULT NULL,
  `FullMarks` int(11) DEFAULT NULL,
  PRIMARY KEY (`ExamID`),
  UNIQUE KEY `ExamName` (`ExamName`,`SubjectID`,`ForClass`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `exam_result`
--

CREATE TABLE IF NOT EXISTS `exam_result` (
  `ResultID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `BatchID` int(11) NOT NULL,
  `ExamID` int(11) DEFAULT NULL,
  `MarksObtained` int(11) DEFAULT NULL,
  PRIMARY KEY (`ResultID`),
  UNIQUE KEY `StudentID` (`StudentID`,`ExamID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_table`
--

CREATE TABLE IF NOT EXISTS `fees_table` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassID` int(11) DEFAULT NULL,
  `SubjectID` int(11) NOT NULL,
  `Fees` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE IF NOT EXISTS `months` (
  `MonthID` int(11) NOT NULL AUTO_INCREMENT,
  `Month` varchar(20) NOT NULL,
  PRIMARY KEY (`MonthID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `msg_sms`
--

CREATE TABLE IF NOT EXISTS `msg_sms` (
  `SMSID` int(11) NOT NULL AUTO_INCREMENT,
  `MobileNumbers` varchar(500) DEFAULT NULL,
  `Message` mediumtext,
  `DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`SMSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `msg_sms_attendance`
--

CREATE TABLE IF NOT EXISTS `msg_sms_attendance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MobileNumber` varchar(10) DEFAULT NULL,
  `Message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `msg_sms_batch`
--

CREATE TABLE IF NOT EXISTS `msg_sms_batch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Message` mediumtext,
  `DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `msg_sms_marks`
--

CREATE TABLE IF NOT EXISTS `msg_sms_marks` (
  `SMSID` int(11) NOT NULL AUTO_INCREMENT,
  `MobileNumbers` varchar(500) DEFAULT NULL,
  `Message` mediumtext,
  `DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`SMSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IndividualSMS` varchar(50) NOT NULL DEFAULT 'Yes',
  `BatchSMS` varchar(50) NOT NULL DEFAULT 'Yes',
  `PaymentSMS` varchar(50) NOT NULL DEFAULT 'Yes',
  `ExamSMS` varchar(50) NOT NULL DEFAULT 'Yes',
  `DefaultClass` int(11) NOT NULL,
  `DefaultSubject` int(11) NOT NULL,
  `LetterheadHeader` varchar(40) NOT NULL,
  `LetterheadAddress1` varchar(50) NOT NULL,
  `LetterheadAddress2` varchar(50) NOT NULL,
  `LetterheadAddress3` varchar(50) NOT NULL,
  `LetterheadMobile` varchar(22) NOT NULL,
  `LetterheadPhone` varchar(25) NOT NULL,
  `LetterHeadEmailID` varchar(100) NOT NULL,
  `LetterheadWebsite` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `salutations`
--

CREATE TABLE IF NOT EXISTS `salutations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Salutation` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

CREATE TABLE IF NOT EXISTS `sms_template` (
  `TemplateID` int(11) NOT NULL AUTO_INCREMENT,
  `TargetGroup` varchar(50) DEFAULT NULL,
  `Purpose` varchar(50) NOT NULL,
  `TemplateTitle` varchar(50) DEFAULT NULL,
  `Message` mediumtext,
  PRIMARY KEY (`TemplateID`),
  UNIQUE KEY `TemplateTitle` (`TemplateTitle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `Photo` mediumblob,
  `SalutationID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `FathersName` varchar(100) DEFAULT NULL,
  `Gender` varchar(50) NOT NULL,
  `DOB` date DEFAULT NULL,
  `CurrentlyStudyingAt` mediumtext NOT NULL,
  `MobileNumber` varchar(10) DEFAULT NULL,
  `FathersMobileNumber` varchar(10) DEFAULT NULL,
  `HomePhoneNumber` varchar(15) DEFAULT NULL,
  `PresentAddress` mediumtext,
  `City` varchar(50) DEFAULT NULL,
  `PINCode` int(11) DEFAULT NULL,
  `AdmittedOn` date DEFAULT NULL,
  `IsActive` varchar(50) DEFAULT 'Yes',
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `FirstName` (`FirstName`,`LastName`,`MobileNumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

-- --------------------------------------------------------

--
-- Table structure for table `students_prev_records`
--

CREATE TABLE IF NOT EXISTS `students_prev_records` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `ClassID` int(11) NOT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `BatchID` int(11) DEFAULT NULL,
  `AcademicYear` year(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE IF NOT EXISTS `student_attendance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) NOT NULL,
  `BatchID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `IsPresent` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `StudentID` (`StudentID`,`BatchID`,`Date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_batch`
--

CREATE TABLE IF NOT EXISTS `student_batch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `BatchID` int(11) DEFAULT NULL,
  `AcademicYear` year(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `StudentID_2` (`StudentID`,`BatchID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_payment`
--

CREATE TABLE IF NOT EXISTS `student_payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` int(11) DEFAULT NULL,
  `ClassID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `PaidOn` date DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `ForMonth` int(11) DEFAULT NULL,
  `AcademicYear` year(4) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `StudentID` (`StudentID`,`ClassID`,`SubjectID`,`ForMonth`,`AcademicYear`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `SubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `Subject` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SubjectID`),
  UNIQUE KEY `Subject` (`Subject`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `support_request`
--

CREATE TABLE IF NOT EXISTS `support_request` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `DateNTime` datetime NOT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Details` text NOT NULL,
  `Response` text NOT NULL,
  `ResponseDateNTime` datetime NOT NULL,
  `Status` varchar(6) NOT NULL DEFAULT 'Open',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `useraccess_uggroups`
--

CREATE TABLE IF NOT EXISTS `useraccess_uggroups` (
  `GroupID` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `useraccess_ugmembers`
--

CREATE TABLE IF NOT EXISTS `useraccess_ugmembers` (
  `UserName` varchar(50) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserName`,`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `useraccess_ugrights`
--

CREATE TABLE IF NOT EXISTS `useraccess_ugrights` (
  `TableName` varchar(50) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `AccessMask` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TableName`,`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LoginID` varchar(15) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `EmailID` varchar(100) DEFAULT NULL,
  `IsActive` varchar(100) NOT NULL,
  `ActivationCode` varchar(100) NOT NULL,
  `IsAdministrator` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LoginID` (`LoginID`),
  UNIQUE KEY `EmailID` (`EmailID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `vw_studentbatch`
--

CREATE TABLE IF NOT EXISTS `vw_studentbatch` (
  `ID` int(11) DEFAULT NULL,
  `Photo` mediumblob,
  `StudentID` int(11) DEFAULT NULL,
  `FullName` varchar(202) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NameAndBatch` varchar(311) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AcademicYear` year(4) DEFAULT NULL,
  `BatchID` int(11) DEFAULT NULL,
  `BatchName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MobileNumber` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FathersMobileNumber` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `Class` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `Subject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fees` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `attendancerecords`
--
DROP TABLE IF EXISTS `attendancerecords`;

CREATE ALGORITHM=UNDEFINED DEFINER=`eduzin1`@`localhost` SQL SECURITY DEFINER VIEW `attendancerecords` AS select `student_attendance`.`ID` AS `ID`,`student_attendance`.`StudentID` AS `StudentID`,trim(concat(`salutations`.`Salutation`,' ',`students`.`FirstName`,' ',`students`.`MiddleName`,' ',`students`.`LastName`)) AS `FullName`,`students`.`FathersName` AS `FathersName`,`student_attendance`.`BatchID` AS `BatchID`,`batch`.`BatchName` AS `BatchName`,`student_attendance`.`Date` AS `Date`,`students`.`MobileNumber` AS `MobileNumber`,`students`.`FathersMobileNumber` AS `FathersMobileNumber`,`student_attendance`.`IsPresent` AS `IsPresent` from (((`student_attendance` left join `students` on((`student_attendance`.`StudentID` = `students`.`StudentID`))) left join `salutations` on((`students`.`SalutationID` = `salutations`.`ID`))) left join `batch` on((`student_attendance`.`BatchID` = `batch`.`BatchID`)));

-- --------------------------------------------------------

--
-- Structure for view `examresultview`
--
DROP TABLE IF EXISTS `examresultview`;

CREATE VIEW `examresultview` AS select `exam_result`.`ResultID` AS `ResultID`,`exam_result`.`StudentID` AS `StudentID`,trim(concat(`salutations`.`Salutation`,' ',`students`.`FirstName`,' ',`students`.`MiddleName`,' ',`students`.`LastName`)) AS `FullName`,`exam_result`.`ExamID` AS `ExamID`,`exams`.`ExamName` AS `ExamName`,`class`.`Class` AS `Class`,`subjects`.`Subject` AS `Subject`,`exam_result`.`MarksObtained` AS `MarksObtained`,`class`.`ClassID` AS `ClassID`,`subjects`.`SubjectID` AS `SubjectID`,`students`.`MobileNumber` AS `MobileNumber`,`students`.`FathersMobileNumber` AS `FathersMobileNumber`,`exams`.`FullMarks` AS `FullMarks`,`exams`.`ExamDate` AS `ExamDate` from (((((`exam_result` left join `students` on((`exam_result`.`StudentID` = `students`.`StudentID`))) left join `salutations` on((`students`.`SalutationID` = `salutations`.`ID`))) left join `exams` on((`exam_result`.`ExamID` = `exams`.`ExamID`))) left join `class` on((`exams`.`ForClass` = `class`.`ClassID`))) left join `subjects` on((`exams`.`SubjectID` = `subjects`.`SubjectID`)));
