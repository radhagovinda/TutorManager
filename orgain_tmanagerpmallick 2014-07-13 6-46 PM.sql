-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2014 at 03:16 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `orgain_tmanagerpmallick`
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

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`BatchID`, `BatchName`, `SubjectID`, `ClassID`) VALUES
(11, 'IX', 1, 2),
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
-- Stand-in structure for view `examresult`
--
CREATE TABLE IF NOT EXISTS `examresult` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`ExamID`, `ExamName`, `SubjectID`, `ForClass`, `ExamDate`, `FullMarks`) VALUES
(1, 'Month1 Test1', 2, 2, '2014-06-30', 100),
(3, 'x- math-test 1', 1, 3, '2014-06-26', 60),
(4, 'x-math test-1', 1, 3, '2014-06-26', 60);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `exam_result`
--

INSERT INTO `exam_result` (`ResultID`, `StudentID`, `BatchID`, `ExamID`, `MarksObtained`) VALUES
(1, 21, 4, 3, 56),
(2, 23, 4, 3, 58),
(3, 19, 4, 3, 58),
(4, 18, 4, 3, 55),
(5, 20, 4, 3, 58),
(6, 24, 4, 3, 58),
(7, 25, 4, 3, 42),
(8, 26, 4, 3, 56),
(9, 22, 4, 3, 0),
(19, 131, 4, 3, 12),
(20, 132, 4, 3, 89);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fees_table`
--

INSERT INTO `fees_table` (`ID`, `ClassID`, `SubjectID`, `Fees`) VALUES
(1, 2, 1, 400);

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
(21, '', 4, 'NILANJAN', '', 'BERA', 'NRIPEN  KR.  BERA', 'Male', '1998-12-11', '', '9547231647', '9800010726', '', '', '', 0, '0000-00-00', ''),
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
(131, NULL, 1, 'Tamal', '', 'Dasgupta', '', 'Male', '2014-07-09', '', '9748088783', '9433823929', '', '', '', NULL, '2014-07-09', 'Yes'),
(132, NULL, 1, 'Goutam', '', 'Manna', '', 'Male', '2014-07-09', '', '9804250045', '9830610901', '', '', '', NULL, '2014-07-09', 'Yes');

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
  UNIQUE KEY `StudentID` (`StudentID`,`Date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`ID`, `StudentID`, `BatchID`, `Date`, `IsPresent`) VALUES
