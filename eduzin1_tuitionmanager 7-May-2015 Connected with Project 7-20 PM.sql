-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2015 at 03:49 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`BatchID`, `BatchName`, `SubjectID`, `ClassID`) VALUES
(11, 'IX', 1, 2),
(12, 'VIII', 1, 1),
(4, 'X-A', 1, 3),
(5, 'X-B', 1, 3),
(6, 'X-G', 1, 3),
(1, 'XI-A', 1, 4),
(2, 'XI-B', 1, 4),
(3, 'XI-G', 1, 4),
(7, 'XII-A', 1, 5),
(8, 'XII-B', 1, 5),
(9, 'XII-C', 1, 5),
(10, 'XII-G', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `Class` varchar(10) NOT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`ClassID`, `Class`) VALUES
(1, 'VIII'),
(2, 'IX'),
(3, 'X'),
(4, 'XI'),
(5, 'XII'),
(6, 'JEE - XI'),
(7, 'JEE - XII');

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

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`ExamID`, `ExamName`, `SubjectID`, `ForClass`, `ExamDate`, `FullMarks`) VALUES
(1, 'Month1 Test1', 2, 2, '2014-06-30', 100),
(3, 'x- math-test 1', 1, 3, '1914-06-26', 60),
(4, 'x-math test-1', 1, 3, '2014-06-26', 60),
(5, 'xi maths 1', 1, 4, '2014-08-08', 60),
(6, 'IX MATH 1', 1, 2, '2015-05-01', 75);

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
  `IsPresent` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ResultID`),
  UNIQUE KEY `StudentID` (`StudentID`,`ExamID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `exam_result`
--

INSERT INTO `exam_result` (`ResultID`, `StudentID`, `BatchID`, `ExamID`, `MarksObtained`, `IsPresent`) VALUES
(1, 21, 4, 3, 57, NULL),
(2, 23, 4, 3, 57, NULL),
(3, 19, 4, 3, 58, NULL),
(4, 18, 4, 3, 55, NULL),
(5, 20, 4, 3, 58, NULL),
(6, 24, 4, 3, 58, NULL),
(7, 25, 4, 3, 42, NULL),
(8, 26, 4, 3, 56, NULL),
(9, 22, 4, 3, 0, NULL),
(10, 131, 4, 3, 40, NULL),
(21, 18, 4, 4, NULL, NULL),
(22, 19, 4, 4, NULL, NULL),
(23, 20, 4, 4, NULL, NULL),
(24, 21, 4, 4, NULL, NULL),
(25, 22, 4, 4, NULL, NULL),
(26, 23, 4, 4, NULL, NULL),
(27, 24, 4, 4, NULL, NULL),
(28, 25, 4, 4, NULL, NULL),
(29, 26, 4, 4, NULL, NULL),
(30, 131, 4, 4, NULL, NULL),
(36, 52, 1, 5, NULL, NULL),
(37, 53, 1, 5, NULL, NULL),
(38, 54, 1, 5, NULL, NULL),
(39, 55, 1, 5, NULL, NULL),
(40, 56, 1, 5, NULL, NULL),
(41, 57, 1, 5, NULL, NULL),
(42, 58, 1, 5, NULL, NULL),
(43, 59, 1, 5, NULL, NULL),
(44, 60, 1, 5, NULL, NULL),
(45, 61, 1, 5, NULL, NULL),
(46, 62, 1, 5, NULL, NULL),
(47, 63, 1, 5, NULL, NULL),
(48, 1, 11, 6, NULL, NULL),
(49, 2, 11, 6, NULL, NULL),
(50, 3, 11, 6, NULL, NULL),
(51, 4, 11, 6, NULL, NULL),
(52, 5, 11, 6, NULL, NULL),
(53, 6, 11, 6, NULL, NULL),
(54, 7, 11, 6, NULL, NULL),
(55, 8, 11, 6, NULL, NULL),
(56, 9, 11, 6, NULL, NULL),
(57, 10, 11, 6, NULL, NULL),
(58, 11, 11, 6, NULL, NULL),
(59, 12, 11, 6, NULL, NULL),
(60, 13, 11, 6, NULL, NULL),
(61, 14, 11, 6, NULL, NULL),
(62, 15, 11, 6, NULL, NULL),
(63, 16, 11, 6, NULL, NULL),
(64, 17, 11, 6, NULL, NULL),
(65, 132, 11, 6, NULL, NULL),
(66, 133, 11, 6, NULL, NULL);

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

--
-- Dumping data for table `fees_table`
--

