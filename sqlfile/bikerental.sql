-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2024 at 01:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikerental`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', '2022-03-18 06:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` datetime DEFAULT NULL,
  `ToDate` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`) VALUES
(14, 'test@gmail.com', 1, '2024-06-09 13:58:00', '2024-06-10 13:58:00', 'i need a bike', 2, '2024-06-10 10:58:57'),
(15, 'test@gmail.com', 1, '2024-07-15 00:21:00', '2024-07-08 12:21:00', 'i appreciate your services', 0, '2024-07-15 09:22:24'),
(16, 'test@gmail.com', 1, '2024-07-30 09:56:00', '2024-07-31 20:55:00', 'nice service', 0, '2024-07-30 17:57:20'),
(17, 'test@gmail.com', 1, '2024-08-30 10:57:00', '2024-08-31 10:58:00', 'I love your bikes', 0, '2024-08-30 07:58:57'),
(18, 'test@gmail.com', 1, '2024-08-30 12:59:00', '2024-08-31 12:59:00', 'i love your well maintained bikes', 0, '2024-08-30 10:00:14'),
(19, 'test@gmail.com', 1, '2024-08-30 12:59:00', '2024-08-31 12:59:00', 'i love your well maintained bikes', 0, '2024-08-30 10:00:44'),
(20, 'maithyabon2@gmail.com', 1, '2024-09-01 01:19:00', '2024-09-10 01:19:00', 'I would like to rent this bike', 1, '2024-08-31 22:20:12'),
(22, 'maithyabon2@gmail.com', 8, '2024-09-01 02:14:00', '2024-09-05 02:14:00', 'Is the Bike available..?\r\n', 1, '2024-08-31 23:14:50');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(8, 'Atlas', '2024-07-09 19:13:30', NULL),
(9, 'Black Mamba KE', '2024-07-11 00:25:59', NULL),
(13, 'Trek BMX', '2024-08-23 09:42:15', '2024-09-12 04:34:31'),
(26, 'Mountain bike cx5', '2024-07-13 22:04:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(4, 'Tommy Mboya', 'test@gmail.com', '09123456789', 'I would like my entire account to be deleted.', '2024-08-11 17:46:43', 1),
(10, 'Bonface Maithya', 'maithyabon2@gmail.com', '0110007950', 'Can i change my Phone number..?', '2024-08-31 23:25:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '																																																																																										<p class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-family: georgia;\">Welcome to Cyclist Enterprise bike rental System. By using our services, you agree to the following terms\r\nand conditions:<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.25in;text-align:center\"><span style=\"font-family: georgia;\"><b>Eligibility</b><br>\r\nTo rent a bike, you must be at least 18 years old and possess a valid ID.\r\nMinors must be accompanied by an adult.<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.25in;text-align:center\"><span style=\"font-family: georgia;\"><b>Rental\r\nAgreement</b><br>\r\nBy renting a bike, you agree to return the bike in the same condition as it was\r\nprovided. The rental period ends when the bike is returned to a designated\r\nlocation and confirmed by our system.<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-family: georgia;\"><b>Payment</b><br>\r\nPayment for the rental will be charged at the time of booking. All fees are\r\nnon-refundable, and you are responsible for any additional charges incurred\r\nduring your rental period, such as late returns or damages.<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><span style=\"font-family: georgia;\"><b>Use\r\nof Bikes</b><br>\r\nYou agree to use the bike in a safe and responsible manner, adhering to all\r\ntraffic laws and regulations. You must wear a helmet and other safety gear as\r\nrequired by local law. You may not use the bike for any illegal activity or\r\nsublease it to a third party.<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.25in;text-align:center\"><span style=\"font-family: georgia;\"><b>Damage,\r\nLoss, or Theft</b><br>\r\nYou are responsible for any loss, theft, or damage to the bike during your\r\nrental period. If a bike is lost or stolen, you will be charged for the full\r\nreplacement cost. In case of damage, repair costs will be deducted from your\r\ndeposit or charged directly to your account.<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.25in;text-align:center\"><span style=\"font-family: georgia;\"><b>Liability</b><br>\r\n[Your Bike Rental System Name] is not liable for any injuries, accidents, or\r\ndamages that occur during your rental. You assume all risks associated with\r\nusing our bikes and agree to release [Your Bike Rental System Name] from any\r\nliability.<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><span style=\"font-family: georgia;\"><b>Rental\r\nPeriod and Late Returns</b><br>\r\nBikes must be returned by the agreed-upon time. Late returns may incur\r\nadditional fees, charged at an hourly rate. Failure to return a bike within 24\r\nhours of the scheduled return time may be considered theft.<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.25in;text-align:center\"><span style=\"font-family: georgia;\"><b>Cancellation\r\nand Refunds</b><br>\r\nCancellations must be made at least 24 hours before the scheduled rental time\r\nto qualify for a refund. No refunds will be issued for late cancellations or\r\nno-shows.<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><span style=\"font-family: georgia;\"><b>Changes\r\nto Terms and Conditions</b><br>\r\nWe reserve the right to modify these terms and conditions at any time. Any\r\nchanges will be posted on our website and become effective immediately.<o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.25in;text-align:center\"><span style=\"font-family: georgia;\"><b>Privacy\r\nPolicy</b><br>\r\nWe respect your privacy and will only collect and use your personal data in\r\naccordance with our Privacy Policy.</span><o:p></o:p></p>\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										'),
(2, 'Privacy Policy', 'privacy', '<span style=\"font-family: georgia;\">At Cyclist Enterprise, we prioritize your privacy and ensure that your personal information is protected. We collect only the necessary data, such as your name, contact details, payment information, and usage history, to provide our services efficiently. Your data is used to process rentals, verify identity, manage payments, and enhance your experience. We may share your information with third parties only when necessary for payment processing, legal compliance, or security purposes. We do not sell your personal data, and we implement strict measures to safeguard your information against unauthorized access.</span>'),
(3, 'About Us ', 'aboutus', '																																																																																																																																																																										<div><div style=\"text-align: justify;\"><div><p><span style=\"font-family: &quot;times new roman&quot;; font-size: large;\">Welcome to Cycle Enterprise, your trusted partner for convenient and affordable bike rentals. We are committed to promoting eco-friendly transportation by providing reliable bikes for leisure, commuting, or adventure. Our easy-to-use platform allows users to rent bikes seamlessly, ensuring a smooth and enjoyable experience.</span></p><p><span style=\"font-family: &quot;times new roman&quot;; font-size: large;\">At Cycle Enterprise, we prioritize safety, customer satisfaction, and sustainability. Whether you\'re exploring the city or embarking on a scenic ride, our service is designed to meet your needs.</span></p><p><span style=\"font-family: &quot;times new roman&quot;; font-size: large;\">Choose us for your next ride and experience the freedom of cycling like never before.</span></p></div><p><span style=\"font-size: medium;\"><br></span></p><div><div style=\"font-size: small;\"><br></div></div></div></div>\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										'),
(11, 'FAQs', 'faqs', '																																																																																										<div><p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.25in;text-align:center\"><b>How\r\ndo I rent a bike?</b><br>\r\nSimply create an account on our platform, select your preferred bike, choose\r\nyour rental duration, and complete the payment process. You can then pick up\r\nyour bike from the designated location.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><b>What\r\ndo I need to rent a bike?</b><br>\r\nYou need a valid ID, a form of payment (credit card, debit card, etc.), and to\r\nbe at least 18 years old. Minors must be accompanied by an adult.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><b>How\r\nmuch does it cost to rent a bike?</b><br>\r\nRental prices vary depending on the type of bike and the rental duration.\r\nPricing details are available on our website/app when you select a bike.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><b>How\r\nlong can I rent a bike for?</b><br>\r\nYou can rent a bike for as little as one hour or for an extended period of\r\ndays. Rental periods and fees are flexible, so you can choose what suits your\r\nneeds.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><b>What\r\nhappens if I return the bike late?</b><br>\r\nLate returns are subject to additional fees charged on an hourly basis. If you\r\nfail to return the bike within 24 hours of the agreed-upon time, it may be\r\nconsidered theft.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><b>What\r\nshould I do if the bike is damaged during my rental?</b><br>\r\nIf the bike is damaged, please notify us immediately. You are responsible for\r\nany damage caused during your rental period, and repair costs may be charged to\r\nyour account.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><b>Can\r\nI cancel my reservation?</b><br>\r\nYes, cancellations made at least 24 hours before the rental start time are\r\neligible for a refund. Late cancellations or no-shows are not eligible for\r\nrefunds.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><b>Do\r\nI need to wear a helmet?</b><br>\r\nYes, we recommend wearing a helmet for your safety, and it may be legally\r\nrequired in some areas. Helmets may be available as part of your rental\r\npackage.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><b>What\r\nif the bike is stolen while I have it rented?</b><br>\r\nYou are responsible for the bike during the rental period. In case of theft,\r\nyou may be charged the full replacement cost of the bike.<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\" align=\"center\" style=\"margin-left:.5in;text-align:center\"><b>How\r\ndo I contact customer support?</b><br>\r\nYou can reach our customer support team via the contact form on our website,\r\nemail, or by calling our customer service hotline for assistance.<o:p></o:p></p></div>										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubscribers`
--

