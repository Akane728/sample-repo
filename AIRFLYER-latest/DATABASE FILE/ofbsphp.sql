-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 04:53 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ofbsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_uname` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pwd` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_uname`, `admin_email`, `admin_pwd`) VALUES
(1, 'admin', 'admin@mail.com', 'hello123');

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `airline_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`airline_id`, `name`, `seats`) VALUES
(15, 'Airbus A320-200', 180),
(16, 'Airbus A321-200', 200),
(17, 'Airbus A330-300', 400),
(18, 'Boeing 737-300', 168),
(19, 'Boeing 737-400', 188),
(20, 'Boeing 747-200', 550);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city`) VALUES
('Manila'),
('Cebu'),
('Clark'),
('Davao'),
('Mamburao'),
('Aklan'),
('Batanes'),
('Palawan'),
('Bataan'),
('Zamboanga');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `q1` varchar(250) NOT NULL,
  `q2` varchar(20) NOT NULL,
  `q3` varchar(250) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `arrivale` datetime NOT NULL,
  `departure` datetime NOT NULL,
  `return_dep` datetime DEFAULT NULL,
  `return_arr` datetime DEFAULT NULL,
  `Destination` varchar(20) NOT NULL,
  `source` varchar(20) NOT NULL,
  `return_city` varchar(20) DEFAULT NULL,
  `destination_city` varchar(20) DEFAULT NULL,
  `airline` varchar(20) NOT NULL,
  `Seats` varchar(110) NOT NULL,
  `duration` varchar(20) NOT NULL,
  `Price` int(11) NOT NULL,
  `status` varchar(6) DEFAULT NULL,
  `issue` varchar(50) DEFAULT NULL,
  `last_seat` varchar(5) DEFAULT '',
  `bus_seats` int(11) DEFAULT 20,
  `last_bus_seat` varchar(5) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `admin_id`, `arrivale`, `departure`, `return_dep`, `return_arr`, `Destination`, `source`, `return_city`, `destination_city`, `airline`, `Seats`, `duration`, `Price`, `status`, `issue`, `last_seat`, `bus_seats`, `last_bus_seat`) VALUES
(33, 1, '2023-12-07 16:00:00', '2023-12-07 14:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bataan', 'Batanes', 'Bataan', 'Batanes', 'Airbus A320-200', '180', '2', 800, '', '', '', 20, ''),
(34, 1, '2023-12-07 16:00:00', '2023-12-07 15:00:00', '2023-12-14 05:00:00', '2023-12-14 06:00:00', 'Palawan', 'Mamburao', 'Palawan', 'Mamburao', 'Airbus A321-200', '200', '1', 500, '', '', '', 20, ''),
(35, 1, '2023-12-07 11:00:00', '2023-12-07 10:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Davao', 'Zamboanga', 'Davao', 'Zamboanga', 'Airbus A320-200', '180', '1', 500, '', '', '', 20, ''),
(36, 1, '2023-12-07 13:30:00', '2023-12-07 10:30:00', '2023-12-10 12:00:00', '2023-12-10 15:00:00', 'Manila', 'Palawan', 'Manila', 'Palawan', 'Airbus A330-300', '400', '3', 1000, '', '', '', 20, ''),
(37, 1, '2023-12-07 12:00:00', '2023-12-07 07:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cebu', 'Manila', 'Cebu', 'Manila', 'Boeing 737-300', '168', '5', 2500, '', '', '', 20, ''),
(38, 1, '2023-12-07 13:30:00', '2023-12-07 07:30:00', '2023-12-20 18:00:00', '2023-12-21 00:00:00', 'Batanes', 'Clark', 'Batanes', 'Clark', 'Boeing 747-200', '550', '6', 3000, '', '', '', 20, ''),
(39, 1, '2023-12-07 11:00:00', '2023-12-07 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mamburao', 'Aklan', 'Mamburao', 'Aklan', 'Boeing 737-400', '188', '3', 2000, '', '', '', 20, ''),
(40, 1, '2023-12-07 10:30:00', '2023-12-07 07:30:00', '2023-12-14 07:00:00', '2023-12-14 10:00:00', 'Manila', 'Davao', 'Manila', 'Davao', 'Boeing 747-200', '550', '3', 2500, '', '', '', 20, ''),
(41, 1, '2023-12-10 10:00:00', '2023-12-10 08:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aklan', 'Cebu', 'Aklan', 'Cebu', 'Airbus A330-300', '400', '2', 1700, '', '', '', 20, ''),
(42, 1, '2023-12-15 00:00:00', '2023-12-14 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mamburao', 'Manila', 'Mamburao', 'Manila', 'Boeing 747-200', '550', '2', 1300, '', '', '', 20, ''),
(43, 1, '2023-12-17 18:00:00', '2023-12-17 14:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Manila', 'Batanes', 'Manila', 'Batanes', 'Boeing 737-400', '188', '4', 1800, '', '', '', 20, ''),
(44, 1, '2023-12-19 16:00:00', '2023-12-19 05:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Davao', 'Palawan', 'Davao', 'Palawan', 'Boeing 747-200', '550', '11', 5000, '', '', '', 20, ''),
(45, 1, '2023-12-25 14:00:00', '2023-12-25 11:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bataan', 'Clark', 'Bataan', 'Clark', 'Airbus A320-200', '180', '3', 1300, '', '', '', 20, ''),
(46, 1, '2023-12-12 06:00:00', '2023-12-12 01:00:00', '2023-12-17 07:00:00', '2023-12-17 12:00:00', 'Bataan', 'Palawan', 'Bataan', 'Palawan', 'Airbus A330-300', '400', '5', 1700, '', '', '', 20, ''),
(47, 1, '2023-12-16 05:00:00', '2023-12-15 20:00:00', '2023-12-20 15:00:00', '2023-12-21 00:00:00', 'Davao', 'Clark', 'Davao', 'Clark', 'Boeing 747-200', '550', '9', 4500, '', '', '', 20, ''),
(48, 1, '2023-12-16 07:00:00', '2023-12-16 02:00:00', '2024-01-05 07:00:00', '2024-01-05 12:00:00', 'Mamburao', 'Zamboanga', 'Mamburao', 'Zamboanga', 'Airbus A330-300', '400', '5', 2400, '', '', '', 20, '');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_profile`
--

