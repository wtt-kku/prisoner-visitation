-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2020 at 02:16 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prisoner`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_datecloses`
--

CREATE TABLE `tb_datecloses` (
  `dc_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `dateClose` varchar(30) NOT NULL,
  `timeClose` varchar(2) NOT NULL,
  `closeType` set('byrequest','bystaff') NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_joinrequests`
--

CREATE TABLE `tb_joinrequests` (
  `jreq_id` int(11) NOT NULL,
  `req_code` varchar(10) NOT NULL,
  `jreq_code` varchar(10) NOT NULL,
  `jreq_pre` varchar(10) NOT NULL,
  `jreq_firstname` varchar(30) NOT NULL,
  `jreq_lastname` varchar(30) NOT NULL,
  `jreq_id_num` varchar(13) NOT NULL,
  `jreq_tel_num` varchar(10) NOT NULL,
  `jreq_line_id` varchar(30) NOT NULL,
  `jreq_relation` varchar(20) NOT NULL,
  `jreq_id_img` varchar(255) NOT NULL,
  `doc_relat_status` set('none','accept','deny') NOT NULL DEFAULT 'none',
  `jreq_status` set('none','accept','deny') NOT NULL DEFAULT 'none',
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_requests`
--

CREATE TABLE `tb_requests` (
  `req_id` int(11) NOT NULL,
  `req_code` varchar(10) NOT NULL,
  `req_pre` varchar(10) NOT NULL,
  `req_firstname` varchar(30) NOT NULL,
  `req_lastname` varchar(30) NOT NULL,
  `req_id_num` varchar(13) NOT NULL,
  `req_tel_num` varchar(10) NOT NULL,
  `req_line_id` varchar(30) NOT NULL,
  `req_relation` varchar(20) NOT NULL,
  `req_id_img` varchar(255) NOT NULL,
  `pri_firstname` varchar(30) NOT NULL,
  `pri_lastname` varchar(30) NOT NULL,
  `pri_id_num` varchar(13) NOT NULL,
  `date_booking` varchar(10) NOT NULL,
  `time_booking` varchar(2) NOT NULL,
  `doc_relat_status` set('none','accept','deny') NOT NULL DEFAULT 'none',
  `doc_pri_status` set('none','accept','deny') NOT NULL DEFAULT 'none',
  `req_status` set('none','accept','deny') NOT NULL DEFAULT 'none',
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_staffs`
--

CREATE TABLE `tb_staffs` (
  `staff_id` int(11) NOT NULL,
  `staff_username` varchar(30) NOT NULL,
  `staff_password` varchar(255) NOT NULL,
  `staff_saltValue` varchar(255) NOT NULL,
  `staff_firstname` varchar(30) NOT NULL,
  `staff_lastname` varchar(30) NOT NULL,
  `department` set('visitRelative','prisonerRegis','relativeRegis') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_visits`
--

CREATE TABLE `tb_visits` (
  `vid` int(11) NOT NULL,
  `req_id` varchar(10) NOT NULL,
  `dc_id` int(11) NOT NULL,
  `vid_status` set('none','finished','failed') NOT NULL DEFAULT 'none',
  `vid_note` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_datecloses`
--
ALTER TABLE `tb_datecloses`
  ADD PRIMARY KEY (`dc_id`);

--
-- Indexes for table `tb_joinrequests`
--
ALTER TABLE `tb_joinrequests`
  ADD PRIMARY KEY (`jreq_id`);

--
-- Indexes for table `tb_requests`
--
ALTER TABLE `tb_requests`
  ADD PRIMARY KEY (`req_id`);

--
-- Indexes for table `tb_staffs`
--
ALTER TABLE `tb_staffs`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `tb_visits`
--
ALTER TABLE `tb_visits`
  ADD PRIMARY KEY (`vid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_datecloses`
--
ALTER TABLE `tb_datecloses`
  MODIFY `dc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_joinrequests`
--
ALTER TABLE `tb_joinrequests`
  MODIFY `jreq_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_requests`
--
ALTER TABLE `tb_requests`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_staffs`
--
ALTER TABLE `tb_staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_visits`
--
ALTER TABLE `tb_visits`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
