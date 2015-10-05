-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 27, 2015 at 09:55 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `als`
--

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE IF NOT EXISTS `loans` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` varchar(15) NOT NULL,
  `loan_type` text NOT NULL,
  `security` text NOT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loan_id`, `name`, `user_id`, `amount`, `date`, `loan_type`, `security`) VALUES
(3, '', 0, 0, '', '', ''),
(4, '', 0, 0, '', '', ''),
(5, '', 0, 0, '', '', ''),
(6, '', 0, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `loans1`
--

CREATE TABLE IF NOT EXISTS `loans1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `purpose` text NOT NULL,
  `loan_status` text NOT NULL,
  `loan_type` text NOT NULL,
  `mode` text NOT NULL,
  `installments` int(11) NOT NULL,
  `security` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `loans1`
--

INSERT INTO `loans1` (`id`, `name`, `user_id`, `date`, `amount`, `purpose`, `loan_status`, `loan_type`, `mode`, `installments`, `security`) VALUES
(1, 'Qwerty Williams', 456789, 'Mon 27-Jul-2015', 100000, 'Business', 'enabled', 'Short', 'Monthly', 10000, 'Y'),
(2, 'test data', 123456, 'Mon 27-Jul-2015', 150000, 'School fees', 'enabled', 'Short', 'Quaterly', 50000, 'Y'),
(3, 'Ken Test', 789654, 'Tue 28-Jul-2015', 100000, 'School fees', 'enable', 'Long', 'Monthly', 10000, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `loan_application`
--

CREATE TABLE IF NOT EXISTS `loan_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `purpose` text NOT NULL,
  `loan_status` text NOT NULL,
  `loan_type` text NOT NULL,
  `mode` text NOT NULL,
  `installments` int(11) NOT NULL,
  `security` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `loan_application`
--

INSERT INTO `loan_application` (`id`, `name`, `user_id`, `date`, `amount`, `purpose`, `loan_status`, `loan_type`, `mode`, `installments`, `security`) VALUES
(1, 'Qwerty Williams', 456789, 'Mon 27-Jul-2015', 100000, 'Business', 'enabled', 'Short', 'Monthly', 10000, 'Y'),
(2, 'test data', 123456, 'Mon 27-Jul-2015', 150000, 'School fees', 'enabled', 'Short', 'Quaterly', 50000, 'Y'),
(3, 'Ken Test', 789654, 'Tue 28-Jul-2015', 100000, 'School fees', 'enable', 'Long', 'Monthly', 10000, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `loan_payment`
--

CREATE TABLE IF NOT EXISTS `loan_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` varchar(15) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `mode` text NOT NULL,
  `transaction_code` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loan_reject`
--

CREATE TABLE IF NOT EXISTS `loan_reject` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` text NOT NULL,
  `date` varchar(15) NOT NULL,
  `loan_type` text NOT NULL,
  `security` text NOT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `loan_reject`
--

INSERT INTO `loan_reject` (`loan_id`, `name`, `user_id`, `amount`, `status`, `date`, `loan_type`, `security`) VALUES
(1, '', 0, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `loan_status`
--

CREATE TABLE IF NOT EXISTS `loan_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `loan_status` text,
  `name` text NOT NULL,
  `date` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `loan_status`
--

INSERT INTO `loan_status` (`id`, `user_id`, `loan_status`, `name`, `date`) VALUES
(1, 123456, NULL, 'test data', 'Mon 27-Jul-2015'),
(2, 456789, 'enabled', 'Qwerty Williams', 'Mon 27-Jul-2015'),
(3, 789654, NULL, 'Ken Test', 'Tue 28-Jul-2015');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` int(11) NOT NULL,
  `from` varchar(35) NOT NULL,
  `date` varchar(15) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ppic`
--

CREATE TABLE IF NOT EXISTS `ppic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pic` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE IF NOT EXISTS `shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` char(5) NOT NULL,
  `share` int(11) DEFAULT NULL,
  `transaction_code` varchar(15) DEFAULT NULL,
  `share_balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `shares`
--

INSERT INTO `shares` (`id`, `user_id`, `action`, `share`, `transaction_code`, `share_balance`) VALUES
(3, 123456, 'sell', NULL, 'JKNT4521', NULL),
(4, 456789, 'sell', 100, 'JKT478Z', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `share_rates`
--

CREATE TABLE IF NOT EXISTS `share_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buy` int(11) NOT NULL,
  `sell` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `share_rates`
--

INSERT INTO `share_rates` (`id`, `buy`, `sell`) VALUES
(5, 127, 145),
(7, 127, 145),
(8, 127, 145);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `rpt_password` varchar(32) NOT NULL,
  `rights` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `password`, `rpt_password`, `rights`) VALUES
(1, 123456, 'qwerty', 'qwerty', 'Member'),
(2, 456789, 'qwerty', 'qwerty', 'Member'),
(3, 987654, 'qwerty', 'qwerty', 'Member'),
(5, 789654, 'qwerty', 'qwerty', 'Member'),
(6, 111111, 'admin', 'admin', 'Admin'),
(8, 888888, 'qwerty', 'qwerty', 'Member'),
(9, 999999, 'qwerty', 'qwerty', 'Member'),
(10, 7777777, 'qwerty', 'qwerty', 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` int(11) NOT NULL,
  `street` varchar(20) NOT NULL,
  `gender` text NOT NULL,
  `city` text NOT NULL,
  `country` text NOT NULL,
  `region` varchar(20) NOT NULL,
  `bdate` int(11) NOT NULL,
  `bmonth` varchar(10) NOT NULL,
  `byear` int(11) NOT NULL,
  `nationality` text NOT NULL,
  `uploadedimage` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `name`, `phone`, `street`, `gender`, `city`, `country`, `region`, `bdate`, `bmonth`, `byear`, `nationality`, `uploadedimage`) VALUES
(1, 123456, 'test data', 123456, 'street1', 'male', 'testcity', 'Kenya', 'regiona', 5, '4', 1980, 'Ugandan', '1333614267656.jpg'),
(2, 456789, 'Qwerty Williams', 456123, 'Lenana', 'male', 'Nairobi', 'Kenya', 'Nairobi', 6, '1', 1985, 'Kenyan', 'IMG_20141105_204101.JPG'),
(3, 789654, 'Ken Test', 654789, 'Street 2', 'male', 'City5', 'Rwanda', 'Region 5', 10, '5', 1986, 'Rwandese', 'IMG_20150719_163119.jpg'),
(4, 111111, 'admin one', 321645, 'administrator street', 'radio', 'city admin', 'Kenya', 'admins', 1, '1', 1985, 'Kenyan', 'd51742441992baa0b634bf4d630dd463.jpg'),
(5, 888888, 'Last tested', 987546, 'tsgvgshvcgd', 'radio', 'sdfgdfsgfsg', 'Tanzania', 'sfdefdfdfdfd', 6, '1', 1988, 'Sudanese', '1345450-aston-martin-v12-vanquish.jpg'),
(6, 999999, 'Last tested', 987546, 'tsgvgshvcgd', 'radio', 'sdfgdfsgfsg', 'Tanzania', 'sfdefdfdfdfd', 6, '1', 1988, 'Sudanese', '1345450-aston-martin-v12-vanquish.jpg'),
(7, 7777777, 'Last tested', 987546, 'tsgvgshvcgd', 'radio', 'sdfgdfsgfsg', 'Tanzania', 'sfdefdfdfdfd', 6, '1', 1988, 'Sudanese', '1345450-aston-martin-v12-vanquish.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
