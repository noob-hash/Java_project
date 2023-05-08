-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: May 02, 2023 at 06:11 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

Drop Database if exists `hospital`;

Create Database `hospital`;

USE `hospital`;

CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `password_` varchar(100) NOT NULL
);

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password_`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `DOI` date NOT NULL,
  `data` varchar(200) NOT NULL
);

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`DOI`, `data`) VALUES
('2022-05-18', 'Doctor Nishan logged in.'),
('2022-05-18', 'Doctor Nishan logged in.'),
('2022-05-18', 'Doctor Nishan logged in.'),
('2022-05-18', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-18', 'Doctor Nishan logged in.'),
('2022-05-19', 'Doctor Nishan logged in.'),
('2022-05-19', 'Doctor Nishan logged in.'),
('2022-05-19', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-19', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-19', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-19', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-19', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-19', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-19', 'Doctor logged off.'),
('2022-05-20', 'Doctor Nishan logged in.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', 'Doctor Nishan logged in.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', 'Doctor Nishan logged in.'),
('2022-05-20', 'Doctor Nishan logged in.'),
('2022-05-20', 'Doctor Nishan logged in.'),
('2022-05-20', 'Doctor Nishan logged in.'),
('2022-05-20', 'Doctor Nishan logged in.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', 'Doctor logged off.'),
('2022-05-20', 'Doctor logged off.'),
('2022-05-20', 'Doctor Nishan logged in.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', 'Doctor Nishan logged in.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-20', 'Doctor logged off.'),
('2022-05-22', 'Doctor Nishan logged in.'),
('2022-05-22', 'Doctor Nishan logged in.'),
('2022-05-22', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-22', 'New data for patient Sarala Dhungana with id 3 was added'),
('2022-05-22', ' Patient Sarala Dhungana with id 3 was accessed.'),
('2022-05-22', ' Patient Sarala Dhungana with id 3 was accessed.'),
('2022-05-22', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-22', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-22', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-22', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-22', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-22', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-22', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-22', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-22', 'Doctor logged off.'),
('2022-05-22', 'Doctor Nishan logged in.'),
('2022-05-22', 'Doctor logged off.'),
('2022-05-23', 'Doctor Nishan logged in.'),
('2022-05-23', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-23', 'Doctor logged off.'),
('2022-05-23', 'Doctor Nishan logged in.'),
('2022-05-23', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-23', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-23', 'Doctor logged off.'),
('2022-05-24', 'Doctor Nishan logged in.'),
('2022-05-24', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-24', 'Doctor Nishan logged in.'),
('2022-05-24', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-24', 'Doctor Nishan logged in.'),
('2022-05-24', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-25', 'Doctor Nishan logged in.'),
('2022-05-25', 'Doctor Nishan logged in.'),
('2022-05-25', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-25', 'Doctor Nishan logged in.'),
('2022-05-25', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-26', 'Doctor Nishan logged in.'),
('2022-05-26', ' Patient Sarala Dhungana with id 3 was accessed.'),
('2022-05-28', 'Doctor Nishan logged in.'),
('2022-05-28', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-31', 'Doctor Nishan logged in.'),
('2022-05-31', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-31', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-31', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-05-31', 'Doctor Nishan logged in.'),
('2022-05-31', ' Patient Sarala Dhungana with id 3 was accessed.'),
('2022-05-31', ' Patient Sarala Dhungana with id 3 was accessed.'),
('2022-05-31', 'Doctor logged off.'),
('2022-05-31', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Sandesh logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-01', 'Doctor Nishan logged in.'),
('2022-06-02', 'Doctor Nishan logged in.'),
('2022-06-02', 'Doctor Nishan logged in.'),
('2022-06-02', 'Doctor Nishan logged in.'),
('2022-06-02', 'Doctor Nishan logged in.'),
('2022-06-02', 'Doctor Nishan logged in.'),
('2022-06-02', 'Doctor Nishan logged in.'),
('2022-06-02', 'Doctor Nishan logged in.'),
('2022-06-02', 'Doctor Nishan logged in.'),
('2022-06-02', 'Doctor Nishan logged in.'),
('2022-08-24', 'Doctor Nishan logged in.'),
('2022-08-24', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-08-25', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-08-25', ' Patient Sarala Dhungana with id 3 was accessed.'),
('2022-08-25', 'Doctor Nishan logged in.'),
('2022-09-09', 'Doctor Nishan logged in.'),
('2022-11-12', 'Doctor Nishan logged in.'),
('2022-11-12', ' Patient Sandesh Rai with id 1 was accessed.'),
('2022-11-30', 'Doctor Nishan logged in.'),
('2022-11-30', ' Patient Sarala Dhungana with id 3 was accessed.'),
('2023-01-01', 'Doctor Nishan logged in.'),
('2023-01-01', ' Patient Sandesh Rai with id 1 was accessed.'),
('2023-01-01', ' Patient Sarala Dhungana with id 3 was accessed.');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dep_id` int(6) NOT NULL,
  `dep_name` varchar(50) NOT NULL
);

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dep_id`, `dep_name`) VALUES
(1000, 'Orthopedics'),
(1001, 'Dental'),
(1002, 'Dermetalogist'),
(1003, 'ER'),
(1004, 'Radiologist'),
(1005, 'Family Doctor'),
(1009, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `dep_allocation`
--

CREATE TABLE `dep_allocation` (
  `depId` int(6) NOT NULL,
  `docId` int(6) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(4) NOT NULL,
  `doc_name` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `department_id` int(6) NOT NULL
);

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `doc_name`, `phone`, `qualification`, `department_id`) VALUES
(1, 'Nishan', '9800000000', 'Phd.', 1000),
(2, 'Sandesh', '9800000001', 'Masters', 1003),
(3, 'Abiral', '9800000002', 'Masters', 1002),
(4, 'Nishan limbu', '9812098987', 'Masters', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_login`
--

