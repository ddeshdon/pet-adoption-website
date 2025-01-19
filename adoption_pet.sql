-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 28, 2024 at 02:29 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adoption_pet`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoption_request`
--

CREATE TABLE `adoption_request` (
  `ID` int NOT NULL,
  `user_id` int NOT NULL,
  `name_form` varchar(70) NOT NULL,
  `email_form` varchar(70) NOT NULL,
  `phone_form` varchar(70) NOT NULL,
  `nationality_form` varchar(70) NOT NULL,
  `current_city_form` varchar(70) NOT NULL,
  `current_country_form` varchar(70) NOT NULL,
  `pet_id` int NOT NULL,
  `pet_name` varchar(70) NOT NULL,
  `pet_description` text NOT NULL,
  `UserFormRequest` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `adoption_request`
--

INSERT INTO `adoption_request` (`ID`, `user_id`, `name_form`, `email_form`, `phone_form`, `nationality_form`, `current_city_form`, `current_country_form`, `pet_id`, `pet_name`, `pet_description`, `UserFormRequest`) VALUES
(20, 37, 'gaga', 'kuma@gmail.com', '07777777777', 'other', 'bkk', 'lao', 47, 'Carrot', 'Carrot is a good cat.', 'i like you'),
(21, 37, 'Nat Ornadda', 'kuma@gmail.com', '0999999999', 'thai', 'Bangkok', 'Thailand', 52, 'Kamu', 'Kamu is a black fat lucky cat. Adopt for good luck.', 'I\'m looking for a fun and furry companion, and I heard that black cat brings good luck.'),
(22, 37, 'Natty', 'kuma@gmail.com', '0999999999', 'thai', 'Bangkok', 'Thailand', 52, 'Kamu', 'Kamu is a black fat lucky cat. Adopt for good luck.', 'I\'m looking for a fun and furry companion.'),
(23, 37, 'gaga', 'kuma@gmail.com', '07777777777', 'thai', 'Bangkok', 'Thailand', 48, 'Kuma', 'Kuma is a black funny cat. But she is a little fat because she likes to eat a lot of food.', 'I love pets');

-- --------------------------------------------------------

--
-- Table structure for table `adoption_status`
--

CREATE TABLE `adoption_status` (
  `adoption_request_id` int NOT NULL,
  `user_ID` int NOT NULL,
  `user_name` varchar(70) NOT NULL,
  `pet_ID` int NOT NULL,
  `pet_name` varchar(70) NOT NULL,
  `status` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `adoption_status`
--

INSERT INTO `adoption_status` (`adoption_request_id`, `user_ID`, `user_name`, `pet_ID`, `pet_name`, `status`) VALUES
(20, 37, 'gaga', 47, 'Carrot', 'Approved'),
(21, 37, 'Nat Ornadda', 52, 'Kamu', 'Rejected'),
(22, 37, 'Natty', 52, 'Kamu', 'Pending'),
(23, 37, 'gaga', 48, 'Kuma', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `ID` int NOT NULL,
  `Name` varchar(70) NOT NULL,
  `Species` varchar(70) NOT NULL,
  `Breed` varchar(70) NOT NULL,
  `Age` varchar(70) NOT NULL,
  `Gender` varchar(70) NOT NULL,
  `is_adopted` tinyint(1) NOT NULL,
  `Description` varchar(3000) DEFAULT NULL,
  `is_vaccinated` tinyint(1) NOT NULL,
  `PhotoPath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`ID`, `Name`, `Species`, `Breed`, `Age`, `Gender`, `is_adopted`, `Description`, `is_vaccinated`, `PhotoPath`) VALUES
(47, 'Carrot', 'Cat', 'Siamese', '2', 'Male', 1, 'Carrot is a good cat.', 1, 'pet_adoption/pet_images/6747568972408.jpg'),
(48, 'Kuma', 'Cat', 'Scottish fold', '1', 'Female', 1, 'Kuma is a black funny cat. But she is a little fat because she likes to eat a lot of food.', 1, 'pet_adoption/pet_images/67475b7c92b80.jpg'),
(50, 'Punch', 'Cat', 'Aggressive cat', '21', 'Female', 0, 'Punch is a very Glamur cat. She likes to eat cockroaches.', 1, 'pet_adoption/pet_images/67475c078f34c.jpg'),
(51, 'Berm The Big Boy', 'Dog', 'Blob fish', '3', 'Male', 0, 'Berm is a big guy. Even though he is a dog he look like a fish.', 1, 'pet_adoption/pet_images/67475c63e6959.jpg'),
(52, 'Kamu', 'Cat', 'Scottish fold', '2', 'Female', 0, 'Kamu is a black fat lucky cat. Adopt for good luck.', 1, 'pet_adoption/pet_images/67476dd7aa801.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_ID` int NOT NULL,
  `role_name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_ID`, `role_name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int NOT NULL,
  `role_ID` int NOT NULL,
  `username` varchar(70) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `role_ID`, `username`, `password_hash`, `email`, `name`) VALUES
(2, 2, 'ddeshdon', '$2y$10$S6C4VRNMKmhR1ptwGz5.2Ogc84Yw3HAZ81Gf9UQZMufxAs.ZE0H7G', 'deshdon@gmail.com', 'deshdon'),
(22, 1, 'dehsodn', '$2y$10$yY3DZvTw8BzthXzYtjI0SO5ro54XP5fzHsKVMoGwe0qlKLdSlE0Ja', 'deshdon77@gmail.com', 'deshdon'),
(23, 1, 'dehsodn', '$2y$10$TlAmJZSm77l9QI3VdWkQc.8WZs4N.ONKwAH2uEKQ/R2JsJ1okWqta', 'deshdon77@gmail.com', 'deshdon'),
(24, 1, 'dadad', '$2y$10$pcjzgUBV6k84.Gkz.zetSujFnlZg8.laBJGpT9/11pa624Yl.6x1y', 'test2@gmail.com', 'dwaad'),
(25, 1, 'desh2', '$2y$10$aL.hGpCyfDaO32i5sQcg4uoULhCjW5zmE1gk9CvLD.GOVycsdaKye', 'deshdon88@gmail.com', 'desh'),
(26, 1, 'test', '$2y$10$74mZ.noDXkGJ0ilMI1wmw.Wdkw6jBBWxnBKOU9o4iDeEZtNFcp6Ge', 'test99@gmail.com', 'test'),
(27, 1, 'dawad', '$2y$10$9PIx8imuXLT0u0mbQsfW5uZ1OMRj.CgvS6X2bIAe.dOvqkeavGXlG', 'tututu@gmail.com', 'dwaada'),
(28, 1, 'dwadawd', '$2y$10$tEcNg6u/tp8ozYz53PkgJe.TeRFEscX7OZZC2qjXqq.KzKnNFt3iC', 'dioadaih@gmail.com', 'dada'),
(29, 1, 'dawad', '$2y$10$2UEXPEWU/QZrVyTL/zI1buXC8t9Gc5nbP6tiqJw86nq3JxlHEcAQ2', 'nat@gmail.com', 'dwadada'),
(30, 1, 'test', '$2y$10$bXp/xo7uBW3VwbyY317ejuViXeTU19rKmjXXzJrKUc98pe035RcSG', 'test3@gmail.com', 'real test'),
(31, 1, 'test11', '$2y$10$0GWWORZb5w4b3nxZX5ihf.7UiTS.GDVgLQ3lKqhq71LBm3/lXzTCG', 'test23@gmail.com', 'test'),
(32, 1, 'ddeshdon', '$2y$10$AGOWEoSrHq2G5/SeCX3GS.sW/hlOgWw.wEcF5YLM1j3Kz8T0gJd.u', 'deshdon99@gmail.com', 'deshdon'),
(33, 1, 'testing123', '$2y$10$cYawBfzcQS5aQx469tIpkOeHWakz2SHJtvJm3pOBO4FR8D1ljkveK', 'realtest@gmail.com', 'testing'),
(34, 1, 'realtest', '$2y$10$6cipDBLfDZYCeTwwevS49.cS2lyFQE1DlZ0FuW8/v24lSOkjOU1Fy', 'realtest2@gmail.com', 'realtest'),
(37, 1, 'kumacat', '$2y$10$uiG17tVNi1F8yuh0hDUGAe2FAZDQ7c2dPShMzhPT.IdHxLsMVxfCS', 'kuma@gmail.com', 'kuma'),
(38, 1, 'punchzy', '$2y$10$gzU/GOjYKrHVzyBoI5KOLu5PkpLULpcRb.egJfCR4Ue6jWTYC/.ee', 'punchzy@gmail.com', 'EPunch');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_view`
-- (See below for the actual view)
--
CREATE TABLE `user_view` (
`ID` int
,`Name` varchar(70)
,`Species` varchar(70)
,`Breed` varchar(70)
,`Age` varchar(70)
,`Gender` varchar(70)
,`is_adopted` tinyint(1)
,`Description` varchar(3000)
,`is_vaccinated` tinyint(1)
,`PhotoPath` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `user_view`
--
DROP TABLE IF EXISTS `user_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_view`  AS SELECT `pet`.`ID` AS `ID`, `pet`.`Name` AS `Name`, `pet`.`Species` AS `Species`, `pet`.`Breed` AS `Breed`, `pet`.`Age` AS `Age`, `pet`.`Gender` AS `Gender`, `pet`.`is_adopted` AS `is_adopted`, `pet`.`Description` AS `Description`, `pet`.`is_vaccinated` AS `is_vaccinated`, `pet`.`PhotoPath` AS `PhotoPath` FROM `pet` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoption_request`
--
ALTER TABLE `adoption_request`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- Indexes for table `adoption_status`
--
ALTER TABLE `adoption_status`
  ADD KEY `adoption_request_id` (`adoption_request_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `pet_ID` (`pet_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `role_ID` (`role_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoption_request`
--
ALTER TABLE `adoption_request`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pet`
--
ALTER TABLE `pet`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoption_request`
--
ALTER TABLE `adoption_request`
  ADD CONSTRAINT `adoption_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `adoption_request_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `adoption_status`
--
ALTER TABLE `adoption_status`
  ADD CONSTRAINT `adoption_status_ibfk_1` FOREIGN KEY (`adoption_request_id`) REFERENCES `adoption_request` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `adoption_status_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `adoption_status_ibfk_3` FOREIGN KEY (`pet_ID`) REFERENCES `pet` (`ID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_ID`) REFERENCES `role` (`role_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