CREATE TABLE `passenger_profile` (
  `passenger_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `mobile` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `dob` datetime NOT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `m_name` varchar(20) DEFAULT NULL,
  `l_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `card_no` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `expire_date` varchar(5) DEFAULT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pwdreset`
--

CREATE TABLE `pwdreset` (
  `pwd_reset_id` int(11) NOT NULL,
  `pwd_reset_email` varchar(50) NOT NULL,
  `pwd_reset_selector` varchar(80) NOT NULL,
  `pwd_reset_token` varchar(120) NOT NULL,
  `pwd_reset_expires` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seat_no` varchar(10) NOT NULL,
  `cost` int(11) NOT NULL,
  `class` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(10, 'versguila', 'versguila@gmail.com', 'versguila123'),
(11, 'lindsm', 'lindsymasicat@gmail.com', 'lindsy123'),
(12, 'pauljds', 'pauljaoquin@gmail.com', 'paul123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`airline_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  ADD PRIMARY KEY (`passenger_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`card_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `pwdreset`
--
ALTER TABLE `pwdreset`
  ADD PRIMARY KEY (`pwd_reset_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `airline`
--
ALTER TABLE `airline`
  MODIFY `airline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `pwdreset`
--
ALTER TABLE `pwdreset`
  MODIFY `pwd_reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  ADD CONSTRAINT `passenger_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `passenger_profile_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`passenger_id`) REFERENCES `passenger_profile` (`passenger_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