CREATE TABLE `doctor_login` (
  `doctor_id` int(4) DEFAULT NULL,
  `password_hash` varchar(256) DEFAULT NULL
);

--
-- Dumping data for table `doctor_login`
--

INSERT INTO `doctor_login` (`doctor_id`, `password_hash`) VALUES
(1, 'password'),
(2, 'password'),
(3, 'password'),
(4, 'password');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_no` int(4) NOT NULL,
  `patientName` varchar(100) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `age` int(3) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `appoinment_date` date NOT NULL,
  `appoinment_time` time NOT NULL,
  `department` varchar(100) NOT NULL,
  `doctor` varchar(150) NOT NULL
);

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_no`, `patientName`, `gender`, `age`, `phone`, `appoinment_date`, `appoinment_time`, `department`, `doctor`) VALUES
(1, 'Sandesh Rai', 'M', 21, '9812098987', '2022-04-07', '07:42:00', 'Orthopedics', 'Nishan'),
(2, 'Sandesh Rai', 'M', 21, '9812098987', '2022-04-05', '07:42:00', 'Orthopedics', 'Nishan'),
(3, 'Sandesh Rai', 'M', 21, '9812098987', '2022-04-08', '11:46:00', 'Orthopedics', 'Nishan'),
(4, 'Sandesh Rai', 'M', 21, '9812098987', '2022-04-09', '10:18:00', 'Orthopedics', 'Nishan'),
(5, 'Sandesh Rai', 'M', 21, '9812098987', '2022-04-10', '09:12:00', 'Orthopedics', 'Nishan'),
(6, 'Sandesh Rai', 'M', 21, '9812098987', '2022-04-12', '07:32:00', 'Orthopedics', 'Nishan'),
(7, 'Sandesh Rai', 'M', 23, '9812098983', '2022-05-12', '11:29:00', 'Orthopedics', 'Nishan'),
(8, 'Sandesh Rai', 'M', 21, '9812098987', '2022-05-13', '10:06:00', 'Dentist', 'Rmesh'),
(9, 'Sarala Dhungana', 'F', 19, '9811000867', '2022-05-20', '00:22:00', 'Dental', 'Abiral'),
(10, 'Sameer Dhungana', 'M', 23, '9812098920', '2022-05-22', '22:35:00', 'Orthopedics', 'null'),
(11, 'Sandesh Rai', 'M', 27, '9812098987', '2022-05-31', '07:59:00', 'Orthopedics', 'null'),
(12, 'Surohan limbu', 'M', 21, '9800000011', '2022-06-02', '22:07:00', 'Orthopedics', 'Nishan'),
(13, 'Sandesh Rai', 'M', 19, '9812098987', '2023-01-02', '19:06:00', 'Orthopedics', 'Nishan');

--
-- Triggers `patient`
--
DELIMITER $$
CREATE TRIGGER `tr_patient` AFTER INSERT ON `patient` FOR EACH ROW BEGIN
if(new.phone not in (select contact from patient_data)) then
INSERT INTO patient_data(patient_name,age,gender,contact) VALUES
(new.patientName,new.age,new.gender,new.phone);
end if;
INSERT INTO patient_info(patient_id,DateofApp) values
((select patient_id from patient_data where contact =new.phone),new.appoinment_date);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