(32, 1, 11, '2014-07-13', 0),
(33, 2, 11, '2014-07-13', 0),
(34, 3, 11, '2014-07-13', 1),
(35, 4, 11, '2014-07-13', 1),
(36, 5, 11, '2014-07-13', 0),
(37, 6, 11, '2014-07-13', 0),
(38, 7, 11, '2014-07-13', 0),
(39, 8, 11, '2014-07-13', 0),
(40, 9, 11, '2014-07-13', 0),
(41, 10, 11, '2014-07-13', 0),
(42, 11, 11, '2014-07-13', 0),
(43, 12, 11, '2014-07-13', 0),
(44, 13, 11, '2014-07-13', 0),
(45, 14, 11, '2014-07-13', 0),
(46, 15, 11, '2014-07-13', 0),
(47, 16, 11, '2014-07-13', 0),
(48, 17, 11, '2014-07-13', 0);

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
(132, 132, 4, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
-- Table structure for table `table2`
--

CREATE TABLE IF NOT EXISTS `table2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table3`
--

CREATE TABLE IF NOT EXISTS `table3` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table4`
--

CREATE TABLE IF NOT EXISTS `table4` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table5`
--

CREATE TABLE IF NOT EXISTS `table5` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table6`
--

CREATE TABLE IF NOT EXISTS `table6` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table7`
--

CREATE TABLE IF NOT EXISTS `table7` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table8`
--

CREATE TABLE IF NOT EXISTS `table8` (
  `GroupID` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table9`
--

CREATE TABLE IF NOT EXISTS `table9` (
  `UserName` varchar(50) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserName`,`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table9`
--

INSERT INTO `table9` (`UserName`, `GroupID`) VALUES
('admin', -1),
('admin1', -1);

-- --------------------------------------------------------

--
-- Table structure for table `table10`
--

CREATE TABLE IF NOT EXISTS `table10` (
  `TableName` varchar(50) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `AccessMask` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TableName`,`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table10`
--

INSERT INTO `table10` (`TableName`, `GroupID`, `AccessMask`) VALUES
('admin_members', -1, 'ADESPIM'),
('admin_rights', -1, 'ADESPIM'),
('admin_users', -1, 'ADESPIM'),
('batch', -1, 'ADESPIM'),
('batch Chart', -1, 'ADESPIM'),
('batch Chart1', -1, 'ADESPIM'),
('batch Chart2', -1, 'ADESPIM'),
('batch Chart3', -1, 'ADESPIM'),
('batch Chart4', -1, 'ADESPIM'),
('batch Chart5', -1, 'ADESPIM'),
('batch Chart6', -1, 'ADESPIM'),
('batch Chart7', -1, 'ADESPIM'),
('batch Chart8', -1, 'ADESPIM'),
('batch Report', -1, 'ADESPIM'),
('batch Report1', -1, 'ADESPIM'),
('batch Report2', -1, 'ADESPIM'),
('batch Report3', -1, 'ADESPIM'),
('batch Report4', -1, 'ADESPIM'),
('batch Report5', -1, 'ADESPIM'),
('batch Report6', -1, 'ADESPIM'),
('class', -1, 'ADESPIM'),
('Copy of batch', -1, 'ADESPIM'),
('Copy of batch1', -1, 'ADESPIM'),
('Copy of batch2', -1, 'ADESPIM'),
('Copy of batch3', -1, 'ADESPIM'),
('Copy of batch4', -1, 'ADESPIM'),
('Copy of batch5', -1, 'ADESPIM'),
('Copy of batch6', -1, 'ADESPIM'),
('Copy of batch7', -1, 'ADESPIM'),
('Copy of batch8', -1, 'ADESPIM'),
('exams', -1, 'ADESPIM'),
('exam_result', -1, 'ADESPIM'),
('fees_table', -1, 'ADESPIM'),
('months', -1, 'ADESPIM'),
('msg_sms', -1, 'ADESPIM'),
('salutations', -1, 'ADESPIM'),
('sms_template', -1, 'ADESPIM'),
('students', -1, 'ADESPIM'),
('students_prev_records', -1, 'ADESPIM'),
('student_attendance', -1, 'ADESPIM'),
('student_payment', -1, 'ADESPIM'),
('student_subject_batch', -1, 'ADESPIM'),
('subjects', -1, 'ADESPIM'),
('subjects Chart', -1, 'ADESPIM'),
('subjects Report', -1, 'ADESPIM'),
('table1', -1, 'ADESPIM'),
('table2', -1, 'ADESPIM'),
('table3', -1, 'ADESPIM'),
('table4', -1, 'ADESPIM'),
('table5', -1, 'ADESPIM'),
('table6', -1, 'ADESPIM'),
('table7', -1, 'ADESPIM'),
('users', -1, 'ADESPIM');

-- --------------------------------------------------------

--
-- Table structure for table `table11`
--

CREATE TABLE IF NOT EXISTS `table11` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table12`
--

CREATE TABLE IF NOT EXISTS `table12` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table13`
--

CREATE TABLE IF NOT EXISTS `table13` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table14`
--

CREATE TABLE IF NOT EXISTS `table14` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table15`
--

CREATE TABLE IF NOT EXISTS `table15` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table16`
--

CREATE TABLE IF NOT EXISTS `table16` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table17`
--

CREATE TABLE IF NOT EXISTS `table17` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table18`
--

CREATE TABLE IF NOT EXISTS `table18` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table19`
--

CREATE TABLE IF NOT EXISTS `table19` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table20`
--

CREATE TABLE IF NOT EXISTS `table20` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table21`
--

CREATE TABLE IF NOT EXISTS `table21` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table22`
--

CREATE TABLE IF NOT EXISTS `table22` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table23`
--

CREATE TABLE IF NOT EXISTS `table23` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table24`
--

CREATE TABLE IF NOT EXISTS `table24` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table25`
--

CREATE TABLE IF NOT EXISTS `table25` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table26`
--

CREATE TABLE IF NOT EXISTS `table26` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table27`
--

CREATE TABLE IF NOT EXISTS `table27` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table28`
--

CREATE TABLE IF NOT EXISTS `table28` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Field1` varchar(50) DEFAULT NULL,
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
('AttendanceEntry', -1, 'ES'),
('AttendanceEntry', 1, 'ES'),
('AttendanceRecord', -1, 'ES'),
('attendancerecords', -1, 'DS'),
('AttendanceSelectBatch', -1, 'A'),
('AttendanceSelectBatch', 1, 'A'),
('batch', -1, 'AEDSM'),
('batch', 1, 'AEDS'),
('class', -1, 'SM'),
('class', 1, 'S'),
('examresult', -1, 'AEDSM'),
('examresult', 1, 'AEDS'),
('exams', -1, 'AEDSM'),
('exams', 1, 'AEDS'),
('exam_result', -1, 'AEDSM'),
('exam_result', 1, 'AEDS'),
('fees_table', -1, 'AEDSM'),
('fees_table', 1, 'AEDS'),
('MarksEntry', -1, 'ESM'),
('MarksEntry', 1, 'ES'),
('MarksEntrySelectBatch', -1, 'ASM'),
('MarksEntrySelectBatch', 1, 'AS'),
('MarksEntrySelectExam', -1, 'ASM'),
('MarksEntrySelectExam', 1, 'AS'),
('months', -1, 'SM'),
('months', 1, 'S'),
('msg_sms', -1, 'ASM'),
('msg_sms', 1, 'AS'),
('msg_sms_attendance', -1, 'AS'),
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
('student_connected_batches', -1, 'S'),
('student_connected_batches', 1, 'S'),
('student_payment', -1, 'AEDSM'),
('student_payment', 1, 'AEDS'),
('subjects', -1, 'AEDSM'),
('subjects', 1, 'S'),
('support_request', -1, 'AM'),
('support_request', 1, 'A'),
('table10', -1, 'AEDSPIM'),
('table11', -1, 'AEDSPIM'),
('table12', -1, 'AEDSPIM'),
('table13', -1, 'AEDSPIM'),
('table14', -1, 'AEDSPIM'),
('table15', -1, 'AEDSPIM'),
('table16', -1, 'AEDSPIM'),
('table17', -1, 'AEDSPIM'),
('table18', -1, 'AEDSPIM'),
('table19', -1, 'AEDSPIM'),
('table2', -1, 'AEDSPIM'),
('table20', -1, 'AEDSPIM'),
('table21', -1, 'AEDSPIM'),
('table22', -1, 'AEDSPIM'),
('table23', -1, 'AEDSPIM'),
('table24', -1, 'AEDSPIM'),
('table25', -1, 'AEDSPIM'),
('table26', -1, 'AEDSPIM'),
('table27', -1, 'AEDSPIM'),
('table28', -1, 'AEDSPIM'),
('table3', -1, 'AEDSPIM'),
('table4', -1, 'AEDSPIM'),
('table5', -1, 'AEDSPIM'),
('table6', -1, 'AEDSPIM'),
('table7', -1, 'AEDSPIM'),
('table8', -1, 'AEDSPIM'),
('table9', -1, 'AEDSPIM'),
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
-- Structure for view `attendancerecords`
--
DROP TABLE IF EXISTS `attendancerecords`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `attendancerecords` AS select `student_attendance`.`ID` AS `ID`,`student_attendance`.`StudentID` AS `StudentID`,trim(concat(`salutations`.`Salutation`,' ',`students`.`FirstName`,' ',`students`.`MiddleName`,' ',`students`.`LastName`)) AS `FullName`,`students`.`FathersName` AS `FathersName`,`student_attendance`.`BatchID` AS `BatchID`,`batch`.`BatchName` AS `BatchName`,`student_attendance`.`Date` AS `Date`,`students`.`MobileNumber` AS `MobileNumber`,`students`.`FathersMobileNumber` AS `FathersMobileNumber`,`student_attendance`.`IsPresent` AS `IsPresent` from (((`student_attendance` left join `students` on((`student_attendance`.`StudentID` = `students`.`StudentID`))) left join `salutations` on((`students`.`SalutationID` = `salutations`.`ID`))) left join `batch` on((`student_attendance`.`BatchID` = `batch`.`BatchID`)));

-- --------------------------------------------------------

--
-- Structure for view `examresult`
--
DROP TABLE IF EXISTS `examresult`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `examresult` AS select `exam_result`.`ResultID` AS `ResultID`,`exam_result`.`StudentID` AS `StudentID`,trim(concat(`salutations`.`Salutation`,' ',`students`.`FirstName`,' ',`students`.`MiddleName`,' ',`students`.`LastName`)) AS `FullName`,`exam_result`.`ExamID` AS `ExamID`,`exams`.`ExamName` AS `ExamName`,`class`.`Class` AS `Class`,`subjects`.`Subject` AS `Subject`,`exam_result`.`MarksObtained` AS `MarksObtained`,`class`.`ClassID` AS `ClassID`,`subjects`.`SubjectID` AS `SubjectID`,`students`.`MobileNumber` AS `MobileNumber`,`students`.`FathersMobileNumber` AS `FathersMobileNumber`,`exams`.`FullMarks` AS `FullMarks`,`exams`.`ExamDate` AS `ExamDate` from (((((`exam_result` left join `students` on((`exam_result`.`StudentID` = `students`.`StudentID`))) left join `salutations` on((`students`.`SalutationID` = `salutations`.`ID`))) left join `exams` on((`exam_result`.`ExamID` = `exams`.`ExamID`))) left join `class` on((`exams`.`ForClass` = `class`.`ClassID`))) left join `subjects` on((`exams`.`SubjectID` = `subjects`.`SubjectID`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