INSERT INTO `tblsubscribers` (`id`, `SubscriberEmail`, `PostingDate`) VALUES
(4, 'test@gmail.com', '2024-07-03 11:44:51'),
(5, 'email@gmail.com', '2024-07-09 13:03:23'),
(7, 'Maithyabon2@gmail.com', '2024-08-31 23:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(1, 'test@gmail.com', 'It is much easier to pick your favorite bike.', '2024-02-10 07:44:31', 1),
(2, 'test@gmail.com', 'When I needed it most, it was more convenient.', '2024-05-01 07:46:05', 1),
(3, 'email@gmail.com', 'The website saves me a lot of time.', '2024-02-03 11:27:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(4, 'Christine Macira', 'test@gmail.com', '4ba29b9f9e5732ed33761840f4ba6c53', '079829805', '01/12/2002', 'Juja, Kenya', 'Nairobi', 'Kenya', '2023-04-19 20:03:36', '2024-08-28 20:53:59'),
(5, 'Carl Johnson', 'email@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0790998742', '04/11/2004', 'Kajiado, Rongai', 'Kajiado', 'Kenya', '2024-02-03 11:21:11', '2024-08-31 23:02:17'),
(27, 'Bonface Maithya', 'maithyabon2@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0110007950', '2004-02-10', 'Kitengela, Kenya', 'Kajiado', 'Kenya', '2024-08-31 23:12:52', '2024-08-31 23:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `HelmetEquip` int(11) DEFAULT NULL,
  `BikebagEquip` int(11) DEFAULT NULL,
  `PatchkitEquip` int(11) DEFAULT NULL,
  `SparetubeEquip` int(11) DEFAULT NULL,
  `MinimumtoolsEquip` int(11) DEFAULT NULL,
  `PumpEquip` int(11) DEFAULT NULL,
  `TirepressuregaugeEquip` int(11) DEFAULT NULL,
  `WaterbottleEquip` int(11) DEFAULT NULL,
  `LockEquip` int(11) DEFAULT NULL,
  `MirrorEquip` int(11) DEFAULT NULL,
  `FannyEquip` int(11) DEFAULT NULL,
  `CompassEquip` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `Position`, `ModelYear`, `Quantity`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `HelmetEquip`, `BikebagEquip`, `PatchkitEquip`, `SparetubeEquip`, `MinimumtoolsEquip`, `PumpEquip`, `TirepressuregaugeEquip`, `WaterbottleEquip`, `LockEquip`, `MirrorEquip`, `FannyEquip`, `CompassEquip`, `RegDate`, `UpdationDate`) VALUES
(1, 'Golden Super', 8, 'Ready for speed with simple, clean & aero Shimano GRX 1x. Top speed was never this affordable.', 150, 'Available', 2024, 1, 'Exploro RACE GRX 1X (1).jpg', 'Exploro RACE GRX 1X (2).jpg', 'Exploro RACE GRX 1X (3).jpg', 'Exploro RACE GRX 1X (4).jpg', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-06-19 11:46:23', '2024-08-17 19:15:32'),
(8, 'Classic Urban  Bike', 9, 'Do you want a lightweight track bike that won’t break the bank? Then the 6KU Urban Track is the bike for you. Our Urban Track features a lightweight aluminum frame and fork. This is one purchase you won’t regret.\r\n', 150, 'Available', 2024, 1, 'URBAN TRACK BIKE (1).jpg', 'URBAN TRACK BIKE (2).jpg', 'URBAN TRACK BIKE (3).jpg', 'URBAN TRACK BIKE (4).jpg', 'URBAN TRACK BIKE (5).jpg', NULL, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, '2022-03-11 00:34:34', '2024-08-17 19:31:00'),
(39, 'Marlin 7', 13, 'A popular entry-level mountain bike, the Marlin 7 is designed for trail riding. It features an aluminum frame, front suspension (with lockout), a wide range of gears (typically Shimano components), and hydraulic disc brakes. It’s suitable for beginners and intermediate riders who want a reliable bike for off-road adventures.', 150, 'Available', 2024, 3, 'Arktos 120 (1).jpg', 'Arktos 120 (2).jpg', 'Arktos 120 (3).jpg', 'Arktos 120 (4).jpg', '', NULL, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, '2024-03-23 09:49:21', '2024-08-17 19:36:57'),
(56, 'BMX', 13, 'Unleash your thrill-seeker with BMX—where speed meets adrenaline! Whether you’re tearing up the track in high-octane races or pulling off jaw-dropping stunts in the streets and skateparks, BMX offers the ultimate ride. Designed for those who crave adventure, our BMX bikes are built tough for explosive performance and unmatched style. Get ready to dominate the dirt, the ramps, and everything in between. Your next epic ride starts here—are you ready to make every jump, trick, and turn count? Ride BMX, and redefine what’s possible!', 200, 'Available', 2024, 2, 'BMX 1.webp', 'BMX 2.jpg', 'BMX 3.jpg', 'BMX 4.jpg', 'BMX 5.webp', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-17 19:45:59', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