CREATE TABLE `patient_data` (
  `patient_id` int(6) NOT NULL,
  `patient_name` varchar(150) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `blood_group` varchar(4) DEFAULT NULL,
  `allergy` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `patient_data`
--

INSERT INTO `patient_data` (`patient_id`, `patient_name`, `age`, `gender`, `contact`, `blood_group`, `allergy`) VALUES
(1, 'Sandesh Rai', 21, 'M', '9812098987', NULL, NULL),
(2, 'Sandesh Rai', 23, 'M', '9812098983', NULL, NULL),
(3, 'Sarala Dhungana', 19, 'F', '9811000867', NULL, NULL),
(4, 'Sameer Dhungana', 23, 'M', '9812098920', NULL, NULL),
(5, 'Surohan limbu', 21, 'M', '9800000011', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_info`
--

CREATE TABLE `patient_info` (
  `patient_id` int(6) DEFAULT NULL,
  `DateOfApp` date NOT NULL,
  `height` varchar(6) DEFAULT NULL,
  `weight` varchar(6) DEFAULT NULL,
  `Blood_pressure` varchar(9) DEFAULT NULL,
  `temperature` varchar(4) DEFAULT NULL,
  `pulse` varchar(10) DEFAULT NULL,
  `diagnosis` varchar(300) DEFAULT NULL,
  `treatment` varchar(300) DEFAULT NULL,
  `medicines` varchar(100) DEFAULT NULL
);

--
-- Dumping data for table `patient_info`
--

INSERT INTO `patient_info` (`patient_id`, `DateOfApp`, `height`, `weight`, `Blood_pressure`, `temperature`, `pulse`, `diagnosis`, `treatment`, `medicines`) VALUES
(1, '2022-04-07', '170', '56', '83/90', '30', '66', 'Serve headache, Blood loss, rashes, achne, chill, painfull lymph nodes - possible symptom of black death', 'antibiotics, rest, hot water,', NULL),
(1, '2022-04-05', '170', '58', '80/90', '27', '63', 'Serve headache, Blood loss, rashes, achne, chill, painfull lymph nodes - possible symptom of black death', 'antibiotics, rest, hot water,', NULL),
(1, '2022-04-08', '170', '58', '80/90', '27', '63', 'Serve headache, Blood loss, rashes, achne, chill, painfull lymph nodes - possible symptom of black death', 'antibiotics, rest, hot water,', NULL),
(1, '2022-04-09', '170', '58', '80/90', '27', '63', 'Serve headache, Blood loss, rashes, achne, chill, painfull lymph nodes - possible symptom of black death', 'antibiotics, rest, hot water,', NULL),
(1, '2022-04-10', '170', '58', '80/90', '27', '63', 'Serve headache, Blood loss, rashes, achne, chill, painfull lymph nodes - possible symptom of black death', 'antibiotics, rest, hot water,', NULL),
(1, '2022-04-12', '170', '58', '80/90', '27', '63', 'Serve headache, Blood loss, rashes, achne, chill, painfull lymph nodes - possible symptom of black death', 'antibiotics, rest, hot water,', NULL),
(2, '2022-05-12', '140', '72', '120/100', '27', '54', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corporis tempore error numquam ullam vero veritatis minus fuga sit itaque asperiores, cumque consequuntur eveniet aspernatur laudantium rerum id facere, harum tempora!', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corporis tempore error numquam ullam vero ', NULL),
(1, '2022-05-13', '170', '58', '80/90', '27', '63', 'Serve headache, Blood loss, rashes, achne, chill, painfull lymph nodes - possible symptom of black death', 'antibiotics, rest, hot water,', NULL),
(3, '2022-05-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2022-05-22', '21', '40', '100/92', '35', '72', '                                    \r\n                                High fever, runny nose -suggested cold', '                                    \r\n                                Hot water, rest', '                                    \r\n                                '),
(4, '2022-05-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2022-06-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, '2023-01-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indexes for table `dep_allocation`
--
ALTER TABLE `dep_allocation`
  ADD KEY `depId` (`depId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `doctor_login`
--
ALTER TABLE `doctor_login`
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_no`);

--
-- Indexes for table `patient_data`
--
ALTER TABLE `patient_data`
  ADD PRIMARY KEY (`patient_id`),
  ADD UNIQUE KEY `contact` (`contact`);

--
-- Indexes for table `patient_info`
--
ALTER TABLE `patient_info`
  ADD KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dep_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_no` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patient_data`
--
ALTER TABLE `patient_data`
  MODIFY `patient_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dep_allocation`
--
ALTER TABLE `dep_allocation`
  ADD CONSTRAINT `dep_allocation_ibfk_1` FOREIGN KEY (`depId`) REFERENCES `department` (`dep_id`);

--
-- Constraints for table `doctor_login`
--
ALTER TABLE `doctor_login`
  ADD CONSTRAINT `doctor_login_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_info`
--
ALTER TABLE `patient_info`
  ADD CONSTRAINT `patient_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_data` (`patient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