INSERT INTO `fees_table` (`ID`, `ClassID`, `SubjectID`, `Fees`) VALUES
(1, 2, 1, 400),
(2, 4, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE IF NOT EXISTS `months` (
  `MonthID` int(11) NOT NULL AUTO_INCREMENT,
  `Month` varchar(20) NOT NULL,
  PRIMARY KEY (`MonthID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`MonthID`, `Month`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

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

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`ID`, `IndividualSMS`, `BatchSMS`, `PaymentSMS`, `ExamSMS`, `DefaultClass`, `DefaultSubject`, `LetterheadHeader`, `LetterheadAddress1`, `LetterheadAddress2`, `LetterheadAddress3`, `LetterheadMobile`, `LetterheadPhone`, `LetterHeadEmailID`, `LetterheadWebsite`) VALUES
(1, 'Yes', 'Yes', 'Yes', 'Yes', 13, 2, '', '', '', '', '', '', '', '');

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

--
-- Dumping data for table `salutations`
--

INSERT INTO `salutations` (`ID`, `Salutation`, `Gender`) VALUES
(1, 'Mr', 'Male'),
(2, 'Miss', 'Female'),
(3, 'Mrs', 'Female'),
(4, 'Sri', 'Male'),
(5, 'Smt', 'Female'),
(6, 'Master', 'Male');

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

--
-- Dumping data for table `sms_template`
--

INSERT INTO `sms_template` (`TemplateID`, `TargetGroup`, `Purpose`, `TemplateTitle`, `Message`) VALUES
(2, 'Individual', 'Payment Confirmation', 'Individual - Payment confirmation', 'Dear <StudentNameVariable>, thank you for paying tution fee for the month of <monthVariable>. - Pradip Sir'),
(3, 'Individual', 'Exam Report', 'Individual - Exam report', 'Dear <StudentNameVariable>, you obtained <marksObtainedVariable> out of <totalmarksVariable> in the <SubjectVariable>  mock test held on <dateVariable>. Highest Mark: <highestMarksVariable>. - Pradip Sir'),
(4, 'Batch', 'Class Re-scheduling', 'Batch - Class re-scheduling', 'Dear <StudentNameVariable>, your tution class has been recheduled on <dateVariable> at <timeVariable>. - Pradip Sir'),
(5, 'Individual', 'Absence', 'Individual - Absence', 'Dear <StudentNameVariable>, <YouOrYourSonVariable> was abscent in the tution class on <DateVariable>. - Pradip Sir');

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
  `CurrentlyStudyingAt` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=135 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `Photo`, `SalutationID`, `FirstName`, `MiddleName`, `LastName`, `FathersName`, `Gender`, `DOB`, `CurrentlyStudyingAt`, `MobileNumber`, `FathersMobileNumber`, `HomePhoneNumber`, `PresentAddress`, `City`, `PINCode`, `AdmittedOn`, `IsActive`) VALUES
(1, '', 5, 'KATAKI', '', 'MAHATA', 'SOMNATH  MAHATA', 'Female', '2000-03-14', '', '9635541626', '9932988265', '', '', '', 0, '0000-00-00', ''),
(2, '', 5, 'NASHA', '', 'CHATTERJEE', 'SANTI  CHATTERJEE', 'Female', '1999-06-18', '', '9635856362', '9932820074', '', '', '', 0, '0000-00-00', ''),
(3, '', 5, 'SAYANTANI', '', 'MONDAL', 'ALOK  KR.  MONDAL', 'Female', '2001-04-14', '', '8900481925', '8900481925', '', '', '', 0, '0000-00-00', ''),
(4, '', 5, 'MOON', '', 'SHIT ', 'SUKHAMAY  SHIT', 'Female', '2000-11-20', '', '9679076464', '9002277459', '', '', '', 0, '0000-00-00', ''),
(5, '', 5, 'PAYAL', '', 'KAKSHIT', 'AKSHYA  KAKSHIT', 'Female', '2000-08-28', '', '9679473080', '8798083636', '', '', '', 0, '0000-00-00', ''),
(6, '', 5, 'URMI', '', 'MUKHERJEE', 'HEMANTA  MUKHERJEE', 'Female', '1999-08-30', '', '9475198607', '9433290287', '', '', '', 0, '0000-00-00', ''),
(7, '', 4, 'KALYAN', '', 'DANDAPAT', 'PIJUSH DANDAPAT', 'Male', '1999-10-06', '', '9547820462', '9434944199', '', '', '', 0, '0000-00-00', ''),
(8, '', 4, 'ARITRA', '', 'SARKAR', 'ASIM  SARKAR', 'Male', '2000-09-25', '', '9434349293', '9434349293', '', '', '', 0, '0000-00-00', ''),
(9, '', 4, 'AKAS', '', 'THAKUR ', 'SASWATI  THAKUR', 'Male', '1999-12-11', '', '7585972097', '7584009442', '', '', '', 0, '0000-00-00', ''),
(10, '', 4, 'MAINAK', '', 'PALOI', 'MANOJ  KR.  PALOY', 'Male', '2001-01-24', '', '8145371566', '9434944063', '', '', '', 0, '0000-00-00', ''),
(11, '', 5, 'SONAI', '', 'NANDI', 'PRATIMA  NANDI', 'Female', '2000-10-25', '', '9635632562', '9635632562', '', '', '', 0, '0000-00-00', ''),
(12, '', 4, 'SOUMYA', '', 'SITKHAN', 'SATYAJIT  KHAN', 'Male', '1999-07-29', '', '9609008322', '9609008322', '', '', '', 0, '0000-00-00', ''),
(13, '', 4, 'APURBA', '', 'PAL', 'UTLAM  PAL', 'Male', '2000-04-08', '', '9932049077', '8016137879', '', '', '', 0, '0000-00-00', ''),
(14, '', 4, 'SOUMYADEEP', '', 'DAS', 'UDAN  KR. DAS', 'Male', '2001-02-28', '', '7031230252', '9474824073', '', '', '', 0, '0000-00-00', ''),
(15, '', 4, 'ARKAPRA', '', 'PRADHAN', 'SURYA  KANTA  PRADHAN', 'Male', '2000-06-20', '', '9932721207', '9932721207', '', '', '', 0, '0000-00-00', ''),
(16, '', 4, 'DIPANKAR', '', 'CHAKRABORTY', 'DABASIS  CHOKRABORTY', 'Male', '1999-11-12', '', '9547741074', '9002765278', '', '', '', 0, '0000-00-00', ''),
(17, '', 4, 'SUBHOJIT', '', 'BISWAS', 'SHYMAL  CH.  BISWAS', 'Male', '1999-11-11', '', '933838662', '933838662', '', '', '', 0, '0000-00-00', ''),
(18, '', 4, 'SUDIP', '', 'SARDAR', 'SRISTIDHAR  SARDAR', 'Male', '0000-00-00', '', '7602066408', '9434628119', '', '', '', 0, '0000-00-00', ''),
(19, '', 4, 'SUBHADIP', '', 'BEJ', 'ARUN  KR.  BEJ', 'Male', '1999-10-31', '', '8972386851', '8972386851', '', '', '', 0, '0000-00-00', ''),
(20, '', 4, 'APURBA', '', 'DAS', 'PRAKASH  KR.  DAS', 'Male', '1999-01-23', '', '9933749935', '9933749935', '', '', '', 0, '0000-00-00', ''),
(21, '', 4, 'NILANJAN', '', 'BERA', 'NRIPEN  KR.  BERA', 'Male', '1998-12-11', '', '9088518998', '9748088783', '', '', '', 0, '0000-00-00', ''),
(22, '', 4, 'SAYAN', '', 'PRADHAN', 'GURUPADA  PRADHAN', 'Male', '2000-12-03', '', '9609085649', '9609085649', '', '', '', 0, '0000-00-00', ''),
(23, '', 4, 'SOHAM', '', 'MAHAPATRA', 'SITANGSU  MAHAPATRA', 'Male', '1999-09-22', '', '9093350747', '9932732493', '', '', '', 0, '0000-00-00', ''),
(24, '', 4, 'SUBHASIS', '', 'MANDAL', 'TANAY  MANDAL', 'Male', '1999-12-27', '', '9476429589', '8900360216', '', '', '', 0, '0000-00-00', ''),
(25, '', 4, 'ANIK', '', 'DUTTA', 'ARUP  DUTTA', 'Male', '1998-08-22', '', '9002323687', '9002323687', '', '', '', 0, '0000-00-00', ''),
(26, '', 4, 'AYAN', '', 'MAHATA', 'ASIT  BARAN  MAHATA', 'Male', '1999-12-25', '', '8081588335', '9733750950', '', '', '', 0, '0000-00-00', ''),
(27, '', 4, 'RABI', '', 'BISWAS', 'RUMA  BISWAS', 'Male', '0000-00-00', '', '7547776176', '7547776176', '', '', '', 0, '0000-00-00', ''),
(28, '', 4, 'SOURAV', '', 'CHAKROBARTI', 'ASHIS  CHAKROBARTI', 'Male', '1998-11-24', '', '9932680644', '9932680644', '', '', '', 0, '0000-00-00', ''),
(29, '', 4, 'NILABJA', '', 'BANERJI', 'PRADIP  BANERJI', 'Male', '1999-02-02', '', '9475266473', '9608848016', '', '', '', 0, '0000-00-00', ''),
(30, '', 4, 'ASISH', '', 'PAL', 'MADAN  PAL', 'Male', '1999-02-09', '', '9735709274', '9735709274', '', '', '', 0, '0000-00-00', ''),
(31, '', 4, 'GOURAB', 'KUMAR', 'GHOSH', 'GOPAL  KR.  GHOSH', 'Male', '1999-10-04', '', '9126016076', '9932438964', '', '', '', 0, '0000-00-00', ''),
(32, '', 4, 'DEBAYAN', '', 'BISWAS', 'DEBABRATA  BISWAS', 'Male', '1998-09-14', '', '8001488558', '9733676498', '', '', '', 0, '0000-00-00', ''),
(33, '', 4, 'SUBHDIP', '', 'BARIK', ' SUSANTA  BARIK', 'Male', '1999-09-05', '', '9609100678', '9609100678', '', '', '', 0, '0000-00-00', ''),
(34, '', 4, 'SOMYADEEP', '', ' BERA', 'JAYANTA  KR.  BERA', 'Male', '1999-04-19', '', '9775108995', '9932751498', '', '', '', 0, '0000-00-00', ''),
(35, '', 4, 'SAYANTAN', '', 'MAHAPATRA', 'SIBSANKAR  MAHAPATRA', 'Male', '1999-04-19', '', '9851116789', '8001039874', '', '', '', 0, '0000-00-00', ''),
(36, '', 4, 'SWARNADIP', '', 'KUNDU', 'TAPAS  KR.  KUNDU', 'Male', '1998-11-29', '', '9475888419', '9475888419', '', '', '', 0, '0000-00-00', ''),
(37, '', 5, 'AISHARYA', '', 'CHAKRABARTI', 'SUDIP  CHACRABARTI', 'Female', '1999-10-24', '', '8609226872', '8609226872', '', '', '', 0, '0000-00-00', ''),
(38, '', 5, 'ANKITA', '', 'GHOSAL', 'SUDAMA  GHOSAL', 'Female', '1999-05-14', '', '9635682641', '9800846880', '', '', '', 0, '0000-00-00', ''),
(39, '', 5, 'APARUPA', '', 'DAS', 'HIMADRI  KR  DAS', 'Female', '2000-03-04', '', '9476169404', '9474447113', '', '', '', 0, '0000-00-00', ''),
(40, '', 5, 'DEBOSMITA', '', 'SEN', 'PANNALAL  SEN', 'Female', '1999-05-09', '', '7797242006', '7547989182', '', '', '', 0, '0000-00-00', ''),
(41, '', 5, 'DEBADRITA', '', 'ROY', 'TARAK  PRASAD  ROY', 'Female', '1998-12-16', '', '9932782369', '9475143545', '', '', '', 0, '0000-00-00', ''),
(42, '', 5, 'MEGHNA', '', 'SHAW', 'SUSHEN  KR.  SHAW', 'Female', '1999-05-12', '', '9232576988', '9232576988', '', '', '', 0, '0000-00-00', ''),
(43, '', 5, 'PROMITA', '', 'SINGHA', 'MOHIT  KR.  SINGHA', 'Female', '1999-10-12', '', '8436865387', '9733040120', '', '', '', 0, '0000-00-00', ''),
(44, '', 5, 'PRERANA', '', 'ROY', 'DILIP  KR.  ROY', 'Female', '1999-06-28', '', '9734530365', '9734530365', '', '', '', 0, '0000-00-00', ''),
(45, '', 5, 'RIMPA', '', 'DAS', 'MONORANJAN  DAS', 'Female', '1999-11-15', '', '8798104570', '7602742612', '', '', '', 0, '0000-00-00', ''),
(46, '', 5, 'SUMANA', '', 'PAL', 'BASUDEB  PAL', 'Female', '2000-02-02', '', '9647803582', '9030260662', '', '', '', 0, '0000-00-00', ''),
(47, '', 5, 'SYALEENA', '', 'PARVEEN', 'SK.  HAMIDUL  HAQUE', 'Female', '1999-05-22', '', '9153765437', '9749185402', '', '', '', 0, '0000-00-00', ''),
(48, '', 5, 'MAYURAKSHEE', '', 'PAHARI', 'PIYUSH  KANTI  PAHARI', 'Female', '1999-03-25', '', '9434989959', '8900259994', '', '', '', 0, '0000-00-00', ''),
(49, '', 5, 'SHREYASI', '', 'SARANGI', 'PRASUN  SARANGI', 'Female', '1999-06-19', '', '9775538377', '9434259769', '', '', '', 0, '0000-00-00', ''),
(50, '', 5, 'PRITHA', '', 'MAHAKUR', 'ASHOK  MAHAKUR', 'Female', '1999-08-03', '', '7602436989', '7602436989', '', '', '', 0, '0000-00-00', ''),
(51, '', 5, 'SHRAMANA', '', 'SARKAR', 'ASIM  SARKAR', 'Female', '1999-03-30', '', '9434348293', '9932277715', '', '', '', 0, '0000-00-00', ''),
(52, '', 4, 'BIBASWAN', '', 'RATH', 'BALARAM  RATH', 'Male', '1998-02-15', '', '9474663430', '9474663430', '', '', '', 0, '0000-00-00', ''),
(53, '', 4, 'SUJAY', '', 'SANNYAMATH', 'SUKUMAR  SANNYAMATH', 'Male', '1998-05-16', '', '8116022531', '9474618951', '', '', '', 0, '0000-00-00', ''),
(54, '', 4, 'DEBARGHA', '', 'DASUKIL', 'PRADYUT  DASUKIL', 'Male', '1998-12-18', '', '9434369758', '9476482204', '', '', '', 0, '0000-00-00', ''),
(55, '', 4, 'NABHOJYOTI', '', 'GHARAI', 'NARAYAN  CHANDRA  GHARAI', 'Male', '1999-09-01', '', '9635814532', '9434038767', '', '', '', 0, '0000-00-00', ''),
(56, '', 4, 'SUBHAM', '', 'NANDA', 'DEBANSHU  NANDA', 'Male', '1997-09-21', '', '9433219194', '7872127722', '', '', '', 0, '0000-00-00', ''),
(57, '', 4, 'PIJUSH', '', 'DAS', 'SIKHA  DAS', 'Male', '1999-01-20', '', '8348224193', '9800772860', '', '', '', 0, '0000-00-00', ''),
(58, '', 4, 'DEEPTARKA', '', 'DASUKIL', 'KARABI  DASUKIL', 'Male', '1997-05-13', '', '8967917905', '9476482204', '', '', '', 0, '0000-00-00', ''),
(59, '', 4, 'ANISH', '', 'NAYEK', 'AJIT  KR.  NAYEK', 'Male', '1999-01-28', '', '9679622406', '9434453832', '', '', '', 0, '0000-00-00', ''),
(60, '', 4, 'UTSASARIT', '', 'DUTTA', 'SIDDHARTHA  DUTTA', 'Male', '1997-01-10', '', '7551891655', '9475257842', '', '', '', 0, '0000-00-00', ''),
(61, '', 4, 'ABHIK', '', 'BASU', 'MANOJ  BASU', 'Male', '1998-03-05', '', '8972864219', '9932499405', '', '', '', 0, '0000-00-00', ''),
(62, '', 4, 'SNEHASISH', '', 'PAL', 'SUBHASISH  PAL ', 'Male', '1998-09-06', '', '9093139637', '9932540770', '', '', '', 0, '0000-00-00', ''),
(63, '', 4, 'PRASUN', '', 'PATRA', 'ASHIS  PATRA', 'Male', '1998-01-10', '', '9800786506', '9932228939', '', '', '', 0, '0000-00-00', ''),
(64, '', 4, 'BISWARUP', '', 'MAHALA', 'BARUN MAHALA', 'Male', '1998-09-17', '', '8768149569', '9775528303', '', '', '', 0, '0000-00-00', ''),
(65, '', 4, 'SOURAV', '', 'KUNDU', 'NATABAR  KUNDU', 'Male', '1997-09-07', '', '8348846296', '7602013539', '', '', '', 0, '0000-00-00', ''),
(66, '', 4, 'ARCHISMAN', '', 'SINHA', 'TAPAN  KR.  SINHA', 'Male', '1998-10-19', '', '8101991201', '9434341862', '', '', '', 0, '0000-00-00', ''),
(67, '', 4, 'PIJUSH', '', 'PATRA', 'MRINAL  PATRA', 'Male', '1998-05-12', '', '9800305877', '9933554671', '', '', '', 0, '0000-00-00', ''),
(68, '', 4, 'ANIRUDDHA', '', 'GHOSH', 'SHYAMAL  GHOSH', 'Male', '1998-03-23', '', '9547719631', '9547719631', '', '', '', 0, '0000-00-00', ''),
(69, '', 4, 'SUBRATA', '', 'HANSDA', 'PRASANTA  KR. HANSDA', 'Male', '1998-08-14', '', '9547845068', '9647469747', '', '', '', 0, '0000-00-00', ''),
(70, '', 4, 'RAJDEEP', '', 'KUILA', 'NITISH  KR.KUILA', 'Male', '1998-03-17', '', '9547990364', '9955374501', '', '', '', 0, '0000-00-00', ''),
(71, '', 4, 'SOUBHIK', '', 'DASH', 'ANIMA  DASH', 'Male', '1998-04-16', '', '9547927359', '9547927359', '', '', '', 0, '0000-00-00', ''),
(72, '', 4, 'PIJUSH', 'KANTI', 'DESUIALI', 'SAKTI  SADHAN  DESUIALI', 'Male', '1998-10-28', '', '9476336059', '9002277410', '', '', '', 0, '0000-00-00', ''),
(73, '', 4, 'SOUVIK', '', 'MITRA', 'PINAKI  MITRA', 'Male', '1999-01-18', '', '9932096435', '9735635123', '', '', '', 0, '0000-00-00', ''),
(74, '', 4, 'JHANKAR', '', 'SINHA', 'SANKAR  PROSAD SINHA', 'Male', '0000-00-00', '', '9002997492', '9800366461', '', '', '', 0, '0000-00-00', ''),
(75, '', 4, 'PALLAB', '', 'DAS', 'BADAL  CH.  DAS', 'Male', '1997-08-12', '', '8372965910', '8001275021', '', '', '', 0, '0000-00-00', ''),
(76, '', 4, 'HRISHIKESH', '', 'MAHATA', 'PRASENJIT  MAHATA', 'Male', '1999-01-02', '', '8001430488', '9635481727', '', '', '', 0, '0000-00-00', ''),
(77, '', 4, 'SOUMEN', '', 'PAL', 'DILIP  PAL', 'Male', '1998-08-11', '', '9002729408', '9933016916', '', '', '', 0, '0000-00-00', ''),
(78, '', 4, 'SOMNATH', '', 'PAL', 'DILIP  PAL', 'Male', '1998-08-11', '', '9002729408', '9933016916', '', '', '', 0, '0000-00-00', ''),
(79, '', 4, 'SUBHAMAY', '', 'DEY', 'SUDARSAN DEY', 'Male', '1998-08-13', '', '9800983360', '9933709017', '', '', '', 0, '0000-00-00', ''),
(80, '', 5, 'MAMATA', '', 'PAL', 'JOYLAL PAL', 'Female', '1999-05-24', '', '8972655830', '9635243287', '', '', '', 0, '0000-00-00', ''),
(81, '', 5, 'ARENA', '', 'PATRA', 'CHANDI  CHARAN PATRA', 'Female', '1998-09-21', '', '9932786505', '9932786505', '', '', '', 0, '0000-00-00', ''),
(82, '', 5, 'JANUSHREE', '', 'MANDAL', 'KAMAL MANDAL', 'Female', '1998-07-05', '', '8348929538', '9378081086', '', '', '', 0, '0000-00-00', ''),
(83, '', 5, 'MANISHA', '', 'BISWAS', 'JIBAN  BISWAS', 'Female', '1999-12-03', '', '9800609825', '9933000309', '', '', '', 0, '0000-00-00', ''),
(84, '', 5, 'RIYA', '', 'KARAN', 'SUKUMAR  KARAN', 'Female', '1997-07-09', '', '9932507699', '8420081211', '', '', '', 0, '0000-00-00', ''),
(85, '', 5, 'KRITIDIPA', 'PANDA', 'MAHAPATRA', 'KRISHNAPRASAD  PANDA  MAHAPATRA', 'Female', '1997-08-27', '', '9434413368', '9434418664', '', '', '', 0, '0000-00-00', ''),
(86, '', 5, 'PIYA', '', 'DUTTA', 'GOPAL  DUTTA', 'Female', '1998-10-15', '', '9584994185', '9800947264', '', '', '', 0, '0000-00-00', ''),
(87, '', 4, 'RANJAN', '', ' MANDAL', 'SAMIRCH  MANDAL', 'Male', '1996-09-27', '', '9932274340', '993213775', '', '', '', 0, '0000-00-00', ''),
(88, '', 4, 'SOUMYADEEP', '', 'SENAPATI', 'ARDHENDU  SENAPATI', 'Male', '1997-02-28', '', '8001422091', '9434628127', '', '', '', 0, '0000-00-00', ''),
(89, '', 4, 'SUBHADEEP', '', 'CHAKRABORTY', 'DEBASISH  CHAKROBARTI', 'Male', '1997-01-07', '', '8670063318', '9002102728', '', '', '', 0, '0000-00-00', ''),
(90, '', 4, 'SASWATA', '', 'MAHATA', 'SAMBIT   MAHATA', 'Male', '1998-01-10', '', '9679201948', '9434321635', '', '', '', 0, '0000-00-00', ''),
(91, '', 4, 'SUBHADEEP', '', 'SATPATHY', ' AMIR  SATPATHY', 'Male', '1996-11-12', '', '9635020138', '9932988691', '', '', '', 0, '0000-00-00', ''),
(92, '', 4, 'SANTANU', '', ' SATPATHY', ' SWAPAN  SATPATHY', 'Male', '1998-09-18', '', '8798062558', '9933750585', '', '', '', 0, '0000-00-00', ''),
(93, '', 4, 'SUMANTA', '', 'GHOSH', ' PRASANTA  GHOSH', 'Male', '1998-01-05', '', '8001762066', '8001762066', '', '', '', 0, '0000-00-00', ''),
(94, '', 4, 'PRIYAM', '', 'MITRA', 'MR.  PANCHAN  MITRA', 'Male', '1998-01-20', '', '9474616708', '8116050492', '', '', '', 0, '0000-00-00', ''),
(95, '', 4, 'SASWATA', '', 'PAUL', 'SOUMEN  KUMAR  PAUL', 'Male', '1998-07-14', '', '9476473987', '9932504717', '', '', '', 0, '0000-00-00', ''),
(96, '', 4, 'ARUNAVA', '', 'CHAKROBORTI', 'GOURANGA  SUNDAR  CHAKROBORTI', 'Male', '1998-02-13', '', '8170079945', '8016425599', '', '', '', 0, '0000-00-00', ''),
(97, '', 4, 'DABADRI', '', 'BANERJEE', 'S.K. BANERJEE', 'Male', '1998-08-04', '', '8001984993', '9434806024', '', '', '', 0, '0000-00-00', ''),
(98, '', 4, 'SOUMILAK', '', 'NANDI', ' PRADIP  KR.   NANDI', 'Male', '1997-09-28', '', '9800990843', '9800990843', '', '', '', 0, '0000-00-00', ''),
(99, '', 4, 'SUBHADEEP', '', 'MANNA', 'SHAMSUNDAR  MANNA', 'Male', '1997-05-14', '', '9933081288', '9932455692', '', '', '', 0, '0000-00-00', ''),
(100, '', 4, 'RITABRATA', '', 'MAHAPATRA', 'NAROTTAM  MAHAPATRA', 'Male', '1996-04-21', '', '8343019140', '9434989968', '', '', '', 0, '0000-00-00', ''),
(101, '', 4, 'PARTHA', 'SARATHI', 'ROUT', 'GOURANGA  ROUT', 'Male', '1998-01-01', '', '8388005866', '9800914967', '', '', '', 0, '0000-00-00', ''),
(102, '', 4, 'ARUP', 'KUMAR', 'DAS', 'KAMAL  KANTI  DAS', 'Male', '1997-01-20', '', '8972783475', '9933107058', '', '', '', 0, '0000-00-00', ''),
(103, '', 4, 'PRASHNA', '', 'PAUL', ' PRABIR  PAUL', 'Male', '1998-01-28', '', '9635490406', '9933015437', '', '', '', 0, '0000-00-00', ''),
(104, '', 4, 'SUMAN', '', 'MAHATA', 'SWAPAN  MAHATA', 'Male', '1998-10-15', '', '8759622354', '9933477845', '', '', '', 0, '0000-00-00', ''),
(105, '', 4, 'RAJU', '', 'DANDAPATH', 'DASARATH  DANDAPATH', 'Male', '1997-11-18', '', '9647844951', '9749960073', '', '', '', 0, '0000-00-00', ''),
(106, '', 4, 'ABHISHEK', '', 'PORIYA', 'DILIP  PORIYA', 'Male', '1996-05-31', '', '8372965294', '8972694422', '', '', '', 0, '0000-00-00', ''),
(107, '', 4, 'SRIMANTA', '', 'BEJ', 'MATHUR  BEJ', 'Male', '1996-05-09', '', '7602280373', '9679600469', '', '', '', 0, '0000-00-00', ''),
(108, '', 4, 'ADARSHA', 'BIKRAM', 'CHUNDRA', 'SUDIPA  CHUNDRA', 'Male', '1996-09-09', '', '9647739954', '7699216328', '', '', '', 0, '0000-00-00', ''),
(109, '', 4, 'SUMAN', '', 'PATRA', 'SAKTIPADA  PATRA', 'Male', '1997-03-14', '', '8013950076', '9932721709', '', '', '', 0, '0000-00-00', ''),
(110, '', 4, 'ARITRA', '', 'MANDAL', 'ABIJIT  MANDAL', 'Male', '1997-08-17', '', '9679880323', '7602011197', '', '', '', 0, '0000-00-00', ''),
(111, '', 4, 'TRINANKUR', '', 'HATIAL', 'ASHOK  HATIAL', 'Male', '1998-11-16', '', '8116623060', '9932101133', '', '', '', 0, '0000-00-00', ''),
(112, '', 5, 'ARCHANA', '', 'DESWALI', 'SAKTI  SADHAM  DESWALI', 'Female', '1995-12-05', '', '9476336059', '9002277410', '', '', '', 0, '0000-00-00', ''),
(113, '', 5, 'ANANYA', '', 'DHAR', 'TAPAS  DHAR', 'Female', '1998-04-29', '', '9593423788', '9593423788', '', '', '', 0, '0000-00-00', ''),
(114, '', 5, 'SWAGATA', '', 'CHATTERJEE', 'UJJAL  CHATTERJEE', 'Female', '1998-03-28', '', '7679222600', '9475254742', '', '', '', 0, '0000-00-00', ''),
(115, '', 5, 'ALALIKA', '', 'ROY', 'AMITABHA  ROY', 'Female', '1997-08-24', '', '9800138220', '9679973076', '', '', '', 0, '0000-00-00', ''),
(116, '', 5, 'ANAMIKA', '', 'DEY', 'NIRMAL  DEY', 'Female', '1998-01-13', '', '7407184195', '9733760440', '', '', '', 0, '0000-00-00', ''),
(117, '', 4, 'SUBHAM', '', 'DAS', 'PRAKRITI  RANJAN  DAS', 'Male', '1997-04-14', '', '7679741346', '9732725281', '', '', '', 0, '0000-00-00', ''),
(118, '', 4, 'ANUPAM', '', 'DEY', 'CHANDAN  DEY', 'Male', '1997-05-20', '', '9733633094', '9732915137', '', '', '', 0, '0000-00-00', ''),
(119, '', 4, 'KOUSHIK', '', 'MAHATA', 'BHABESH  CHANDRA  MAHATA', 'Male', '1998-01-05', '', '8348923505', '8016727016', '', '', '', 0, '0000-00-00', ''),
(120, '', 4, 'PUSPENDU', '', 'KHAN', 'PRABIN  KHAN', 'Male', '1998-05-24', '', '9733809109', '8670212151', '', '', '', 0, '0000-00-00', ''),
(121, '', 4, 'BRIJESH', '', 'BHATTACHARYYA', 'SIDDHINATH  BHATTACHARYYA', 'Male', '1996-11-30', '', '9635161300', '9002277343', '', '', '', 0, '0000-00-00', ''),
(122, '', 4, 'RAHUL', '', 'MANDAL', 'SUDHANSU  MANDAL', 'Male', '1997-12-05', '', '8926929591', '8926498683', '', '', '', 0, '0000-00-00', ''),
(123, '', 4, 'ANIMESH', '', 'MAHATA', 'JHARESWAR  MAHATA', 'Male', '1997-01-09', '', '9732630945', '9732630945', '', '', '', 0, '0000-00-00', ''),
(124, '', 5, 'POULAMI', '', 'MANDAL', 'PRADIP  KR.  MANDAL', 'Female', '1996-02-01', '', '9647079398', '9564165845', '', '', '', 0, '0000-00-00', ''),
(125, '', 5, 'AYANTIKA', '', 'MAPA', 'TARUN  KR.  MAPA', 'Female', '1998-09-04', '', '9679295054', '9635658635', '', '', '', 0, '0000-00-00', ''),
(126, '', 5, 'SAYANI', '', 'PRADHAN', 'GURUPADA  PRADHAN', 'Female', '1997-05-27', '', '9732696826', '9732696826', '', '', '', 0, '0000-00-00', ''),
(127, '', 5, 'PRIYANKA', '', 'SINGH', 'RAIPADA  SINGH', 'Female', '1997-06-25', '', '9933000302', '9434341852', '', '', '', 0, '0000-00-00', ''),
(128, '', 5, 'SRIPARNA', '', 'BEJ', 'NABA  KR.  BEJ', 'Female', '1998-07-06', '', '8670655424', '9732710508', '', '', '', 0, '0000-00-00', ''),
(129, '', 5, 'RIMPA', '', 'KUNDU', 'SUBIR  KUNDU', 'Female', '1998-05-02', '', '9635640757', '9932503274', '', '', '', 0, '0000-00-00', ''),
(130, '', 5, 'RIDDHIPALI', '', 'BHAWAL', 'TIRTHADYUTI BHAWAL', 'Female', '1998-01-22', '', '9733877934', '9800740263', '', '', '', 0, '0000-00-00', ''),
(131, NULL, 4, 'pradip', '', 'mallick', '', 'Male', NULL, '', '', '9830610909', '', '', '', NULL, '2013-07-10', 'Yes');
INSERT INTO `students` (`StudentID`, `Photo`, `SalutationID`, `FirstName`, `MiddleName`, `LastName`, `FathersName`, `Gender`, `DOB`, `CurrentlyStudyingAt`, `MobileNumber`, `FathersMobileNumber`, `HomePhoneNumber`, `PresentAddress`, `City`, `PINCode`, `AdmittedOn`, `IsActive`) VALUES
(132, 0xffd8ffe000104a46494600010201004800480000ffe10abc4578696600004d4d002a000000080007011200030000000100010000011a00050000000100000062011b0005000000010000006a01280003000000010002000001310002000000140000007201320002000000140000008687690004000000010000009c000000c80000004800000001000000480000000141646f62652050686f746f73686f7020372e3000323031353a30343a33302031343a34353a33320000000003a001000300000001ffff0000a00200040000000100000288a0030004000000010000016c0000000000000006010300030000000100060000011a00050000000100000116011b0005000000010000011e01280003000000010002000002010004000000010000012602020004000000010000098e0000000000000048000000010000004800000001ffd8ffe000104a46494600010201004800480000ffed000c41646f62655f434d0002ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc00011080048008003012200021101031101ffdd00040008ffc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00e37a5e5555e4dafea58ff6d19437baedc43c3a0fb87ef7f299ff006da8bf66e3b676cfb6798f35569b482c67c823ceaac0362b46ac854afbb73a5d8f198daf71d85af964e92048f6ad7858bd2cfebf5f9b5fff0052b736a3a24034c08502d4584c5a9a5345acf6050637de3cd1dedd0a88696d8ddc2083a84c296dd78ef812368f3fee53f499cfd29fb92b721f30cd83cde4ff00e7b67b909c1f61f73dee1fba3d80fc63f48a5f4861a9cbc1afd544638dbed209223e0a0c92022dcca5ad35dae6541fc824027fcf3b957766e256df66fb5ad1ab98c2400206f7b9db7da9a48259238e4056ec72ea759510c8dfac4f1a8da878b41a696b5dab8093f342bfa95fb4baaa406ed0585e77123f79cdacfb1a8f8d91ebd41f10ee1c3cd0d126c32210dc118a138688a9ffd0f396c9b5a26248d6255c275f1d55267f3ac27890ac8727e3eac3906ceafd5d184eeb148cfb9f8f8fb6c2eb6a67a8f0430ec02b35ddf4bfe2d6c5d76df43d0b8ddbb2acab247d9887578a1e062f50653fa37bfd6c7fd2b99fe93f44b9fe8af23a9d5b792db40f89adebacc321f9507dc3468ffa4d48cbd623ddb1831038cc8de84e8d5656f7b729df6da03e869762d7f66b6720eeb5ada7e96ec7b9ccaaab7f91f6babfd1a9db8af1616d79f43ebf44da2d38d7b41b41fe85b6777a8eff00488d8adfd3bbc0807ee2f6ff00df511c086478426199661cbc5c26bf2dd7318e7b08203dec35398e6fefd5ef7fd2d7f9c561f4e40a8e5b6b36d75826f74c6c681ecb35fa4dd3626d3f693c7837f2995d160e3d76fd5cea12d97371b260f07dbea3bb7f554b8871c493d013f63579888c7388034240ff0019e6597e63dc1d0d635f03d8c73dc1a35ff09b18e7bb7392b2acc20bdcfb8d6d24b9a5c1920fb2af6d5f43e96fb55fc76835d47f920fe0a56b4101bc020cfc828eedb630423d1cd6e00008db5b05adf4c96b64c7e7bc3ec3b9b659f9cf4f93439f8f758e739eff004c30b1b0ddcd105acdacdab41adf6b04773fc156ca6b4e1e607377015cb84c681bbb9feca2931001a0e56396827d5f6b9a3680e1b49d7f77f93fcb44a237db1c17c88f301536645cc1ed7b88267e91fbb77bd5ba5e1ef7b81dcd7110ee09111aff00293c1d9cf942a47c5317098efca83fe8924401249592dc8ccbac2d7daf0d133b4ede0c7e628dd5beb76ef55ce68734439d24ee30e6f297174453ffd1f366c92d8ee7f21470e55d87e88e75fe28bb8fc91831cfa3a5d08ff95f1fcf78ff00c0debb1e9cd06c6be60b9ce33e1b7d45c6742ff9671078b88d3cd8f5d7e23c33183ff7038cfc4bd34ff3b16df2ff00cccffc2ffa2cf19c3731ddceefc0877fdf949f000e4cf3f7943af47b07f2ec6ffd1a5e8b601b4f60d83f91349d0b6438c0c753b3fa821753d03f4bd1b36a3f9f564b7ef162e4ef7ecea6f3db64fe2ba7faa373acfb4506b21a6a7bc3fb12f0f06afebb7e929f963a11de3273f9edefb105c6c174e3d24f760fc88b611357998fbdaf557a79fd529f26c7dcac59ed351fdd737f2b99fc54424e811aac1d0013d8b894276db5b9351902c60698e750f6e898b883fda3f914262c71f16fe4251e25a46ee4e660535180f7bc0701ee2351a7ee86a2b71598cf7318496eeefa9e7c53f517412ef207ee44bcfe91df14e8969e70055393539ad190d7923d3b1ce11a1827681a7e6a05af79ab711b65cd2e075313ed77f6b6a96461671bee75200658f2e9dc013ff7e41fd9f9e0924093cfbc6a851b61a0ff00ffd2f33adc439a41820e84232aec3c7c51a520b641bfd0c86f58c3f0f57f2b5cbb3c0d96d4ca6012fade48f836cb355c374cb033a8e33c9802c049f282ba9e91d6306bccae5fbc319635e00f1aad66931fbc881eb89eccf8a558663bdffd16e32cf7027b5cdd7faf4c7fd53516cbc6cb35100b41278d5ba058aece74fa41bb5ef6d76b49f689afe906ff0059ab17ae66dd7e5bd9696965236b36ced98fa71fbeeddb50303af665967881dcf67572ecff002899d3d9ff007e95d37d59ceaea65ef7b834369793e50d7ae0712db1b532cb9f035da5e75d86360d7e0ae33ab015be8a1ceb0d836b9b5824c77e14984f05deba16a7327dcf0d9d1c1c90da5ac718dbe20f82b0ec9169686383a4b48823b3a42e71bd498c3631e2daf58748d41466f53acb83997343dbf427da477eea3e01dcb38e625d40fb5dc3682447ef19fb9ca1eafbcf948ffa95955e439cd9024c6ae6bb83e2d829c65383c92d7b5b046e9993e7bb725c1e213f781d8a6ea0e969f36a77dbba1de201fbc2a57e46f6ed7132473da0f6feb27aeddcc11db41f2d138021872cc4aa9b25ca27b9f043dc98bb44e0c34fffd3f3069e3e28b2aa249e2d696e3357b44f2795729adb5bc1dc6608907b11b7f8ac7493b54875efbd9534ecd6d7fb5af76a401f4a3f35aa85d63eeb1cf719799738f12799d1574913748eadec7150731ce66e91c9f76b1f9cd2ae9b9a1900c6e1f93faab1124e8d70ff000592be2fa3ab75a6d67a6f12d31ac41fc3dc954d6966db81b09d083a113f05949212ab5d8bc5d3762d1a06cd44112e9d0a6db6b07e8f21c23b192b3524d34c9a3a2cbb35e27dae8d082076f827ab3ae74455ba78dab352405ac3e2ed0c878fa55387cc1fe293b2ab03dc4b7e2162a49c2d06bc5fffd9ffed0f4e50686f746f73686f7020332e30003842494d0425000000000010000000000000000000000000000000003842494d03ed000000000010004800000001000200480000000100023842494d042600000000000e000000000000000000003f8000003842494d040d0000000000040000001e3842494d04190000000000040000001e3842494d03f3000000000009000000000000000001003842494d040a00000000000100003842494d271000000000000a000100000000000000023842494d03f5000000000048002f66660001006c66660006000000000001002f6666000100a1999a0006000000000001003200000001005a00000006000000000001003500000001002d000000060000000000013842494d03f80000000000700000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800000000ffffffffffffffffffffffffffffffffffffffffffff03e800003842494d0408000000000010000000010000024000000240000000003842494d041e000000000004000000003842494d041a00000000033f0000000600000000000000000000016c0000028800000005004200520031002d00310000000100000000000000000000000000000000000000010000000000000000000002880000016c00000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006e756c6c0000000200000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e670000016c00000000526768746c6f6e670000028800000006736c69636573566c4c73000000014f626a6300000001000000000005736c6963650000001200000007736c69636549446c6f6e67000000000000000767726f757049446c6f6e6700000000000000066f726967696e656e756d0000000c45536c6963654f726967696e0000000d6175746f47656e6572617465640000000054797065656e756d0000000a45536c6963655479706500000000496d672000000006626f756e64734f626a6300000001000000000000526374310000000400000000546f70206c6f6e6700000000000000004c6566746c6f6e67000000000000000042746f6d6c6f6e670000016c00000000526768746c6f6e67000002880000000375726c54455854000000010000000000006e756c6c54455854000000010000000000004d7367655445585400000001000000000006616c74546167544558540000000100000000000e63656c6c54657874497348544d4c626f6f6c010000000863656c6c546578745445585400000001000000000009686f727a416c69676e656e756d0000000f45536c696365486f727a416c69676e0000000764656661756c740000000976657274416c69676e656e756d0000000f45536c69636556657274416c69676e0000000764656661756c740000000b6267436f6c6f7254797065656e756d0000001145536c6963654247436f6c6f7254797065000000004e6f6e6500000009746f704f75747365746c6f6e67000000000000000a6c6566744f75747365746c6f6e67000000000000000c626f74746f6d4f75747365746c6f6e67000000000000000b72696768744f75747365746c6f6e6700000000003842494d041100000000000101003842494d0414000000000004000000013842494d040c0000000009aa0000000100000080000000480000018000006c000000098e00180001ffd8ffe000104a46494600010201004800480000ffed000c41646f62655f434d0002ffee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc00011080048008003012200021101031101ffdd00040008ffc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00e37a5e5555e4dafea58ff6d19437baedc43c3a0fb87ef7f299ff006da8bf66e3b676cfb6798f35569b482c67c823ceaac0362b46ac854afbb73a5d8f198daf71d85af964e92048f6ad7858bd2cfebf5f9b5fff0052b736a3a24034c08502d4584c5a9a5345acf6050637de3cd1dedd0a88696d8ddc2083a84c296dd78ef812368f3fee53f499cfd29fb92b721f30cd83cde4ff00e7b67b909c1f61f73dee1fba3d80fc63f48a5f4861a9cbc1afd544638dbed209223e0a0c92022dcca5ad35dae6541fc824027fcf3b957766e256df66fb5ad1ab98c2400206f7b9db7da9a48259238e4056ec72ea759510c8dfac4f1a8da878b41a696b5dab8093f342bfa95fb4baaa406ed0585e77123f79cdacfb1a8f8d91ebd41f10ee1c3cd0d126c32210dc118a138688a9ffd0f396c9b5a26248d6255c275f1d55267f3ac27890ac8727e3eac3906ceafd5d184eeb148cfb9f8f8fb6c2eb6a67a8f0430ec02b35ddf4bfe2d6c5d76df43d0b8ddbb2acab247d9887578a1e062f50653fa37bfd6c7fd2b99fe93f44b9fe8af23a9d5b792db40f89adebacc321f9507dc3468ffa4d48cbd623ddb1831038cc8de84e8d5656f7b729df6da03e869762d7f66b6720eeb5ada7e96ec7b9ccaaab7f91f6babfd1a9db8af1616d79f43ebf44da2d38d7b41b41fe85b6777a8eff00488d8adfd3bbc0807ee2f6ff00df511c086478426199661cbc5c26bf2dd7318e7b08203dec35398e6fefd5ef7fd2d7f9c561f4e40a8e5b6b36d75826f74c6c681ecb35fa4dd3626d3f693c7837f2995d160e3d76fd5cea12d97371b260f07dbea3bb7f554b8871c493d013f63579888c7388034240ff0019e6597e63dc1d0d635f03d8c73dc1a35ff09b18e7bb7392b2acc20bdcfb8d6d24b9a5c1920fb2af6d5f43e96fb55fc76835d47f920fe0a56b4101bc020cfc828eedb630423d1cd6e00008db5b05adf4c96b64c7e7bc3ec3b9b659f9cf4f93439f8f758e739eff004c30b1b0ddcd105acdacdab41adf6b04773fc156ca6b4e1e607377015cb84c681bbb9feca2931001a0e56396827d5f6b9a3680e1b49d7f77f93fcb44a237db1c17c88f301536645cc1ed7b88267e91fbb77bd5ba5e1ef7b81dcd7110ee09111aff00293c1d9cf942a47c5317098efca83fe8924401249592dc8ccbac2d7daf0d133b4ede0c7e628dd5beb76ef55ce68734439d24ee30e6f297174453ffd1f366c92d8ee7f21470e55d87e88e75fe28bb8fc91831cfa3a5d08ff95f1fcf78ff00c0debb1e9cd06c6be60b9ce33e1b7d45c6742ff9671078b88d3cd8f5d7e23c33183ff7038cfc4bd34ff3b16df2ff00cccffc2ffa2cf19c3731ddceefc0877fdf949f000e4cf3f7943af47b07f2ec6ffd1a5e8b601b4f60d83f91349d0b6438c0c753b3fa821753d03f4bd1b36a3f9f564b7ef162e4ef7ecea6f3db64fe2ba7faa373acfb4506b21a6a7bc3fb12f0f06afebb7e929f963a11de3273f9edefb105c6c174e3d24f760fc88b611357998fbdaf557a79fd529f26c7dcac59ed351fdd737f2b99fc54424e811aac1d0013d8b894276db5b9351902c60698e750f6e898b883fda3f914262c71f16fe4251e25a46ee4e660535180f7bc0701ee2351a7ee86a2b71598cf7318496eeefa9e7c53f517412ef207ee44bcfe91df14e8969e70055393539ad190d7923d3b1ce11a1827681a7e6a05af79ab711b65cd2e075313ed77f6b6a96461671bee75200658f2e9dc013ff7e41fd9f9e0924093cfbc6a851b61a0ff00ffd2f33adc439a41820e84232aec3c7c51a520b641bfd0c86f58c3f0f57f2b5cbb3c0d96d4ca6012fade48f836cb355c374cb033a8e33c9802c049f282ba9e91d6306bccae5fbc319635e00f1aad66931fbc881eb89eccf8a558663bdffd16e32cf7027b5cdd7faf4c7fd53516cbc6cb35100b41278d5ba058aece74fa41bb5ef6d76b49f689afe906ff0059ab17ae66dd7e5bd9696965236b36ced98fa71fbeeddb50303af665967881dcf67572ecff002899d3d9ff007e95d37d59ceaea65ef7b834369793e50d7ae0712db1b532cb9f035da5e75d86360d7e0ae33ab015be8a1ceb0d836b9b5824c77e14984f05deba16a7327dcf0d9d1c1c90da5ac718dbe20f82b0ec9169686383a4b48823b3a42e71bd498c3631e2daf58748d41466f53acb83997343dbf427da477eea3e01dcb38e625d40fb5dc3682447ef19fb9ca1eafbcf948ffa95955e439cd9024c6ae6bb83e2d829c65383c92d7b5b046e9993e7bb725c1e213f781d8a6ea0e969f36a77dbba1de201fbc2a57e46f6ed7132473da0f6feb27aeddcc11db41f2d138021872cc4aa9b25ca27b9f043dc98bb44e0c34fffd3f3069e3e28b2aa249e2d696e3357b44f2795729adb5bc1dc6608907b11b7f8ac7493b54875efbd9534ecd6d7fb5af76a401f4a3f35aa85d63eeb1cf719799738f12799d1574913748eadec7150731ce66e91c9f76b1f9cd2ae9b9a1900c6e1f93faab1124e8d70ff000592be2fa3ab75a6d67a6f12d31ac41fc3dc954d6966db81b09d083a113f05949212ab5d8bc5d3762d1a06cd44112e9d0a6db6b07e8f21c23b192b3524d34c9a3a2cbb35e27dae8d082076f827ab3ae74455ba78dab352405ac3e2ed0c878fa55387cc1fe293b2ab03dc4b7e2162a49c2d06bc5fffd93842494d042100000000005500000001010000000f00410064006f00620065002000500068006f0074006f00730068006f00700000001300410064006f00620065002000500068006f0074006f00730068006f007000200037002e003000000001003842494d04060000000000070001000000010100ffe11248687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d27efbbbf272069643d2757354d304d7043656869487a7265537a4e54637a6b633964273f3e0a3c3f61646f62652d7861702d66696c74657273206573633d224352223f3e0a3c783a7861706d65746120786d6c6e733a783d2761646f62653a6e733a6d6574612f2720783a786170746b3d27584d5020746f6f6c6b697420322e382e322d33332c206672616d65776f726b20312e35273e0a3c7264663a52444620786d6c6e733a7264663d27687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e73232720786d6c6e733a69583d27687474703a2f2f6e732e61646f62652e636f6d2f69582f312e302f273e0a0a203c7264663a4465736372697074696f6e2061626f75743d27757569643a35653632393732312d656631392d313165342d616364372d386239373033393963363165270a2020786d6c6e733a7861704d4d3d27687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f273e0a20203c7861704d4d3a446f63756d656e7449443e61646f62653a646f6369643a70686f746f73686f703a65656462373533392d656631382d313165342d616364372d3862393730333939633631653c2f7861704d4d3a446f63756d656e7449443e0a203c2f7264663a4465736372697074696f6e3e0a0a3c2f7264663a5244463e0a3c2f783a7861706d6574613e0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200a3c3f787061636b657420656e643d2777273f3effee000e41646f626500648000000001ffdb0084000c08080809080c09090c110b0a0b11150f0c0c0f1518131315131318110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c010d0b0b0d0e0d100e0e10140e0e0e14140e0e0e0e14110c0c0c0c0c11110c0c0c0c0c0c110c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc0001108016c028803012200021101031101ffdd00040029ffc4013f0000010501010101010100000000000000030001020405060708090a0b0100010501010101010100000000000000010002030405060708090a0b1000010401030204020507060805030c33010002110304211231054151611322718132061491a1b14223241552c16233347282d14307259253f0e1f163733516a2b283264493546445c2a3743617d255e265f2b384c3d375e3f3462794a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f637475767778797a7b7c7d7e7f711000202010204040304050607070605350100021103213112044151617122130532819114a1b14223c152d1f0332462e1728292435315637334f1250616a2b283072635c2d2449354a317644555367465e2f2b384c3d375e3f34694a485b495c4d4e4f4a5b5c5d5e5f55666768696a6b6c6d6e6f62737475767778797a7b7c7ffda000c03010002110311003f00e6bae75dac50ec6ac079b46af10442e52754737d4efa75c9f10613b4d6356327e3aa9a5723a96288101a076ba6f46cb7e1d37d4faecf5c388adaf697b76f2d7d73bd8e44bb032e931754e611e214beaf6174ecdca14e75a2a73dbfa0dae1582e8ddfa4b08fec6d5d6b306cae9a6a6dd6d36dee359aad61733637dbbb77b9d66cfea2b30c719441d9a7972f0cc87893596f2214482ba6ea5858777b0d55d0e69717e4e34bdae9f737f44e77b5ba2e7f231aca1c03e20ead20c82132788c57432892084c42928a8e992d8c268534c8526d61f1845665e4d7a36d303b1d7f2a1984c8aadbaceab68d2c6877c3457f1b22bc9afd4afb684770561157fa19d2f1e6dfc852012ea249424929492491f24694a4c906fba6794e8529651797012d13e4a6992a52c9e252490a52c42835ed789699530653401c69e3092964a13a6492b428ed535182829890988524da24960426853214484d214c08494e14484294c4a5b884e92549b5079f04503c50444a38e611086414c28b422008ad500a7f04c02708842f092749142c53274e18e3c0f9a34ab629a11453ddc54c31a380888ac3208031c780a5e8fef1454884e016995a30c68e07cd67e6e969ff005ecb4e345999c26e70f24d905d03ab51ee20b5c391c7745a6f363883d901ed2d681d92c63fa470f351d335b7e524d29e51a5b6bf1f3492f24914a924f0924a62aae7306c160e5a44fc15b28590c0ea5edf23fde8116120b5da03d96b4ffa391f259d3fa423fd780aeb1e01af5d5e0823ca15077f3ef8f01f91308b0b81a2be38fd73e4b471892c2786924b07f2565d64fda60685c227c2795b15800003400404631a448b30029f64c344e9f48579a623c1493729526d64c520e04c274a94c52d53a625252c534274c92964c9c148a0a625248a4826dfffd0f34f48f6d54992c3af055dc40c76f63bb891f250be900e9dd4e4305b0a9ec658d735d0e04169f05d174afac599d3e8b9cdbacfb5b9cd14b83a5ac6ebeab9b59f6ee7fd15cc7a2e07c15ca09d8d2753c230c8627c3b31e584641eefabf56e99959375b834eea28c60fb8b4416d84b1bf4ebf6fbbf96d5cfe7df55b8cd735a0024409f734c2cd65b6561e18e7343c6d7806247eeba3e9262e71d099529c962bb314715126d498a498a6322bb2435492414b39314e5324a5b457fa1cfe9fe2dfe2a8157ba1f37ff0067f8a490eb249be49d24a92492494b27492492b249249296294274922a593427490531d6524e99052c94274c524ad1d93109ca6414b1512a453141418909949342052c084a148a6414c63ba380824423b44a4145980a6026014dad278127c93c2c2540291d111b8eeefa220aab6f69f329c22b0c8200d2ee04a98a4f728c9938456191622b6b7b6a9d24c51a45a9314e7551450a4d29149252c4caa19c3f4bf1015f2a8e70f7b4f97e44d92e8eed1b87b47c5428fe75df228b6fd0f820d1fce9efa051b337870a43cd33784e1a665152f1aa784a13c04941682927f24924ad1d941dc299512929ce1b9a2caf693e93a67c47659fb2eb320bc82d24e83c96eb9ba6baca05c3d361786c91c01a99492d5c6c79b9cffdcf6cf9fe72be3450c7abd3a5ad3f4b977c4f28c02485274bb2509294532784842569630070132914c5152c9939492531493a621252c1454931494c5248f1292097ffd1f3ec7706dad3e7f955bb5ba4aa1241d3b2bc1fb9a0f8853c766bcb761b01e54ab3b4ec8d390a3b80d13b4c3a7491e294821338cfc54427fa5a8fb931d39442d2ba64d296a92144ea9264e39494a2546539e5324a58abdd0fe9dfdfe8ff0015495de87fce5df0092e0eba49248a54924924a52494099ee9d242d09272977494c524e920958a49425082964c9e12494b264e92052c5284fa2649418a62a498a052189098a91514d52d098a942621253128ede07c1051d9f447c121ba8b72ac760682ed49ec8e1a008021459f447c14d4e068d69125499395129cb54a0f0f3018e0df1312a49a5255316b36924b9ce27924ff00df7e8a729d45ce6b44b88085a6945243370fcd05df80fc50acbcb04bdcda87c7ff002485a44539d3ba81bab1a03b8f96aa89ea18ef31507e53ff00900913fd6fa0d4a7a95bc36bc66799deefb9bec4ad708b74b8f9055b21bbda4f27fb94981cd6063de6c747d32209fb926b483b403e6812901cfb7e8141abf9df92bd9741682e0343caa2cd2d1f0519dd900d1d06a901e099824053011452d09d3c248a568493c26494c7849394c929890a31e2a45324a5a13e89d3778494a49248a4a62e311dd3a784c92ad5d93274c9258931aa5a1d5220110523a04a94b264e96a9298a509d377494c1dc19e124e60f22424829fffd2f3b1cab15bbd81575363b4853c5808484eaa4082403ace883bf5520ed5b3e28945367db11dd24cd00987687c42773488ef2905a5494a64c4a2b574a5327494b129a5249252bcd5ee87fcf5e3c87e55455de89fcfdc3f923f2a4b83b09d327095a69497e2914e95a96493c1492b52c925a2495a964e9245052c927ff584c9296493f64d08256894da29426889494c5310a4918414c5310a453792490c1454dca129a54ba4784b949053128ac3ed087088cfa28851d9d1accd6d3e488106970f49be5a277dcc6013264c080a60746b18ee93cd46502cc8da25c5b5b7c5c5543d429b0c55bf208ed58247f9ded6236a11741d6307244f80d4fe0866e3f9adf9bbfd8a94f51b2032baf1dbe2f3b9dfe633da9ff67fabfd22eb2df207637fcd6216b8459dfd431ead2db9a0feeb79ff00a32e41fb5dd67f46c57ba7fc25bec1ff004bdead53894503f455b587c40d7fce3ee44d93af742d700d118fd42dfe7af6d4d3f9b4893fe7bd499d33103839cc36bc6bbac25df87d05709adba1227c144dad1f45a4f99d10b488958360000437c06813ec3f043373f8903c86a544873b5827fac52e25dc0cde6a023749ed1d947d77c7b5a079ff00bd2f4cf8c790097a6d1c89f8ea9a4ae110113ec73c16b8eef20157fb19f5038683c0abdb522344925186c0f34f0a509a125b4a4c9e3ba628aa96298a91f1e3cd57b3370ebfa7733e00c9ff00a3292a92984c563e675b7ef2cc480d1fe11c353f069fa2838aeb2cadf65b73dc4e85a5c7549205bb8e700092600d49f255eacec5b776c78f6733a7fd52c7bacb5af14d6e21ae6c6d9d35e7455eb6efb36b8ec1dcf824ae17a7f34a656762e401b69adc1d0200e785781d120b4b3494653cca285e532413a495944eeeca491494c4a674c2770910128494c1a0fe77cbe09f94e5324951507981c133a40532a2525312234f049391d92494ff00ffd3f3b9d5383ac28a44ea9dc6c74a3ca90771f1513a851984ee308316fa49c6d2241f91e52313013c10c442c979a5dd32368a5e524dc279490a4c91fc12d12b4d295ce8bfcfdbfd51f95539573a18fd6ad1fc8fe2812be21d94ea40251a216bf8568494a12846d54c53c278492b45314daca9426212b45314faa74f092a98a50a49a12552d09274a10b55314ca64268494c484ca4992553129b95221462102a60e0a10498027e08a7545c51ee77c100825adb5cd30e0414ff0082264cfdb2a6fe6bc3cc7896b77350ec25a4224281b58a95674519536709a0ae21b153a34447b77b0b64b6472391fd541670885ee03da013e253c498c842ce9f8a0ee7b3d57fef584bcffd2f6ab21b020683b00aad9966b7343c81bced6e9dfe4a5ea58e1a49fc023c6ae14e4b5bc98f8a89b59d812801961f06fe254c563b927e28712e110c9d79e341f89512e7bb43b8cf8e814dac006823e0a51d90e25c004418ef26fc3552f4c77d7e2a70942169a610070212f8a914d095a964c87665635426cb1ad8990353a793554b7ae61334ac3ed3e4207dee4ad345bf092cbafabdb7efdac6d41ba89f713f9154bf23a8dd78aaab1e773676b7dbc73f476a569e034eebdecac4d8e0c1fca207e5559d9d8e35613601fb8247f9df45648e9192f3bae7804f249928de87d9eb0c0f263bc78a56918fbb3bbaf31a4b2ba4b88312e31f800aad9d633dfab76d63f923fefcfdcac606356fb2f7bd81cede20b84c489567a8e36cc5de23470d00f1d12e24fb4d07df5bf97b9ce9f32aa51856580ee1c726440459e4ab588eb5b538b181daed92782e21a8da26000d467497b6c1bac103533a7e088ea8faa6add07480d2d1263cc2b368b2a78a834bcc6e7469a4a0b2bf76c30e7bc8f5ad32036756b1ae46d8ad05d5e356e22d371b0181ab7b79ed55f650786bcfc48ffc8ad1c9ad9bdf57d200073743327e96aa992e69da1895a6d7c602bb03d8c823b924fe0b4b1ed7bcfb8cace69bb9221bf057310a56821ba9d47b290e11b5ab84d3ee88524ddd2b52be092413774ad2aec99394a01d12531488489ee992528f8a62924929894922524ad34fffd4f3beea2fd0a53aa8d8751e682d5e5314c9b84954dea016d50e20eba1f25395505a6c833b761110ada96058a63554c2494a629eb14a5da1453ce892945248994c929455ee8409cbb47f23f88547b23f4fcdfb0dcfb7d336ee1b76831de7c1c815d0dde99ac2a42b596cfacace5d8967c9c3ff0022a6cfacd8ce76dfb358d3a992e1d9368b38a7485652f4d523f58711addcea6c8e4c413ff7d487d66e9ae2d6b6bb4971ee1a3fefc524d377d34de9f92ae3aee0e9b996367faa7fefca47adf4a609b1ef603c4b0ebfe6ee4ad5c297614c585419d6ba45a4ecb5c639f63933baa74d9005864f1ed776f9256b78590684fb4a13ba974e66afb760f12d77f7271d57a57fdc96fcc3bff228da38526d4b6a88ea1d39f3b2f6ba39807fb93fdbfa70fa590c69f0263f2a16ae15f6a896a7fb774d3c6555fe704c32f05c25b7b1c3c8a56ae156d512d52fb5e0c7f48abfcf6ff7a8bb270bb5f57f9edfef4ad5c2c484c93afc61cdac1e3ee0817e6e3d55bac0f6bf6890d6b84946d698a629a106acca1f5b5e6c63770060b8489ec9ecccc5a985efb040d34d4cfc025a228a4f827aedf4c9746ed3851adecb582cac8731c342127e890410cf2bd07d66eb370756d2f691d886aaa5fbabae7717c02f2e889235db0a79bfd0ecf3ae3ef1b52b99b78e38fb929222a03408958506196a231317a56f014c050695369456d356c1ea751633b535979feb3cec6ffd06ab21ba2af8defc8cab8fd1de180f931a1a7fe9a23f33159f4ac07c36c9fc895a444f64bb74d13c2cc7f5fc3683b59639c09110071e7280eeb997618a2803cccb8ffdf505dc25db0127399589790d1e7a2c2cbcacb75262d7b5ce221a34ff00a98499d3afabf4f73f7bcc08249e7cca16bc6336eabfa862b468e2efea825513d7ea739acaaa712ed37388007c9aaa171aee8830471f7ab7d2f12af49d2d1b8ba37112469d91b5fed22ccea39ad6b7d3706b9cedb0003cf1f4b720bb0ba9e47f3f63a3c1ced3fcd0ac36b9b58d70922c69f983aad7ae90ee44942d3ed870dcc86be93d8469f0d558c2e978fe856e7b37bdc249274d7c9472d9b32ae60d3527e47dcafb32b129635a5fbf6803d827b7f9a92ee16b6662b69a4383435a1c010d1e2ab60b0bb30389e18e1f915accea755f51a1953bdc47b9c469067b6e54aab1f8d61b184176a2089052508bb6ca06d98d56775568aec69e25ba0f812a6deb193b636d6d3d8c13ff007e4235df94ef56c77b8fe71f0fdd0dfcd6a491036cba5baa0cb37bdac71702038806239d51fab5941c07359631d612d86870279555d82f90e0e0639d0a8bb03da5d616ed24486e867f9252518d6ae7d5e99b007924032e8e001cab740adaeb411b6a7905a78d41ff003be9287d92b63c8ac389832e718007ef14ccb9acda225ad6ed6e9a69f9c110d7c9ea3a2d922b707d8df51b6bdd0379edfd45369aa9ac3e0b81e3e3fd50a45debbcee823c7820a2d55b697001a1e7f95ac78a780c24d227e59f586d64b791db809db63ee276d60478b6558767b9901b507098747b627e5ee6a8fdbb2b5db48078d777f7a752ce33d9af6fda85760d8432353b7b7c5c878bf4959b8e6beb7bac680dd867dbdbfb4aae3e8e4dad578361d04ed510a41390bca4980f74ca7494a48a496908256f926f8a74c8a949bb27212616ee05f25b226398494c4a8eb21c0c169907e0a76868bacf4ccd45d35f8c7815041216741292452494ff00ffd5f39e546cec9e754d6f6082d0b01a263012098a412dc6e3801ae23900a28e1353638398e249600010391e68b91639c40905bd8c007fb45aa68b04b7469194da7294a72da5274ddd3ca4a59248f2924a641755fe2e69e977758ca6752a5b755f672e687b778690f6fba04fe6ae525749fe2ffaaf4de99d62fc8ea4ff004e97639634c174b8b98e0df67c12e8574777d2874afa9af01c31f188713040ee3fea5733f5f7a1742c6e9b56574baeaa6c1616586b24c82d27dda9fa3b56b657d65e8cfc7b1d8997895982ed8fb09713cfd1f67d2589d6faff0049cffab9974bf22bfb587b7d0a6a25d3afb8fe76df66f4c37d4fe2cd022f407ec713ea3f4dc1ea5f582bc4cdafd6a4d7639cc2480481edfa242e8bebcfd50e8dd3ba6333b028f49ccb36bc071208735db7e94fe735731f5373b0f0badb6fcbb0515b2ab0073bbba06d67f6bf357a17d6a662e57d59c97d392cb76b5b6336381048221ba39c85af23516f90931009efc472ba3fa9ff0057b17af665f8b7b845550b593dcee0c771f15cd1ddbc1709d674f35d07d4aeaf574aeb6dc9bde28a1f5d95bde5a5c35f7325acdcefa6c41718b6beb5fd506f417b2caa0d170d083c387d21aff59ab0abe9d956629ea21b38f45be8b883c3dcdf50348feaaecbeb77d6be97d63a71c5a8b9d756f0ea9fe99682221fab9dff007d543a2ba93f523ac0b0086df5b9a7b87c31ac9feb2368a206ce2f49e8cfead96715ac7da761b08609236903fcdf72d63f50ab69f7b2f67c587fb92fa89d4f1fa775ef5729db2ab2a7d5bc9000712d737e97ef6c5ea23aae2eddee2e6379dc4691fbd28715208f07c5ba9f451d2f25d53092c706b9ae70826679fed046e9fd069ea75baeb5c58e6bb60000e20387fd52eb3fc6266747ceab19f89915dd955b8b1cd61dc76113ee23f75c87f5073fa15185938fd55d4d779b77566d1cb76b5bed7ff25cd4ad35e0e20fa938ae1fcf3c7f642c3c9c57e1596638e6925a49ef05d1fe72f617657d502d9fb463007f76c03fea5cbcefeba0e996756759d2ad1750f6345912407eba6e72376a15d034eafaa945d5b2d36bc1b1a1c440fcef721e67d54af1a93757639e585a4b4b4444aed7a6ff00cd6b3a7e317755155de933d463e010e0d1bdb05adfce4f98dfab8297b4f57a1cd208236924ff00db65c85a6a3d8be714e3fdaec18ee7101f3240e0b7dca77f41aaa6177a8e8689263c3e68988fab1f36bb6c915377073a279044c05a766774f7070366e046a36bb507fb287152650be8f39f600c6b2e69dcc7ba1b31c6ae73bfe8a33f0dd91516d700b08307bf3dd5ccabb14d2dab19a435a65a488007f6bdc9f04135927973b546d698d02ae9d8bf646386edce7c170ec0f92b6fe344cd6894ee1ed29c182418e509c5f8ec1f7b9a11edacb8151b2b366258d68977a65cd1e6df7b7fea55caeb6db5b6d6eadb0070f811b93a98edc2fda145371adf3a1871038476e6d064d6ef52398ff6a866740b9f96fb1866a79dc3c9c796951b305b881ac1e32e773f82648532e31c4697c9ea565356faeb1008ddb8f6f92aefcfeb1702ead9e8b0092437b0fe5d8a7b65bb1fa87e827bab57398ec66d7b86eb36b099e01fe71dfe6a6db29c7d9cfab132f60c9b6c26bd5db2499ddf9db7e8fe72331af3ba0cb600e78215ccbba87631a71f5769ee0200010b15f432ababb0961b07b3491a0f2fe5a16c9085061d3b0a873ae73981c77cb491c02256a33140e341e4216763e5be890d6b5dbb5833a23bbaae411b5a18c71e0c127fe914ad3c1e0d57b1a731f5727d4da3e12b4731d50c6b06f6ef8f6b644920f82a271b22c797969dce32e7bb41aa76e0bb7012d079300a4bf85a8436493a18d0c79f657b1b231b1718bae743cba4306ae3a0ec8d4e2d75b329865e4d12d240305b655b88fec6e547230f6dae25c768d40f924911536db2cb5f91502d0e71803589f352b3f6891f4dda77dd13f72b18ec6b2b6868000e404670d2077493c21a55e15c7dee2377724c9d54ebc367049d3b05a2dae5b11af9a0b06ae3e08d26835aac5a43cc3018f1d7fea915d53403000f92252dd5c6149ed0358ec928206d4ce4813e3dd4ea6c9737cd498044109b1e773be3c249645838955f3d85b8363a60b76c7de15d3112752154ea903a7da679dbff00541159272dce9861fa0e8769de7f382034402d1f49c75f294abb006bb73c06b356b7b93fc94f75f5cc543712757774416ace29cb9879696b81da08f11febb91eaaf583ee3aea3c15361c93a34bab0e2371e34e16962b582901b32dd09ff7a782d69834c85cd67d1af71efbb8507e5651135b7cb852f51c0c1b351e1e0a3eadc1c7f4b63c0ec027dac10ee86fb336cadfb890220888d3baa9468e57ed7d8f6386c70d0c97123f22a157d20984b240685bece254941bc2924864124c91d4a4a5fb262442448024e8021faf53b49ef1f3492ce523e0926d0a4a5440dc5c35e1a9bf8a4489f329be28a695ca4411a249899e50b52c9263ca4929ffd6f383ca6b138d4a67a456862024418484a62825bd59fd18f804b851a89d8df081ca94cf2a68b04b75f548a5f14a7b23685709ff00d61454a744ad4a4c9269454bcab5d2f17ed594fab7ecf6121d13c42a8b4beae18ea4ef3addfc13247465c02f206d3fa1e44968b5863c4150c6e8d65b6b9afb40d9dda3c7facb71fed9274d27543c06b8d46c20fbdc4cf9701404ba40396ee86f0c73abb87b4980e6eb03cc141fb26406ec31120183f79e16e34fb6d9e371556c610f680410e23eff0034e81d0a25107a32c7e974d7664505ee7b3271ad6b244bb7d5e9e537e8ff00c52ac3a335d5576d76968225c089ff0037e8adec3160ea782d6169365aea8ee988b6ab2a8ffa481435c31454f6c161703f2254dc3710586eb2487802e4d980c7d3bf71de3c38d3f930a2fc1c8c5a47a77b8d3781eab07b78fa1bdb3b2c579dfcd580b76933038d3c54728b8e1d5e407e451134c8003a21a7a5536565dbde1d123511f31b546ae9f98fa8458d2c074973b48fe44156f09fa41f056719decd91c1285a400d2aba335cdfd2dc778e760007fd29517f47009d9711fd600ffd4ed5a55f7f8a838816107e3f7a40aa839cde90f27dd91edf26f1f7b916be918ce692e73dda91cc7cf45780307c93e38fd18f9a4494801ceb3a4d207b1cf6f63a83fc10c749aa7df6bcf870169da791e0a0e2263c13494d39eee958d047bc9d75dcaabfa753c92ed34e7b7dcb5ec30a958627e285aa83996535b5d1131c027c51f0800c7888876a3e2142e3fa431e3f91130609b3c8829f12c3987a496db1ba7c52b1bed2a6d09dedf69f829806994b84276c787f1567019e8d8ec2788db2fc73d8d44fd11fcaa1c763bf91e9a174c131f02b4df88cc86b43896b98edd558dd1cc70fce6ffdf9bf9ea784746bc8ea528c4160e35585f58b0df4318f221a4913e6ba2c6b72f18019543ae60ffb518c377fdb98dfced7ff005af59677d6acec0cae9f53319e5f632d9730b1ec206d235f558c432c07092bf048fb911dde42a16d8fdae32c1c03da755786143839cef6931b42af8e3f4b3f7ad5734fb41f1055474c45ae30e969dc04b8789ec857e25448225a5680683a78f743b5823cc1429780c595b368f6ebf252f4c06928d5346d05270f69f14694b1612c9f828b6bfd2234fe87c3851e1d3f7c22a2cf0716bc8ca7b1e607d9f21c0cc0dcd67a8dff00a859f995fbc18e3956bed2ec7b43d83e987d467c2c63eaff00bf21644b89d20813f7226a96806cf6d11347b5a3fd7946893084d0741e611a25d082e4cc81a1f9aacd001b3cb8569acf11083b67d403c5152d5e801f349fb8f6530c83af23849c3cbe69202201c1a49fcde542afe723b1456eb3e6854c07cf872825b0e68edaa0e47a4dc579bbf9a006e91d95976834e6556ea61a7a65f1dc0f94105398e7b172ace9745803e877b0f9c8fbd0fec9652e04309dbc16c73e7caad51b2a3ba97961ef1241ff00a21aac37a9dcd31635aef3e0fe081b0d5b2befb368d363c1921c0969feae9ed506df9624b0384e848223f1471d52b3cd6e1f083fdc8ccca659c03f3052123d9610d56bafda43ad833cc8530e9d5d639c7c042b0322b3f9ec1f123f8a9ceefcf61f87fb11f73c1610d53bb6ed631ce27f3a440f8aaf58872d138ec7e861d3e5fec59edd1c971da62342dc670a5ca8b384faa702b4b209264a5142d6343d85a7bfc903ecac3e3a19563e0a25ed1c903c754970649905d998cde6c69f819fc884fea58a34dc4fc01494d9709e7b24a8bbaad238638fdc109dd59e7e8d600f125053a72a25659ea396e30d81f012a273b28104d9a8d60010929bd9397e89dbb7711e71ca4aa645aeb01b1dab9f0e3023521246d7568fffd7f38099fc243949c9a5018a44689d24828b718c8a9a491a8102754926580d0d112606a9a54b16192f2992493d6d2e9e74514fd9252a534a4529494bad1fab9a7531ac0d8ed566cad1fabc47ed31227d8e4d96ccd83f9c0f4394e8aec3de206aa58edd8cad92623512819324ec69905c3f2ab004981a1015625d20c187f477731b88843649c8a678dd327c94e9fe6ac27f79da28d0375ec33c027f827c0a8ecdfa5edab2f0adff00479743be5bc34ffd52bd9340a73736a221acbde3e44ee59398fd9539ff00e85f5d923f92f695d27546b3f6ce59e5af2c7e9a8873772b503e9af36b4c56607bc69e76e10f737b713e2157b21d8623f35ba4792b7943f48e0044fd18e2157ac7e81cdf2708f3d541919a08b049dcaed3a5d1e3aaa3827e8ffaf2af007d761f8cfcd31725ad9a98f1ee87606faa34e51d83dce6eb08393ed756469ee8fbd142c036434f79952af6edf9a78d7c7cca6601b4f7d502a0c6c1a13d90c81328ae23691e2847400f8764d2bd8bf89e152b7e918ecaeba2151b44174f1e2820b9cf32ff000f347c0e6cf0910ab93eed7c559c110fb879b63f14f87462cdf216f3029b87b1df0516a91fa242b01a253f498207cd6ed0d585d1b5fbcfe45d06385671fca1ab93e62dfc668859bf5d1a5dd15879db737f16d8b5681a059ff5c9bfe413ff001ccfc8f4b2fc85580feb61e61e071ff9c0795a8752cf3fee59b40fd205a91f43fd7b1541db0c9b33c69e086f997091c02883e94267b24cf911fc524b3adb2d89d12da356f6fe09eb0623c53fe722859801c7713c803f04c0788e14aafe65c3f92521f47c652534b30fb1bd80b1bfc512e03d7d3410859e62a3fd76fe5562e0378274dc122a0d698dbf11f7a38001fcaa36340607b7b912a730754929dae924c7640691eada3e1c233093a81a1409fd62cf82210c8ccf97e29dc34f819fc13013acebc84eee0f9a480c2b07c7528158fd341f1561ba1d394166992e1e7a20b9b531c76eeabf5005f85783cb98e93f0d55978d246863540ca6ce25f23fc1ba63faa9cc72d8b81fb3e90d24871812092ab328b0b43b680d3aea40577d676ddd0c01c276978e48559b454c1efbabf1d2491f724d7217a8fa2fdce737831eeeff00d9dca672a5d3b9b224c413db6a1938a0eb6c8fe4b4ff0014c6cc3689fd23bb8d1a12056482e3d1edb9c7c600fcae565ad2ea37d75eb31b9c1ae1a2a8dccc71c52e27cdf1f8355be9f98c7bdf8fe9866e1b9a64992394f1458a7605a81c93fbcd1ddd5b8b63fb3f45087d245c8b726bdcc6b5a011a437541699009e48129b28808c449b6e3385250af56a794828b0bdef652f783ab41202cc766e43e62edbe511ff00521cb4ef934d83c5a7f22c008a9b21d758e8374ff68ff721160d77580fc24a6ab4793e00a804929db8ecdbbb7120f688fe2a26b603c38fcd169e1a0ea7b0473549da079ca6195269a65903e87df2a3b9c38007c02d1fb3b7d368235e554b69da65212056a073dcee4a83b43e68db01881af8215cddaf20e847211b506c873becec204ffb1252c4fe8c0f6692124ad73fffd0f3648a49cf09a85931d0274c520a2daafe80f804e99af73aa6348fa234294952c588eebca49b94a5396ae4a7515207ba2a52694894c829757fa0170ea4d2de76bbf22cf57ba19ff2937faaefbe1367b165c3f3c7cde88805e01ec674476417389d3411f1510d86cf73a26d4033cfe5558ba418547f42f3e2e29624faa483a340fc4a5448a4c8d0ca7c5dc0bddf01f72744a5967eb8993cff003649f915bd76e76532d76a2cc5c77924ff00c1b2561e602712f111fa377e45b27f9ac471825f838e47898606ab103e92d7c9fcec3fbb3ffb873b343fd5df3f4a74ec21030bdc7611cb8cfde51f34fe924fb4f769ec557c2706daff001698fbd453dd962d6c410f2df031f8ad074fb4f6075546a046458df0791f8ad0225847920129c7d291ae88196096823f35ed28e35635c3b842c98f4df3e133f0d5152ef307c27bf9a8b7e938273ab5a46a34d146b9dce23f140a82cefa712867c11481b8c8d50dcde41e130ae62ffa3e10550c930d72baf9f4fce551cb240726a9cd11bc19d49d42b7843f4969ef23f2b9526c174f799055cc31175cd991a19f8a920c397e42de0883e89f8280e511bc1f82b01a459f44fa64799fc8ba3c695cdf46316bb4fcefe0ba5c53a2b78be50d3cbf317471c68151fae027a0587c2cacfe3b7f8ad0c71a2a9f5a9b3d02fd261d59ff00a410cbb2309fd6c3fbc1f3bab4783d96a0e18b32bd1e3c56983ed678cff0543abbcc80d7e094ba123c948920413dff002a4a48d6f00f876484ee713aa9190446bf05103ddaa285540ed227b1511c0d3e6a554890078a8b7e88f8c4a4a6a7501fabbf5d416fe5566d022b33a16855f3c038efec7737f2ab160f6564ea3601f825d5410d9fcc9f091a2913f724f60f49d1dbfbd4806eed47082e4b5c003bf8a03bfa4bbe08edd0813f240748cb74f74e5acce8d1f953b819740813dd2735b035e7553ee403cf3e08ad0804cea791d9075fb5113cab047bbf2c2aef01b95e5a26af1b36dc096e927e2a1736712e04004b1d3fe6946d76104f03450b1938ef07bb489ef309cc65e358c6c37c601fc888dac911b499f009db7e50adac63a1a0401b47652f5f29c3dd61e34edf9102c056fb3be6031d27c8f9f8a97d96c220b0823c48eea1bad772f3f32a2ea8bc0933aa48293eca2752c6fc5c0266b195582df5ab6b9a65a267f8219a6b68973a024e6e3f8b8e9d93816293a7665b4d7bc3a770911307fcd5558edc03888ddac2162dfe912cd86ca8ea5a471e6d46dcc7c3ebfa07808c8dacc71a245366bfa2a5dd42b98534028ace12d23c442c000f0ba05825bef70f0247e28a14cfa44f684d5b24a98add04a363d25c65c76d639724429769afed4d6b84b5ad97423eea9d66da61a22378074f2f725454d00bf9ddc7c0ea980717920ed0d1cfcd467514b9292f6696125a7404803541bc0771c78a23eeadec1243ff0074f9f8a1543d106d2df51a4f04fd1280a410b62e2d8eb1a60c76557360dee333275ecb42acc2e3eb1fa2d92076e21665e439c5ddca7a025c43143a39de3f22496218a2c235873744905cff00ffd1f36948ea084ca43829a85871aa4e0004c913212514f55b63abdaed00fa263952994165eeda18ed5ad32d1e08ad208d1480b1cb75e53ca8e8124e056b294f20051491b552e9924c97552f2aff0043ff0094eb9e0877e45415fe85ff002ad5e10eff00a929b2d8b261fe723e6f54e1e26546c8dbc723423cd4dfa1f1843b346cf92ac5d20c6afe607694b1fe8074724f1e0a2c918cdee63f128d556195340d4a31d52be4b7f56b5be35b87fd15af5be31700133fa8d1a7c068b33227d378fe43bb7785a0d818dd35d264f4fa6479ab38fe597d1af97f9dc7fe17e4d3ca337cbb93248e6155c7fe7dede351f8ab1701ea033ee04827c557a41fb6380ef12a29f4668b1734373ef1a087c8f81d55c6770554c86c67d93df6bbf0569ae323cd00929ea1b981806ad2a1967d8471edfe08b582d74cf3ca0e47b8c7de8a91d6e26961ed1ca9090e81acea9571e8b63802004e443db3dc140a98bcc11e7c7c546c91f30a6f6ea344cf00f6edca614b56cd193e202a39c4ed3aabf688acf9059f9d1e9933de534a9ce6cc881a2bd8a3f58b551691b8807e215ec53fa63e6d9fc42931b164f90b74298320a80521002b01a4597483fac11fca0ba6c6e572fd24c651f8b7f2aea317e9056b0fca1a79be62eae32aff005944f40cb8ecd69fb9ec5631d47adb77744cd07fd113f710e4b2ecb317f390fef07cc99fce0f8e8b4d9ab1bf159add2c9e355a14906b0ee25c167f57a01b24333a277891a76d52260c04e44820f242704243f9bdd44cee8e09eca6d20b1baf2a33eed4109295588791e3aa8b07b01fc3cd119fce4f92856391e04a4a2d5ea0d271ee3e0018f9a30938f51fe4850cb04d37edd3f46654e876ec4a40e635fc52eaa0c5c3f44ff08489e0f01399f4dffd52a24c86f8a093b26afb73a203f4cb3dc46a55869f688d20f08176b95f0027f14e5ace0cebf7fc54888e34f229a7582343aa7e48981a7f0490c3598f032abda23247c02b05d27cc7755af3facb74edca0b86cde7006a24888113e6a0f934b8974e9f0d614c4966a4081a79a8bcb85507820fe44e622f26cb280c01c1e5e06b111dd485b4f6adc48ee5c07e4433b20fb84eba7dea3bc34ea41f84a058eb548eb6b3afa23e6e2533af86fb6a6033a08254377802544877869f02920c54726e6c90dac7c1bfde53fdaafe0380f80099b513a707cf41f89451856b99bdac241e08820a218a5bec87d7c8ff004840fb87e08f8dfccb7ca47e284702c9d587ef011eaacd75869f33e3ca450daac985350a8e889a221615bcd62db0dc8b7c9c7f2adaf258b9a36e5d9e667ef0912a01356fdfed68971d07cd59763b6bacb6c1bbcda4aa18f66db1aef0705ad64bb509864554d7a5d51686d64b6746eef1299a5b5b3d2b4812435cab9a1feaed0ef603200ec8cfc76b5c5ce6173bbb8f8a569a5329ac435a676e9282ebdf5641206e669ed3dd4807176c02414ce606bcb5f11dbb908292da5b61870db590363591c2a997436bf732761e67b23418219d8685dda102db6d682d7443bee4eb5bd59e08dccb7cb69fca925d3ec0cf547881f814924bffd2f343ca9b4882a1dd4dbc14c4313ca5aa47948f08851486b00348d640242937cb94cdfa23e09d4803196524884a534a528ad529f6504e65152be094a64b8494bcabdd10c754a4ff005bf215415ee8a40ea74122449d3e45365b164c5f3c7cdebbc3498e3e683713b7c202281a481047083913b27ca5569174c24c766fa983c35fb91cfd213c7642c46914cf7d34f922cbb4d741cca7412cac1208079063ee5769dcee9fd25c352ec1683e50e73068aa91ee1f056318c746e96e81231ac6c9f16db60daac43e5935f2ff00398ffc2fc9a1798b35d48312855388ca26396a9d8e6b9da804a856efd6a23f35472658b3ce11980c4ee634fdc4a335c3688d3c02875273464d3a68585bcf81ff006a7a9c768d00f0d354d5cd90fd471f24377b89d53ee248d3e709173b71024fdc1394c681351113b5c41fbd3d8d77a8dd0e80a559237b4927dd204f88951b012f07b7640aa967823c93913cc79ea876024792624c68627cb551929636801864acecedbe94cabd60f61075e4aa3962689efa26f557473011b89fb95fc532e6ff00c58fcab39a7523c42d1c4234f1dbc2931eec397e42db4f3a405152ecac069aba618c83f2fcaba8c777b9729d3cc649f87f15d45065df356b09f4b5330f517631cf089d51bbba466379fd059a7c1a4a0e31d42b39baf4ec91ff000367fd4b91cbb300d243cc3e58603ccf2afd1ad2247047e5545e21f1d95ea0fe827c167f57a3095dca98d76a6efca66bb823484505257a003c09095861f332d8d0f9a4c3161f8fe5095a3dd0348f0efe68da17646f0545a76bac1c90ed149bac2870fb07890754828a2ca07d3b03472c773e613619270987882613dd304788234f82860907a7b3c5a75fb8256a01299d8ff81e7e0853a03d823b88d7e05561f45a3941736a7408171fd601f2fe28a0fb3e6250afd6e61f2456b3dd240038fe2939c6754c637983ceba262e07e68a14e266557bc9fb40f80fca8ae201e502f70f587904d25701a37c1f61d7b685299602791a107851adc3d2dbc84e605533cc88f24e058c86a574d7c8adbf268d75527d7ed243441ee00852afe881f8a673c091303b7824821a7581ef07c4aaf630784f9ab2c8de4f9a059a38fc502b5a763180f10af613670d8d1db70fc4aa960066751da55be9a7f5603c1cefca80593d98d953a508d07c55db5bae8824275301289acdba2785229910b0adf058fd4c46538f88056cac9eaa3f4e0f8b7f8a454d5a49df039ec16b1bc0ac174b49d0ac9a2d155a1c751c15a42daaeb1945643837dce30992096c3182a63ad77d22263c155bad75a619af8bbb23e459b81613122151759e9541a0c9f1f8a51d90a7bc5646e32e1a48d12adccb88130403223530aa17171d5169b856e0e2c69f12de524a6225bc9688807c4aa8f24fc95a7165d1e935db9df9a0499f9283b0725a09b19e9c726c219ff564228574d2c17383f405bcfcd251a88a5e1edb18fec4093ff54d6a48a9ffd3f33ee8958963cf801f950fba256406be792047de9a85944f0a5d931e100a29e1a03635d04fc532716b8b47680025bcf700a963b3195929eca404ea5b03e2910dec515ac4271e09410922a524992494babbd1cff9528feb7f05482b5d2881d4b1cff2d365b165c7f3c7cdec5c481a6be12abe4ff364f3a2b2e70881c8fe2a964b87a0edbd82ab274837718450d1f00517491e650f1bf9a03988952321c244ea9d8ca4a7fcf1dcf1051716c07a1f4eadb1a372187c7f9e7bbfe8a012f739a66384f86f77ec6c46bfe8b6dca688f2b7f3959c7b49832fcd03e3fb1ad67d38f0d50d9fd31a38f6f3f3447c1713d814269fd701266584428a6c914fd589f5a830435d3af9a554811c297566fe82a7fee3c007e2a149e7cb841716d4e8239e3451699b0c98f2516fd02957ab89454c9a00bec8d346fcd45e7c67452922d23c40fc146d90275d104b0b3e1a85031fec28b6081aa10e0198f009854c2dd1a4f0a85e3f41f2fc8b42cfa249fc151b8034fdff009537aa7a38fa077b7e2b4314c969f0691f8acfd27f8abd8ba6c3cfb227e6a586ec193e52de09fb2802654e54e1a651e09fd64f8c15d4631d572b87232a3beaba7c63242b38362d5cdbbb38c78576d1bb12e6f8d6ff00fa972a18c740b45a26a70f1691f827e4d9afd43e5568f7fdcade31fd0904fdcaa640f70fbbee56314fb08ec02cd25e8c368912252e4f298ea1304549438ef91e035f8277387111de54236bdbde427b66424a67599128649f55fe6d0a6c1a01d940970b8ff57f224a2a20189e2235f355fa699c42c074042399d1b1cff140e963f436003e8bc83f7b82280d976933a840681b44f2ac386b2155dd03cd04a669d081f343bcfe9ab27829eb3e254322375641ee8dad48fe7db20f7439267b9f3537cb8f309836069f9524227308e7ba0e413ea8ff005d11de478c7920646af690505e1b9496ec04c94ee888899f141a5c401aa313edd2244a20b19603888d64a83b59d13931e2131100a286aee22d703dc4c20dda931c29d876da41e08437cca0b5aef2003fea15ae987f407c9e7f82a967fb82b5d30fe89ffd731f70482c9ecd9b020bbcd1ac417729e1aa5894c4244ea991428aceea35b4dac73dc18c00ee2753fd96fe7396812b3bab8d2b3e642090d5393446d6e3b4b470e7125df3dbb5aad74c349758fdbb081020cffd177fe496612afe232c663ef6c4bcf1de134ea9a4d7ba490cb1a41f196fe0e556fa8b8fd36081ddc3fda8af7b29606dc46f3a91caae5f86ed65c0f926dd694aa4b4d01befb4d659ddc5fa4fc93bfeccd0eb368793f406ad67fe94b3fe82059763ed21bbdd3c07713e285eb83b7736768802612d52e8d363db59b5dfa267615c57b8ff0067dce542e04d8e91075d127defb5c09d00d1a07011eccdf5190e6343bbb80024f9e89c3c5690d46f3a981e29298b1c0cc023c2124554ff00ffd4f32ee88d3a3bc210d4d9c1fc134a02e0263c252913a24145331a3689f04fb9838e54013b478a5254818caf249d524c9228a64091c148925327490a49304e95a6970559e987fca58fe1bc2aaacf4c31d4b1a75fd23503b164c7f38f37b32d68618d08d2554cb115b8fef7215db03834edefe2a96737da7c044aab374874742803d06fc025067be9e09a96c52d04988f82983eef8c2743ba521fa4cf0e10f1de474aa86ba64e5e9fdb63bfefca676878883a7c50a9713d3c01a06e6650f9fe84ff00d4b959c5fa43c183368719febffdcc918d5a499f042748ccae7c0a30d09f09941bcfeb14bbbcc69e6a29ecc916f75413872de01040f30aad0663c08fc55dcd7138760220468a8623b756d83ac26f55e5b71a18d3b68a4c69035883a28fc548c76fb9390b0116b5de208fc895a006ebcf29dc0cd7f1223e4546d024781ec81529e01611cfe0abfe49d4ab2e13fc157f1f194c2953fe89542fdc2a20f1247e2afda46d20784aa191fcdbbc894d538c4c13f1d15cc33ece78d1527133e3ae815bc498d74e54903ab164f94b74132880e8800a9ef006aa78b4caf408cb1f35d1e31d47c02e6f1dcdf58d8481b358ee7faab571bab365ad652f738c013ed1fe73958c320376be5893b3d3e3765ab46ba78ac8c470731ae041075d0c8fbd6b631d47c54d936699ddf2ccb6edb08e20911f02a58a7470f2214ba880dc9b87eed8f07e4e28787f48fcd661dcbd1c0dc41f06f76099c784c3e837cc2633df4d524a579835ff00af64ad79903f7933e76b49ece1f913ba607684ad4c986428587f4e3cda54ebfc542dfe7987c8a2a59c4c8d3ba1f4d3032191a8798fbd4de782a18122dca990371fc434a4aa4cef8f7d156d615899782ab13f4a3b123f141492b988f251c8d430f9a934c342864186b4f811f95155326991aa45c7e729871ca61fc515ab3bbc20e48fe6dc477467f97cd0b246eada6635894d2b824abe8881db9539001d3942ae7637f15376e8f228ac2a71e473e299e473f7f64ee235f0d39507c94ad0d3bff9c07c0e8a161d4c70a793aebdbb421b89234e022b4a1701ca3f4d30db07f281fc15777e08dd31c4bad1e6d3f9500c73d9b96a0b91acf340213c35a4c5314e9bba2b56547ab09a58ef077e50af4aa7d504e313e0e092438e516eccbad635848019c468824a64d5ca738bb57124f8a648a4852974828a7454cc03c84b7289793009e12949491865e03b8ef092183aca4921ffd5f323ca933ba829b0f29a50174c66123c2694028a6683b477d12884fc35bacc84ca56352497c12494bf74924a525320cee4c13c04c41054996303c39cddc1b040ec428bacdee26393d915291f01d19d41fe5b7f2a0046c2319b447efb7f2a69d9743e60f76eda78223b7c167e698678ea00fbd683f686988f2f92cdcd2486c7ef055e7b174e2e8d5a30c0fa20273f4a47dc526c061120123bf924c04eb3f03e69d04a5900b78f09e1556bcfd99ad1c1cdca3f736856f6efdad3cf0a86ad65409ffb599507fb342b18bf4bc9afcc7f93fef8ff00a324ded9078d7f220df21f53b9f78fbd199a375025a5032fe953274f5079a8a7d5963d1d3bdbbf11e634da4cfc966613bf42ded016a925d4b813a6d3f7c2c6e9e74d87b73f7a6f55e5d2693329e65d03e6930989fbc25c3fc53969dd573a3d39ece03efd135b1b9a079ca578dcc1e4419f9a7b1b0e1b87c3c35492193c48823882aaced7b80e55a79e3be8aa5847a87b76909852ab2208e64154320cd6e3e3aabce2620f9aa56006a703ca6a9c4b34779ab588ed0cf2ab5a7de47747c53ed3aa7458b27ca5b65d0a05c53129013a2983524dfc23fa08f32aabec3ba3778688d8ae2c6ec89d6410ac63f4a16c17b834f8c49fca14d004ecc248176f4bf579e5dd3aa9ec5c3ee715d0639e161f48c718d8cca03b7ed93b8e9c995b747656a43d21a590832243e6fd644676537c2eb3fea8aad87f4f9577eb0b63aa66795f67fd51547148deb3727cc5dfc5fcdc3c83799f41a7c933b483c0252046c1f824ed408f14d5e92d3fa31f16a9b8881e08769fd0f9c83f7224cb63807ba2a557024779e5432080facf7952af9951c93f40ff002820a59c3441c32065643446a1a7fe8ffe628f64169ec557c6da3a8bfc5d50fc2422a6c08dddb455883b9f1e3fc55911b95571873fe25253312623fbd43267d3d753c853690003f828df1b41fb9252e0980622523cf926a8cb013d93974bb5d7e28ad6266543204d327b190a4f8063ef851b8fe81dac79a05705547db1c299e6250ebe204728bf9a675f1482c2c5d22533a08f3848927548e8d9450d4bb98ec50674f6eb08d91c6be082e03423ba4b4a0b7827ef52e9cffd65e3b167e429ace35f9a6c38198238da47e0906396ce9d8642014671f6a0929e1ad263dd24934a2b563caadd418e7e339ad1b9da401f15653183a24a703ecb927fc13bee29bec993fe89df72df94c8526dc1fb264ffa277dc97d8b2bfd1396ea452a55b85f62caff004452fb0e5ffa33f82ddd147b234ab717ec395fe8cfe1fde97d872ffd19fbc7f7ada329b44a956e3fd8b27f70fde3fbd25aee849255bfffd6f313ca933ba8a933929a5017298f09d314028b7c1ac541b4d61b2dd5c66c71fed6dd8cfec2ac794817c01263c1252dac2a4934a7410a0925e690454b07060702ddd221a6784cc907e29dc25202124b208d8a48cca4f30f6fe5411ca9d048c9a8f83dbf952a5d1dc3de384b8f81eca8e6fd368ed223e64057899efe2a865b4faac07e96e6f9e92ab4dd18b7c3039849fa5c077752c71b7da4cb8773e09d9f44eb206b0a4cac399ea4892600075fb93a1bae4ce77e76a166dbfe01dfbd959323b715057c0882e427e357fb3f1ef2e24bb3b219e5f46ae3ee56317e9788a6be73fcdf84ff0064a2c36ea62608eeab6618154020ef07e4ac076ae6f69855f3cc56c274f78f96aa39ec5963d1d60d79a1d1a48e1636202dc8b1bceb2b6688753a9811a2c6643735e38932026765ee9b3e84f0a53ee11c1e5098411a4c02a53e03e0539695ef2056e7786a54de6649ec1072cfeacf1f7145ac87573e206bcf648a82ce24ea4f6557234707711e2ac39e37375edaa0df309a57237cc881a2a8e31bc1f1d15a265a23ef54de7dd67c8a61438d7922d70e4a2e31f698f2942c8d6e709f345c532c3f14e8b14f62d80494560426a330a9e2d5936e800415a78a750b2e972d0c63a895671b5b2757a2c23ed0b5a93c2c6c270dab5f1dd3b47c14f2f95a6777cf3ae3f7751cd2759becfc1ce54718c38128dd41fbefc8778db61ffa6e55a87410b2e7f31f37a0c5a4223c037daedb5cc78fe54ee208d1098e06bf99537911cf08325a573a6a20711f914e62b127541906a30758fe0a608d89299b1d1c951c932c0678d7f1516b92bdc7d23d9252ee77b49e7cd57addb7a9547f798e00f9a9b9c36e85570e8cec52069b8827c34454de7820c1ec80f125ddb5fe08d73a1e7c420b87bccebc1fc12529a7dbe202577d105377e52bcfe8e7ba48b5aa20307c214b8fef43a8fb0053288431b22740a2ed697023484ef2144ff34e9ee0a694855678fca8b10d3aaaf538ed6f840462e110885a55a47c9311c04ce3e09032dd79450d6c899f2e2100881039f347c99111c4ea82e8f9ca4b4a0b244cfcd43109fb5d7db9d3e454ee24824f2854b80c9a8f8387e290592d9d63c2094527da82e29e1ad258a62522531292c5d453ca6494a298a529128a964c754e5465252e98a7ec992428ca684e612450c48ec929912d83d924a936ff00ffd7f304ed4c9da754d2864123c25299dc2414530e02499bc04e9eb0ae92649242e92499252ff04924c8a97953a3f9facff29bf9540295662d61f070fca915d1dc3dfbc8d80b675fe0b3f2097648f370fcaaed84f7303931c2cfb083920ea4ee07f155e43574a2ea30c34c9fb9332011322476f8a4d30c23b933a2839d100e87c53a2125b3b810d6811e24c25914b874cc4b0b816d99f90401d86da99ff7d43dded11dbbab19a1c3a0e03b9fd7af8f9fa6ace11763f96cd6e64d089feb47f13c2d16e96be7411a7cd56ea247a2d31c3c4ab700b8f6e3554fa889c683d9c0f9a8e6370cb13b3af8ee06a6826163da4b7a83bcf4fc569e1ba686f7d3bfdcb2f3da2acd0eecf519e8cb6e9309520e063f2a154e900ea7b4a20fa42235456163933e93811a472a584e9c56127b49f8a8643836974f9850e9cf2fc7fea923ee43aa4247bb503cb843b1d0d33a2959ed827e04a1bcc11f720528898673aaa9713ea3bc36a3920b75ecaadef1ea9feaff0014d2a72b235b0f9ea8b8a7da75ee81944fa851314e8494e8f4619ec5bad3a29b089400ed511a54f16ac9bb5bb857f18f0b2aa74c2d2c67ea14f06be47a2c178da02d8c676adf92c1c27fb56be3d9001fc55a22e2d43bbe7190e25d778fa8ff00faa72aec7183f8296fdcd79267739c7f1284c77d29d2164cb72ef44e83c9bf5387a66380a532090ab50f26b779147611b2505f695a41a8f8c71f2526186f31e5f242acfb549af0437e092ad934ea53da7f464791fc8841e3718e214ac71359f20524db16bc9ada3c90ac316d0ff0b07e3214ea135b63b040c9fa00f66b9a4fde922dd0bdd1613cca1b8fe90f980a590750471dd01e7f49f2092494a0c891dd46e9f48a8071f904d73c7a27f2a286549d005271210aa3201ee3f8a239d24f090431b7e8882998658eefa26b9e4307c142874c8ef09242a977e8da3ca3e108f2003e72aad266b8f328fe1052082b13214811b279433f44f8a5f99f128ad4395f441fbd049d3f2a2e4b4b9a483c2034cb7f04969456cfc1049f7b0f60422d9330816e80418d525927609f69f04229e7450253c35e5ba8a8cf8a5298a4b1794a53244a2a5249a52092947c52949324a5e13253a262929491484a911100f28ad604907e4924e82923d54fffd0f2f3ca76a63ca76f282190e52778a4912928a511013a8eb013ca705a579493274914a49294c929926492494ba4dd1edf223f2a6090fa43e212291bbde39d2df7488075e15076b7b079cfe2ae58e9ac41fa5055327f5b69e36c7f15149d105bb5bc80753f029cd9239e74d540c0769aa84fb44fcd3a2a25b60b7d31e33c2d3ea4cd9f567a6bf6c176658efbcffe62b1c3cfa61a3fd42dbeb52dfaa5d2a03bdd7b9d3dbe93959c3f30faff00d16a735f2c7fbd0ffa71720925eed35d02a9d401fb3381d088223c91c921f3d90328938d66b3209d132637678f46ee03b75401d6068152eadf49af6f20e9f7a360bc9637c1cc1287d480353a7b05091a32029b1de4d6d13dd15cfd4011cc8f154302c0fa47c55c0ed7f8a4a2c32acfd1b59fbef83f97f828f4f258fb6bf0208f9a7cadaef4a67daf1f8aab919b560dcfc8b67d3d80068e4b89f6347f9a910ab6f5e48d41f920bcb8b0e911c15cb64f5bcdc82e2f76d64fb6b6121a3e3f9ce40fb539ac0faae75464cc13c9f823c0c479800ed6f5479e555c83ee91e075f985915757cca1cd163bd76b8c41fe0f57ce4d5757bda7890e0790484c94485d1cb196cd3ccd1e0a6c63abbfd794f9847b7f7872a1887e979c103c518859925a3701536942042902a50d72d9add055fc7b0e8b2da615ba6c8885340b04de8f0edf688577232bd2c0c8b260b6a7907cc34ac6c5bc35b24a1755cf270aca9a7e9b4b7ef567dc022d7e0265f579b639edaa180380132481c72a21974b892d69982392149af1e991db594d94ff00635cd3cc03f1548c46ee80c92add9b1f7d75b8887024ceed3c7c3da8cdb32801ed6c3a7b9f1dbe0845c1b8fbb923b799d5596169a2bddaf13f34b822a39a63ab165b9006df4c1e750ef3dbdd3b3369dcd1ba0b7420e9f9547d415d6e777693f9509a1b653ba01f7680f8269c63a2e8f312ea2db4db99bbdae067cc293ad963be1a2ab55153f77e8da74264e9013beaa18d77d26388d3693f4bf95afd14d38cb20ce0ee1b14d9158930a2f731c3dfab4105df7854eabaedc19ede264cfe308fe958f63f758c68da4ed01d27490cf77e77e62420494cb3428ebd1d9eb14b7173eec6d76d6f219e6d3ee67fd02b35ef1ea08f0d55ff00acaec7a726975790dc91763d2f758cecedbb3618ddeedac58e322b7b806998e41d3f2a528ea57639dc224ef5af9b69ae99f34ad74d0e8e6105af682674ef0939fbab70f194da5d69a98dba01f14e48f084163e247c0a72fd63ef4516bdc46c50a9dcf8a5738161d10aa76d31e2852e0526393ee03c6516608d502876d799ee04fe28d63b4074d125a4ab907588ec981307e3213f04c70470a2d76841450c6d06215561fa43c159b1e0b74e7c5556101f6791456961672abda41691e08cf281691b63bf7416974daef603e4144a8d4efd137b683f2262539824bca60534a5292c2c934a6949142f329264a5152e9924c9297493494915164d6eeeea2664cf29c3a0f924e235722b581e124c4a48269fffd1f2f29dbca63ca76a0865298a74c52514a3809c261c029d15a5492499242e924922a5274c924a5d2ee0f9a64c4a491bbdb9fcc13e6aac8396e8ec46aac35ed2c69e61a3f22ab589b5cff176bf185196f8d836cc807bcf05339c6208e52686fcbba839f1e47809d1496d3482d1ae83b05d1f5d13f537a4b870db1b3f1f7ae60121920cae87acdaf77d44c43b4edaef689234fa567e74ab18cd18f9b5799b207f7a3f849c573bdc5ae891d8aad7ed353c09821275a5cf76eee35f8a858f1b08d78ee993dd963d19e03bf4154f822e64399af7954316e0ca2b93a491f715632b21ae03b82a32c80a0e9af9dcc3ccabadb06e33f095938ef2ccb7c18060844b8ded93a160e7c53524ba57b9a5ec03b3a49f212e5caf52c939b94f735dfa36b88ac790d251f3fa9b9d8fe96f3b8387b818d003cb9639b09323403809c030659f40530d85a5a2018800fef150bc82433f7792a4d734cba0179e07c02039fbccebcc42735d232c2343a81ab53d19258f97c9638fb8031a2134437772544c4e882e05d9b5ac0c05a043bf3bba163bcfaae07bcc26aec70c5d875207e50a1499b1ae1a9060fcc24924b7c15305081529442d299a75476590a987298b21480b1c83a4cc821bcaa9957b9ed89413769a20b9f28991a5b18ea84388059cc687e295cedcc01b3288d3a1513a951db2a9cf70adcc8e6069e4ac32ff00d1b5b0644028014825c49216bee77e9041da7bf653c6b3f4401f194880e6ed76ad3c84db5a0fb442368a4febfa65de6142cb8be19f39417b77192e3f2481703eefbc2569a48e0e6beb7769561b782fdb3b4b67777040d5aaa9b7da2758d50dd6b45ae234d794ad4da7da4f1c086fc9bff9d28922cac13a9831f2d02a975dee7c7746c77456d07f752dd1b6c9198f539a4807e91ee7c1131f1e835bcba410086993f4821e35a0b1de4e2a34591bc19d09fc52a1d94247b967656f600596380227520e89a2f2dddea08001276f8a91b0d8c1b8fe6103fd7e699af13b3f93afde97084fbb3eebbe9ba3dd690d922401af078f9a738f535c76d96166e7377c8edf43b26f548740d768828565e3dc3bf72950ec9e391ea5931d736c223d42d079201894636bf69df53e3b9107cbf3502b7ee735dfbe35f8ab2c0df49c49d4eed23cd2e109f76485d96daced7870737420b4e8530caa438b8ba011dd3192d0e3fbc09fc0283409f2048fc10e057be7b33fb4d4e2035e02183fa471d0ca2e2966c7d6e0dd1e1dee6823c506d15ee25d5b4c027491dcfeea5c29f77c1859a0955ec23e8f049128a6b0dd0786a3e2a3b1bc0027c7ba6d2d391b8086881db4098ba509964b04f2a40ca2b0967d92951949243394a54652065243294daa64f28852faa6ef0913dd34a2a5d24d294fc9252f29a534a495a9629244a4829fffd2f2e3ca937951eea4de4a14a5c245209254a48de13a8b740a49d4b4a9294924a94a4a5249252924924694ae122926285283d8d6ff00d05667f347e455e978daf3fcb3af1d9085a063b0cf2d681f72a3919fb1ef65507533e099c26db9600d5db37d43874c73e080fc86b9de31aae7864dcd3209f9946af2afdbb839a0931aebc278895bee47bbd0fae4b469cf82d3ea9d5729df5419892d14b2d10d03ddf4ddab9ffd672e529b2cb1e3d5b89602d21ad1b675d44316bf5cc977ece34535c343d849fcde4a92218b24c4a878db07586014c5e49891af8aab8d4e764546c6db53486ee0d8713c9f6ff5bda88dc3cb7ff3f696b5cf2cdd53447f21dbde777d3fcd40c247a2e19235bb4df93b19e8b1a5cf6bc9207004fef2b95519d7c0b2eaa8676e5ee8fa4b388f4ae7560f77024f27b23625c4da2b325a6260c71fca294603aad965974d12bb1f2abbf6fa92f0353b35046be28f5628b5beb5ef7db0edc584c336cedfa0c467dd7ee6bdc7739cd736c7b48f70006dec85564beac4f6c7b8687e2a41088e8c73c9223771faa6d63da221b0468a86d020891dc4abfd49c36d41da924fe30a9dac3b5a19a86e89862b4160d71dc00681bb49ee93c36b748d01ec9b6b9baba00086e2e7fc934a4283e743c22d149bac81c0d5d3e01023c569e1d7e95327e93f53e43b04d5c90d24992e89e400a618d1a81c782606523631a3dc424a481de0a5ba15539558ff005842775000e89c105bdba12f507731f1598eceb0f1fddf9108e45a7bc7c115a43acfb9be33f04076656dd242a0d65d71812f2add5d26c7097bc33e5b92d4ab40c5f9e00864a01cdb49ff007aba3a3b36c8b839de11b7fbd665b53eab0d6f10e6f2103123a2410d9667bc78fe54767501dffb9526572027f4dde28526dd36e6d647f76a88dc9a8e9bbef589c15205c382420976f7b1dc107e69482b185d60eea6dcbb0704fde929d433e1a25aaa0dcf7f7d7e2119b9ed3c81f229292db59d7bca7adce6883f7a87daab23591f2526db5bb87044297abd46924f733e69dbea31ee2068427d3b29b6212b450635d902278fe2a6c743c92918e540b5a47fb4a36831b606d1f6827582a163fdefede5f244d8cec394e2b6b740343ca5690290d6f76c601f9b3f955af59c1860e8441084fa9d32c3008d42812f0ddb1aa20a086c5b6818fa73a27638113e3aaaa7d47343741e68953b6360fde8dade1636bf65c64685a0291b039de45a4216412f7fb07685069734fb90b5d4cd8e964f7fee4b71d1c7b687e050aa276fcd4c1d0a54b6976be2c20705181552487fcd5969e136954913cfcd46520952994a7ee99208d2974a531294a54aa5d2e534ea9688d2a979f24a52d134a54aa5048a6948a54aa58a49129214a7ffd3f2eeea43951ee9da5394ca1284be2924a48de13a8b784fa2700b4ae9264e8d29509249214a52498a48d2974ce4f2a2ee12506ed9639d4b058e2f113b78688fa3ff004505ce1bc06fd1523ad6df8217052a5e4964f1eef253a9d023982a0e329379e6114362b7901c5a61c350b4fa9e46ec0dc7f3dcc23fea963d4e8710ad65da7ec35567c473e411b4109316c7fa2048689dc1d24107ca114e5da297b4bc9dd64820c411f9ff00da54697c5235f3099ef2ed91a927503ba3c48a55d69366e3ceed7ba2566c92f631ce68fa446b00a6c6c66bcbfd66b86ba4e8af57e9d2d2d66839285a513b25e2b6b7dc23504823f92515ee77d9db0096304b881202a39b93b8ba9075d24cf62a55f5677a0cc576b4b46d06759ffc8a7c68ee698e77a50beed5cfb05ce6ede180f3e6abbb70ae09e4f1c4226bb9c246d981e308369f769ac26c9705cbf768795030de1441f7263c95195c1257b37cbb81dbc558766f87e0a9893a0466e2bfb9007de8257764d8eee865ee3c94638ec0d264920689518af7381769de3ba545048089b5d8ff00a2d25159876bbfd65693195e9bb93e2a4e21a6186029040ac331d1a4de9e06af27e1c23578f4374d927cd13703f3e0a996b4fd17275008e2b64c10d80dd12f55edf826f73469a84327d498d2399481050596e7ba769d4a8beaaee1b6e6f1c3a60a663fd37c3bb2317d6e1a947a2035860168fd19de076e1c865838220f81570b847b79eca2e2cb5b2ffa4349ee99c20ecbb888ddc7b0458e03c4a355587428e4d2faec24ea1c74284d71074309845320361b871da7f37ee437630ed2141b9373742e9f8a2b32c930e649f24a9288e3bc706541cc7b4491f357dbee1258e6cf1b8424fc5363768d09e0a34aa73a4f6d13fa8f1dd15f8d6d4f87364788d42714f88943854c1b9160ff0058466e7583b9fcaa0681ca158dda610a5375bd40e931f911066b1dcfe05660127448829529d666455e2511b756efce1e4b18388e094e2d70ee929dbdde1af9a83a0992b245ef1dd1065bc7e71fca929d0dae05381aeaa90ce77883f24419a3b8fb8a2a6c592a004f3c288cbacf884bd664e8e092167336981c25e9b8f7449691cca40808ec8422a76e56004c08294a486509d477279108a174a754c977494bca7f828a7494ba74d3a26494ba49a5294a94ba6948fdea3d91528a498a4852adffd4f2e4e131e53b5152e521a24922a2cdbc2928b7812a49c16a86a9ce89348075121312651415685284a02452b4292492452a4c5248a0a09582d7340825a468882831a9d516a77e859f009ca16b918ac46baa90014a1200236a4959828ae6d7646f68747128234e149a52b4b2f431e2030266b6a66ad027c522e50949097d484cfb435a5c78024a11705532eddc7d3061a3e979a2a405ceb0bde797f64c6488e148eed5cdd00d1359ed882751f722b57dded2d74478042d7829f821339df7204a42a67451778a5aa258d8604db4a36fd21f157a5511f481f356e520a5d96d45f0e30077466901c1cc3b82abb01d0774cd73a9708d5491a6390b741cf2e20c4424c20b8025353955b9b04479a41ae8f5068d2742a6d18750da38cc3a8e639422cb01d3b2836eb26071fdc13b2d234777e34e5473b034648d336da48da470836987ef6b809f11f82958e0d3bbc795176d7004f09b1037492c4bcbe1c444a7b2b2d00a4f2d2d1b748d4246e6ed3b8ebdd390b0ba39ec87eafbc91dd4058d3cf8a7758e70018d0c00e84f309500a64e3321c39e6506cc770f70820a9b58f7eae713e295c765640709ec9b25d1b455d0e7be38f12aed4c634113b5adf0ee83407064bceaefc814e5ae7170d02680cc34f34ec739ef83af8ca2fda1a243649040855ecd8c121dee3e1f91356d79323f344ea92f2133e6408da5daea9b6343b5daf9e4f821bad2f8de6613eea5b57d2d7b01e3e29c4063164d52435d0c86bcc39dc206461b6d68756f8db3323f8a80def76e79dceec51dce7d7ec041079010a490d2661dc1c606e1dc852f41c15b6d8e680c9307b76d5488f4fdc1c0bb988ec95237f0691a1d1ab50cd43c215e79713bdfa4a4d1b840008f129a4269ce35f9a635b9680650e9d7ee0a0fa19f9a652a434082132b1755b584f30ab774294c81213ef729ec9ec9bd21f0490b0b5c14c643fc4fdea3e978150734b79494d86e5bc774419be2010a925aa368a7406530f208526e4b0e930b3815204f092a9d216b49e4296f056607290b084554e907270e59cdbde3b953194f1e07e212453781483b5550651e207dea4325bdc14514d994bcd03ed15e9ac298b987870495492529510e1f148b824aa5249a524154ff00ffd5f2eee9c289e744e115324c9774925148dfa29d447d152d5382d2a4a5324252d50c934a5d9324a5c148a64faa2854a6296b09b54121bd447a4df822813c71e2803fa357b627bf8a837d641736883e0a32142bf5d2bb7c0fdf9d3c115240548130a02635e7ba96bd924ace728eef1d10dfbfe7290dfb7dc96a82ab6cdad9fb9517b8b8946cadd0df0411b776bc774e1682c858e686cf1aa77b98e82527c6d331ba447c146c8d21252cf803daa3a46a9c71aa89994d36a0ceb6899f04f77d11f14edfa2135bf43e6824231cab20aaadecad35116865af6d4a1fba6489466441fc5486d9f252c5616351acf320a98dc276491dd147a5b7b79a19893e9cc77520623bb6312c6eac746eed3dd4328b43b4e7c905de7cf921ddea6e1bbe51e0814c59fbdc37761e2a6d23d3dc4e9c6884df5b4f4fc0fc63bf2a2ddbb86f9f9a0b99ef77035512c7685cacb7d381b6145fe711e496aa60054d6f10a0e71fcd1fda2883d2eff8a5f9c37fd191c7825aa9adb1e4c1244a255881c65c48569de9ed3bb8ec86ce74e3bca695c2d604b5c496cb448d549a6bd3718fc899d1b5f1e3aa4c8dae9f04d67175a33b1b2edc38eca2c2f6c9eced25475dbe5088fddb1b3c47e29a578b5da0004bbdd1c246bdccd791ac2613e988e652f7ef13c778442d3768f6b9e48afb729c974c1e427a77ee77a5f3f15076fde767d2495aa52f15b60eae49ef6c000fbb92abbbd5dffa4fa497be75f1d51083b261ee76d71f9a8bcb4186481c4f8a7aa376bca674ee7473261095aa3b2809706f8e909dd658d1b1c00436eede2399d12b67d4f77290f14499035b9b0e10554bab0d74b7e89e118ca8593b754a4b025c7d51b603c840c6565041b606a6155f2ab0d6823c55c55f37f9b1f14142da4118309f920f75669f53c905cc367884eda4bf46832ac8e3584566cdbedfc3c51535db82ff00ce706f9223712a6f267ef4533a4f29b5f924963e8d5d9a3ee4c6bac0fa00a9998513c6892983b1ea3aedfb947ecd5732e1f028c27ba6ff006a3aa917d9dbd9e7e6145d411c3bf0443c08e530df2515a85cdb1ba8d7e0a22f7b7b908a502ddb3a7296aa48329e3bcfc52558a49baab47fffd9, 1, 'Vedarko', '', 'Dasgupta', 'Tamal Dasgupta', 'Male', '2005-11-01', '', '9088518998', '9748088783', '', '', '', NULL, '2015-04-01', 'Yes');
INSERT INTO `students` (`StudentID`, `Photo`, `SalutationID`, `FirstName`, `MiddleName`, `LastName`, `FathersName`, `Gender`, `DOB`, `CurrentlyStudyingAt`, `MobileNumber`, `FathersMobileNumber`, `HomePhoneNumber`, `PresentAddress`, `City`, `PINCode`, `AdmittedOn`, `IsActive`) VALUES
(133, NULL, 2, 'radha', '', 'radha', 'aaaa', 'Female', '2001-01-01', 'ix', '9804250045', '9804250045', '03324431333', 'aaaaaaaa\r\naaaaaa\r\naaaaaaa', 'aaaaa', 777777, '2015-05-07', 'Yes'),
(134, NULL, 2, 'AAAAA', '', 'AAAA', 'AAA', 'Female', '2000-01-01', 'VIII', '9804250045', '9804250045', '', '', '', NULL, '2015-05-07', 'Yes');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`ID`, `StudentID`, `BatchID`, `Date`, `IsPresent`) VALUES
(1, 18, 4, '2014-08-08', 0),
(2, 19, 4, '2014-08-08', 0),
(3, 20, 4, '2014-08-08', 0),
(4, 21, 4, '2014-08-08', 0),
(5, 22, 4, '2014-08-08', 0),
(6, 23, 4, '2014-08-08', 0),
(7, 24, 4, '2014-08-08', 0),
(8, 25, 4, '2014-08-08', 0),
(9, 26, 4, '2014-08-08', 0),
(10, 131, 4, '2014-08-08', 0),
(16, 52, 1, '2014-08-31', 1),
(17, 53, 1, '2014-08-31', 1),
(18, 54, 1, '2014-08-31', 0),
(19, 55, 1, '2014-08-31', 1),
(20, 56, 1, '2014-08-31', 1),
(21, 57, 1, '2014-08-31', 1),
(22, 58, 1, '2014-08-31', 1),
(23, 59, 1, '2014-08-31', 1),
(24, 60, 1, '2014-08-31', 1),
(25, 61, 1, '2014-08-31', 0),
(26, 62, 1, '2014-08-31', 0),
(27, 63, 1, '2014-08-31', 0),
(28, 37, 6, '2014-12-13', 0),
(29, 38, 6, '2014-12-13', 0),
(30, 39, 6, '2014-12-13', 0),
(31, 40, 6, '2014-12-13', 0),
(32, 41, 6, '2014-12-13', 0),
(33, 42, 6, '2014-12-13', 0),
(34, 43, 6, '2014-12-13', 0),
(35, 44, 6, '2014-12-13', 0),
(36, 45, 6, '2014-12-13', 0),
(37, 46, 6, '2014-12-13', 0),
(38, 47, 6, '2014-12-13', 0),
(39, 48, 6, '2014-12-13', 0),
(40, 49, 6, '2014-12-13', 0),
(41, 50, 6, '2014-12-13', 0),
(42, 51, 6, '2014-12-13', 0),
(43, 52, 1, '2015-04-28', 1),
(44, 53, 1, '2015-04-28', 1),
(45, 54, 1, '2015-04-28', 1),
(46, 55, 1, '2015-04-28', 1),
(47, 56, 1, '2015-04-28', 0),
(48, 57, 1, '2015-04-28', 0),
(49, 58, 1, '2015-04-28', 1),
(50, 59, 1, '2015-04-28', 1),
(51, 60, 1, '2015-04-28', 1),
(52, 61, 1, '2015-04-28', 1),
(53, 62, 1, '2015-04-28', 1),
(54, 63, 1, '2015-04-28', 1),
(55, 1, 11, '2015-05-01', 0),
(56, 2, 11, '2015-05-01', 0),
(57, 3, 11, '2015-05-01', 0),
(58, 4, 11, '2015-05-01', 0),
(59, 5, 11, '2015-05-01', 0),
(60, 6, 11, '2015-05-01', 0),
(61, 7, 11, '2015-05-01', 0),
(62, 8, 11, '2015-05-01', 0),
(63, 9, 11, '2015-05-01', 0),
(64, 10, 11, '2015-05-01', 0),
(65, 11, 11, '2015-05-01', 0),
(66, 12, 11, '2015-05-01', 0),
(67, 13, 11, '2015-05-01', 0),
(68, 14, 11, '2015-05-01', 0),
(69, 15, 11, '2015-05-01', 0),
(70, 16, 11, '2015-05-01', 0),
(71, 17, 11, '2015-05-01', 0),
(72, 132, 11, '2015-05-01', 0),
(73, 1, 11, '2015-05-07', 0),
(74, 2, 11, '2015-05-07', 0),
(75, 3, 11, '2015-05-07', 0),
(76, 4, 11, '2015-05-07', 0),
(77, 5, 11, '2015-05-07', 0),
(78, 6, 11, '2015-05-07', 0),
(79, 7, 11, '2015-05-07', 0),
(80, 8, 11, '2015-05-07', 0),
(81, 9, 11, '2015-05-07', 0),
(82, 10, 11, '2015-05-07', 0),
(83, 11, 11, '2015-05-07', 0),
(84, 12, 11, '2015-05-07', 0),
(85, 13, 11, '2015-05-07', 0),
(86, 14, 11, '2015-05-07', 0),
(87, 15, 11, '2015-05-07', 0),
(88, 16, 11, '2015-05-07', 0),
(89, 17, 11, '2015-05-07', 0),
(90, 132, 11, '2015-05-07', 0),
(91, 133, 11, '2015-05-07', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=135 ;

--
-- Dumping data for table `student_batch`
--

INSERT INTO `student_batch` (`ID`, `StudentID`, `BatchID`, `AcademicYear`) VALUES
(1, 1, 11, 0000),
(2, 2, 11, 0000),
(3, 3, 11, 0000),
(4, 4, 11, 0000),
(5, 5, 11, 0000),
(6, 6, 11, 0000),
(7, 7, 11, 0000),
(8, 8, 11, 0000),
(9, 9, 11, 0000),
(10, 10, 11, 0000),
(11, 11, 11, 0000),
(12, 12, 11, 0000),
(13, 13, 11, 0000),
(14, 14, 11, 0000),
(15, 15, 11, 0000),
(16, 16, 11, 0000),
(17, 17, 11, 0000),
(18, 18, 4, 0000),
(19, 19, 4, 0000),
(20, 20, 4, 0000),
(21, 21, 4, 0000),
(22, 22, 4, 0000),
(23, 23, 4, 0000),
(24, 24, 4, 0000),
(25, 25, 4, 0000),
(26, 26, 4, 0000),
(27, 27, 5, 0000),
(28, 28, 5, 0000),
(29, 29, 5, 0000),
(30, 30, 5, 0000),
(31, 31, 5, 0000),
(32, 32, 5, 0000),
(33, 33, 5, 0000),
(34, 34, 5, 0000),
(35, 35, 5, 0000),
(36, 36, 5, 0000),
(37, 37, 6, 0000),
(38, 38, 6, 0000),
(39, 39, 6, 0000),
(40, 40, 6, 0000),
(41, 41, 6, 0000),
(42, 42, 6, 0000),
(43, 43, 6, 0000),
(44, 44, 6, 0000),
(45, 45, 6, 0000),
(46, 46, 6, 0000),
(47, 47, 6, 0000),
(48, 48, 6, 0000),
(49, 49, 6, 0000),
(50, 50, 6, 0000),
(51, 51, 6, 0000),
(52, 52, 1, 0000),
(53, 53, 1, 0000),
(54, 54, 1, 0000),
(55, 55, 1, 0000),
(56, 56, 1, 0000),
(57, 57, 1, 0000),
(58, 58, 1, 0000),
(59, 59, 1, 0000),
(60, 60, 1, 0000),
(61, 61, 1, 0000),
(62, 62, 1, 0000),
(63, 63, 1, 0000),
(64, 64, 2, 0000),
(65, 65, 2, 0000),
(66, 66, 2, 0000),
(67, 67, 2, 0000),
(68, 68, 2, 0000),
(69, 69, 2, 0000),
(70, 70, 2, 0000),
(71, 71, 2, 0000),
(72, 72, 2, 0000),
(73, 73, 2, 0000),
(74, 74, 2, 0000),
(75, 75, 2, 0000),
(76, 76, 2, 0000),
(77, 77, 2, 0000),
(78, 78, 2, 0000),
(79, 79, 2, 0000),
(80, 80, 3, 0000),
(81, 81, 3, 0000),
(82, 82, 3, 0000),
(83, 83, 3, 0000),
(84, 84, 3, 0000),
(85, 85, 3, 0000),
(86, 86, 3, 0000),
(87, 87, 7, 0000),
(88, 88, 7, 0000),
(89, 89, 7, 0000),
(90, 90, 7, 0000),
(91, 91, 7, 0000),
(92, 92, 7, 0000),
(93, 93, 7, 0000),
(94, 94, 7, 0000),
(95, 95, 7, 0000),
(96, 96, 7, 0000),
(97, 97, 7, 0000),
(98, 98, 7, 0000),
(99, 99, 8, 0000),
(100, 100, 8, 0000),
(101, 101, 8, 0000),
(102, 102, 8, 0000),
(103, 103, 8, 0000),
(104, 104, 8, 0000),
(105, 105, 8, 0000),
(106, 106, 8, 0000),
(107, 107, 8, 0000),
(108, 108, 8, 0000),
(109, 109, 8, 0000),
(110, 110, 8, 0000),
(111, 111, 8, 0000),
(112, 112, 9, 0000),
(113, 113, 9, 0000),
(114, 114, 9, 0000),
(115, 115, 9, 0000),
(116, 116, 9, 0000),
(117, 117, 9, 0000),
(118, 118, 9, 0000),
(119, 119, 9, 0000),
(120, 120, 9, 0000),
(121, 121, 9, 0000),
(122, 122, 9, 0000),
(123, 123, 9, 0000),
(124, 124, 10, 0000),
(125, 125, 10, 0000),
(126, 126, 10, 0000),
(127, 127, 10, 0000),
(128, 128, 10, 0000),
(129, 129, 10, 0000),
(130, 130, 10, 0000),
(131, 131, 4, NULL),
(132, 132, 11, NULL),
(133, 133, 11, NULL),
(134, 134, 12, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student_payment`
--

INSERT INTO `student_payment` (`PaymentID`, `StudentID`, `ClassID`, `SubjectID`, `PaidOn`, `Amount`, `ForMonth`, `AcademicYear`) VALUES
(1, 78, 0, 0, '2014-08-31', 300, 7, 2014),
(2, 4, 0, 0, '2014-08-31', 400, 8, 2014),
(3, 3, 0, 0, '2015-05-07', 400, 5, 2015);

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

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`SubjectID`, `Subject`) VALUES
(1, 'Mathematics');

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

--
-- Dumping data for table `useraccess_uggroups`
--

INSERT INTO `useraccess_uggroups` (`GroupID`, `Label`) VALUES
(1, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `useraccess_ugmembers`
--

CREATE TABLE IF NOT EXISTS `useraccess_ugmembers` (
  `UserName` varchar(50) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserName`,`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `useraccess_ugmembers`
--

INSERT INTO `useraccess_ugmembers` (`UserName`, `GroupID`) VALUES
('admin', -1),
('admin2', -1),
('pradipm', 1);

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

--
-- Dumping data for table `useraccess_ugrights`
--

INSERT INTO `useraccess_ugrights` (`TableName`, `GroupID`, `AccessMask`) VALUES
('admin_members', -1, 'ADESPIM'),
('admin_rights', -1, 'ADESPIM'),
('admin_users', -1, 'ADESPIM'),
('AttendanceRecord', -1, 'ESM'),
('AttendanceRecord', 1, 'ES'),
('attendancerecords', -1, 'EDSM'),
('attendancerecords', 1, 'DS'),
('AttendanceSelectBatch', -1, 'AM'),
('AttendanceSelectBatch', 1, 'A'),
('batch', -1, 'AEDSM'),
('batch', 1, 'AEDS'),
('class', -1, 'SM'),
('class', 1, 'S'),
('examresult', -1, 'AEDSM'),
('examresult', 1, 'AEDS'),
('examresultentry', -1, 'ESM'),
('examresultentry', 1, 'ES'),
('examresultsentry', -1, 'ESM'),
('examresultsentry', 1, 'ES'),
('exams', -1, 'AEDSM'),
('exams', 1, 'AEDS'),
('exam_result', -1, 'AEDSM'),
('exam_result', 1, 'AEDS'),
('fees_table', -1, 'AEDSM'),
('fees_table', 1, 'AEDS'),
('MarksEntry', -1, 'ESM'),
('MarksEntry', 1, 'ES'),
('MarksEntrySelectBatch', -1, 'ASM'),
('MarksEntrySelectBatch', 1, 'A'),
('MarksEntrySelectExam', -1, 'ASM'),
('MarksEntrySelectExam', 1, 'A'),
('months', -1, 'SM'),
('months', 1, 'S'),
('msg_sms', -1, 'ASM'),
('msg_sms', 1, 'AS'),
('msg_sms_attendance', -1, 'ASM'),
('msg_sms_attendance', 1, 'AS'),
('msg_sms_batch', -1, 'ASM'),
('msg_sms_batch', 1, 'AS'),
('msg_sms_marks', -1, 'ASM'),
('msg_sms_marks', 1, 'AS'),
('MyProfile', -1, 'ESM'),
('MyProfile', 1, 'ES'),
('options', -1, 'ESM'),
('options', 1, 'ES'),
('salutations', -1, 'AEDSM'),
('salutations', 1, 'AEDS'),
('sms_template', -1, 'AEDSM'),
('sms_template', 1, 'AEDS'),
('students', -1, 'AEDSM'),
('students', 1, 'AEDSM'),
('StudentsDetails', -1, 'SM'),
('StudentsDetails', 1, 'S'),
('students_prev_records', -1, 'SM'),
('students_prev_records', 1, 'S'),
('student_attendance', -1, 'AEDSM'),
('student_attendance', 1, 'AEDS'),
('student_batch', -1, 'AEDSM'),
('student_batch', 1, 'AEDS'),
('student_connected_batches', -1, 'SM'),
('student_connected_batches', 1, 'S'),
('student_payment', -1, 'AEDSM'),
('student_payment', 1, 'AEDS'),
('subjects', -1, 'AEDSM'),
('subjects', 1, 'S'),
('support_request', -1, 'AM'),
('support_request', 1, 'A'),
('update_support_request', -1, 'ESM'),
('users', -1, 'AEDSM'),
('view_support_request', -1, 'SM'),
('view_support_request', 1, 'S');

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `LoginID`, `Password`, `UserName`, `EmailID`, `IsActive`, `ActivationCode`, `IsAdministrator`) VALUES
(0, 'admin', 'admin', NULL, NULL, '', '', ''),
(1, 'pradipm', '#reset1234', 'Pradip Mallick', 'mallick124@gmail.com', '', '', '');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `attendancerecords` AS select `student_attendance`.`ID` AS `ID`,`student_attendance`.`StudentID` AS `StudentID`,trim(concat(`salutations`.`Salutation`,' ',`students`.`FirstName`,' ',`students`.`MiddleName`,' ',`students`.`LastName`)) AS `FullName`,`students`.`FathersName` AS `FathersName`,`student_attendance`.`BatchID` AS `BatchID`,`batch`.`BatchName` AS `BatchName`,`student_attendance`.`Date` AS `Date`,`students`.`MobileNumber` AS `MobileNumber`,`students`.`FathersMobileNumber` AS `FathersMobileNumber`,`student_attendance`.`IsPresent` AS `IsPresent` from (((`student_attendance` left join `students` on((`student_attendance`.`StudentID` = `students`.`StudentID`))) left join `salutations` on((`students`.`SalutationID` = `salutations`.`ID`))) left join `batch` on((`student_attendance`.`BatchID` = `batch`.`BatchID`)));

-- --------------------------------------------------------

--
-- Structure for view `examresultview`
--
DROP TABLE IF EXISTS `examresultview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `examresultview` AS select `exam_result`.`ResultID` AS `ResultID`,`exam_result`.`StudentID` AS `StudentID`,trim(concat(`salutations`.`Salutation`,' ',`students`.`FirstName`,' ',`students`.`MiddleName`,' ',`students`.`LastName`)) AS `FullName`,`exam_result`.`ExamID` AS `ExamID`,`exams`.`ExamName` AS `ExamName`,`class`.`Class` AS `Class`,`subjects`.`Subject` AS `Subject`,`exam_result`.`MarksObtained` AS `MarksObtained`,`class`.`ClassID` AS `ClassID`,`subjects`.`SubjectID` AS `SubjectID`,`students`.`MobileNumber` AS `MobileNumber`,`students`.`FathersMobileNumber` AS `FathersMobileNumber`,`exams`.`FullMarks` AS `FullMarks`,`exams`.`ExamDate` AS `ExamDate` from (((((`exam_result` left join `students` on((`exam_result`.`StudentID` = `students`.`StudentID`))) left join `salutations` on((`students`.`SalutationID` = `salutations`.`ID`))) left join `exams` on((`exam_result`.`ExamID` = `exams`.`ExamID`))) left join `class` on((`exams`.`ForClass` = `class`.`ClassID`))) left join `subjects` on((`exams`.`SubjectID` = `subjects`.`SubjectID`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
