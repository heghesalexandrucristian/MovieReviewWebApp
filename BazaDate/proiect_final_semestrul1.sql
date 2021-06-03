-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2021 at 10:25 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proiect_final_semestrul1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `testare` (IN `idtest` INT(20))  NO SQL
BEGIN
INSERT INTO date_utilizator(idutilizator,adresa_avatar,nr_comentarii) VALUES(idtest,'https://st.depositphotos.com/2218212/2938/i/600/depositphotos_29387653-stock-photo-facebook-profile.jpg',0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `toti utilizatorii` ()  NO SQL
BEGIN
SELECT * from utilizatori;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Utilizatori si date` ()  NO SQL
BEGIN
select utilizatori.cont,utilizatori.email,utilizatori.inregistratla,date_utilizator.adresa_avatar
from utilizatori
join date_utilizator on date_utilizator.idutilizator=utilizatori.id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `utilizatori si rolul lor` ()  NO SQL
begin 
select utilizatori.cont,roluri.slug,utilizatori.email,utilizatori.inregistratla,
utilizatori.ultimalogare
from utilizatori
join roluri on utilizatori.rolid=roluri.id;
end$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `functie1` (`intrare` VARCHAR(20)) RETURNS VARCHAR(500) CHARSET utf8mb4 NO SQL
BEGIN
DECLARE name VARCHAR(500);
update utilizatori set parola=PASSWORD(parola)
where utilizatori.cont=intrare;
return "SUCCESSFUL";
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FUNCTIEduratadelaultimalogare` (`intrare` VARCHAR(20)) RETURNS INT(20) NO SQL
BEGIN
DECLARE test INT(20);
select YEAR(CURRENT_DATE())- YEAR(ultimalogare) INTO test from utilizatori
where utilizatori.cont=intrare;
RETURN test;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `admini si datele lor`
-- (See below for the actual view)
--
CREATE TABLE `admini si datele lor` (
`cont` char(20)
,`nume` varchar(50)
,`email` varchar(50)
,`adresa_avatar` varchar(500)
,`nr_comentarii` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `date_utilizator`
--

CREATE TABLE `date_utilizator` (
  `idutilizator` bigint(20) NOT NULL,
  `adresa_avatar` varchar(500) NOT NULL,
  `nr_comentarii` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `date_utilizator`
--

INSERT INTO `date_utilizator` (`idutilizator`, `adresa_avatar`, `nr_comentarii`) VALUES
(1, 'https://i.pinimg.com/originals/47/0e/f8/470ef850ead81a0bb4f4cf69a0de2e99.jpg', 0),
(2, 'https://w7.pngwing.com/pngs/66/227/png-transparent-rustin-cohle-television-show-fan-art-true-detective-poster-simple-black-and-white-beach-head-television-beach-white.png', 0),
(8, 'https://i.imgur.com/i2N7VWY.jpg', 0),
(14, 'https://st.depositphotos.com/2101611/3925/v/600/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg', 0),
(15, 'https://st.depositphotos.com/2101611/3925/v/600/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permisiuni`
--

CREATE TABLE `permisiuni` (
  `id` bigint(20) NOT NULL,
  `titlu` varchar(75) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `descriere` tinytext DEFAULT NULL,
  `activ` tinyint(1) NOT NULL DEFAULT 0,
  `creatLa` datetime NOT NULL,
  `modificatLa` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permisiuni`
--

INSERT INTO `permisiuni` (`id`, `titlu`, `slug`, `descriere`, `activ`, `creatLa`, `modificatLa`) VALUES
(10, 'view', 'view', NULL, 1, '2021-01-01 00:00:00', '2021-05-20 17:09:44'),
(11, 'edit', 'e', NULL, 1, '2021-02-02 00:00:00', '2021-05-20 17:10:01'),
(12, 'add', 'a', NULL, 1, '2021-03-03 00:00:00', '2021-05-20 17:10:25'),
(13, 'delete', 'd', NULL, 1, '2021-05-20 16:46:13', '2021-05-20 16:46:13');

-- --------------------------------------------------------

--
-- Table structure for table `ratings_utilizator`
--

CREATE TABLE `ratings_utilizator` (
  `idutilizator` bigint(20) NOT NULL,
  `idfilm` bigint(50) NOT NULL,
  `rating` int(10) NOT NULL,
  `nrreview` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ratings_utilizator`
--

INSERT INTO `ratings_utilizator` (`idutilizator`, `idfilm`, `rating`, `nrreview`) VALUES
(8, 335984, 5, 1),
(14, 337404, 1, 2),
(8, 399566, 1, 3),
(8, 615457, 4, 4),
(14, 635302, 3, 5),
(8, 791373, 2, 6),
(14, 615457, 5, 7),
(8, 527774, 5, 8),
(8, 635302, 3, 9),
(8, 586047, 3, 10),
(14, 791373, 4, 11),
(14, 527774, 4, 12),
(8, 567189, 3, 13),
(8, 632357, 1, 14),
(8, 823855, 4, 15),
(15, 337404, 2, 16),
(15, 691179, 4, 17),
(15, 823855, 3, 18);

-- --------------------------------------------------------

--
-- Table structure for table `roluri`
--

CREATE TABLE `roluri` (
  `id` bigint(20) NOT NULL,
  `titlurol` char(75) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `descriere` char(100) NOT NULL,
  `activ` int(1) NOT NULL DEFAULT 0,
  `creatla` datetime NOT NULL,
  `modificat` datetime NOT NULL,
  `continut` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roluri`
--

INSERT INTO `roluri` (`id`, `titlurol`, `slug`, `descriere`, `activ`, `creatla`, `modificat`, `continut`) VALUES
(1, 'normaluser', 'normal', 'test', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(2, 'poweruser', 'power', '', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(3, 'admin', 'admin', '', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(4, 'admin+', 'admin+', '', 0, '2021-05-20 16:55:07', '2021-05-20 16:55:07', '');

-- --------------------------------------------------------

--
-- Table structure for table `roluri_permisiuni`
--

CREATE TABLE `roluri_permisiuni` (
  `rolid` bigint(20) NOT NULL,
  `idpermisiuni` bigint(20) NOT NULL,
  `creatLa` datetime NOT NULL,
  `modificatLa` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roluri_permisiuni`
--

INSERT INTO `roluri_permisiuni` (`rolid`, `idpermisiuni`, `creatLa`, `modificatLa`) VALUES
(1, 10, '2018-01-01 00:00:00', NULL),
(2, 11, '2019-02-02 00:00:00', NULL),
(3, 12, '2019-02-03 00:00:00', NULL),
(4, 13, '2021-05-20 16:56:41', '2021-05-20 16:56:41'),
(2, 10, '0000-00-00 00:00:00', NULL),
(3, 10, '2021-05-20 17:12:59', '2021-05-20 17:12:59'),
(3, 11, '2021-05-20 17:12:59', '2021-05-20 17:12:59'),
(4, 10, '2021-05-20 17:14:05', '2021-05-20 17:14:05'),
(4, 11, '2021-05-20 17:14:05', '2021-05-20 17:14:05'),
(4, 12, '2021-05-20 17:14:28', '2021-05-20 17:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `utilizatori`
--

CREATE TABLE `utilizatori` (
  `id` bigint(20) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `prenume` varchar(50) DEFAULT NULL,
  `nume` varchar(50) DEFAULT NULL,
  `nrtelefon` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `parola` varchar(500) NOT NULL,
  `inregistratla` datetime NOT NULL,
  `ultimalogare` datetime DEFAULT NULL,
  `cont` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilizatori`
--

INSERT INTO `utilizatori` (`id`, `rolid`, `prenume`, `nume`, `nrtelefon`, `email`, `parola`, `inregistratla`, `ultimalogare`, `cont`) VALUES
(1, 1, 'test', 'test2', NULL, NULL, '$2y$10$iCXLWv0tu3aJtDrxSBqAg.IouWvMu/yXGZn/5pUN6er5ZER57uYpC', '0000-00-00 00:00:00', NULL, 'test123'),
(2, 3, NULL, 'alex', '0123456789', 'test@test123', '*92B208212008731A43A3C462C7B4F6F317FDCB93', '2021-05-16 14:10:17', '2011-12-13 01:02:13', 'test4'),
(4, 1, NULL, 'alex', '0123456789', 'test@test123', '1234567890', '0000-00-00 00:00:00', NULL, 'test5'),
(8, 3, NULL, NULL, NULL, 'admin@admin', '$2y$10$.9oY3IpFmxvQBq.ElX8JeuZXFOg1Oc8rT6oRCCjXBfBvpoL1p0mja', '0000-00-00 00:00:00', '2021-06-03 12:46:35', 'admin'),
(14, 1, 'cristian', 'alexandru', '1234567890', 'test@test.com', '$2y$10$K4p1qiSijZyN9wBF7K4VMugz8jTRBsXre7jZlne0tY7RwAkXfCdTC', '2021-05-28 07:55:51', '2021-05-28 08:29:43', 'amuitatparola'),
(15, 1, 'Cristian', 'Alex', '1234567890', 'documentatie@test.com', '$2y$10$EZavuh2kauM1gP9NICeJKe5yc8WRF6nnuba3Bnj/WrMolOJ3QDCK.', '2021-06-03 11:01:48', '2021-06-03 11:05:28', 'documentatie');

-- --------------------------------------------------------

--
-- Stand-in structure for view `utilizatori inregistrati dupa 2019`
-- (See below for the actual view)
--
CREATE TABLE `utilizatori inregistrati dupa 2019` (
`cont` char(20)
,`email` varchar(50)
,`inregistratla` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `utilizatori si avatarul lor`
-- (See below for the actual view)
--
CREATE TABLE `utilizatori si avatarul lor` (
`cont` char(20)
,`email` varchar(50)
,`adresa_avatar` varchar(500)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `utilizatori si permisiunile acestora`
-- (See below for the actual view)
--
CREATE TABLE `utilizatori si permisiunile acestora` (
`cont` char(20)
,`email` varchar(50)
,`slug` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `utilizatori si rangul lor`
-- (See below for the actual view)
--
CREATE TABLE `utilizatori si rangul lor` (
`cont` char(20)
,`email` varchar(50)
,`titlurol` char(75)
);

-- --------------------------------------------------------

--
-- Structure for view `admini si datele lor`
--
DROP TABLE IF EXISTS `admini si datele lor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `admini si datele lor`  AS SELECT `utilizatori`.`cont` AS `cont`, `utilizatori`.`nume` AS `nume`, `utilizatori`.`email` AS `email`, `date_utilizator`.`adresa_avatar` AS `adresa_avatar`, `date_utilizator`.`nr_comentarii` AS `nr_comentarii` FROM (`utilizatori` join `date_utilizator` on(`utilizatori`.`id` = `date_utilizator`.`idutilizator`)) WHERE `utilizatori`.`rolid` = 3 ;

-- --------------------------------------------------------

--
-- Structure for view `utilizatori inregistrati dupa 2019`
--
DROP TABLE IF EXISTS `utilizatori inregistrati dupa 2019`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `utilizatori inregistrati dupa 2019`  AS SELECT `utilizatori`.`cont` AS `cont`, `utilizatori`.`email` AS `email`, `utilizatori`.`inregistratla` AS `inregistratla` FROM `utilizatori` WHERE `utilizatori`.`inregistratla` > 2019 - 0 - 0 ;

-- --------------------------------------------------------

--
-- Structure for view `utilizatori si avatarul lor`
--
DROP TABLE IF EXISTS `utilizatori si avatarul lor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `utilizatori si avatarul lor`  AS SELECT `utilizatori`.`cont` AS `cont`, `utilizatori`.`email` AS `email`, `date_utilizator`.`adresa_avatar` AS `adresa_avatar` FROM (`utilizatori` join `date_utilizator` on(`utilizatori`.`id` = `date_utilizator`.`idutilizator`)) ;

-- --------------------------------------------------------

--
-- Structure for view `utilizatori si permisiunile acestora`
--
DROP TABLE IF EXISTS `utilizatori si permisiunile acestora`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `utilizatori si permisiunile acestora`  AS SELECT `utilizatori`.`cont` AS `cont`, `utilizatori`.`email` AS `email`, `permisiuni`.`slug` AS `slug` FROM ((`utilizatori` join `roluri_permisiuni` on(`utilizatori`.`rolid` = `roluri_permisiuni`.`rolid`)) join `permisiuni` on(`roluri_permisiuni`.`idpermisiuni` = `permisiuni`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `utilizatori si rangul lor`
--
DROP TABLE IF EXISTS `utilizatori si rangul lor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `utilizatori si rangul lor`  AS SELECT `utilizatori`.`cont` AS `cont`, `utilizatori`.`email` AS `email`, `roluri`.`titlurol` AS `titlurol` FROM (`utilizatori` join `roluri` on(`utilizatori`.`rolid` = `roluri`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `date_utilizator`
--
ALTER TABLE `date_utilizator`
  ADD UNIQUE KEY `idutilizator` (`idutilizator`);

--
-- Indexes for table `permisiuni`
--
ALTER TABLE `permisiuni`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `ratings_utilizator`
--
ALTER TABLE `ratings_utilizator`
  ADD PRIMARY KEY (`nrreview`),
  ADD KEY `idutilizator` (`idutilizator`);

--
-- Indexes for table `roluri`
--
ALTER TABLE `roluri`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `roluri_permisiuni`
--
ALTER TABLE `roluri_permisiuni`
  ADD KEY `idpermisiuni` (`idpermisiuni`),
  ADD KEY `rolid` (`rolid`) USING BTREE;

--
-- Indexes for table `utilizatori`
--
ALTER TABLE `utilizatori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cont` (`cont`),
  ADD KEY `rolid` (`rolid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ratings_utilizator`
--
ALTER TABLE `ratings_utilizator`
  MODIFY `nrreview` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `roluri`
--
ALTER TABLE `roluri`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `utilizatori`
--
ALTER TABLE `utilizatori`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `date_utilizator`
--
ALTER TABLE `date_utilizator`
  ADD CONSTRAINT `date_utilizator_ibfk_1` FOREIGN KEY (`idutilizator`) REFERENCES `utilizatori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings_utilizator`
--
ALTER TABLE `ratings_utilizator`
  ADD CONSTRAINT `ratings_utilizator_ibfk_1` FOREIGN KEY (`idutilizator`) REFERENCES `utilizatori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roluri_permisiuni`
--
ALTER TABLE `roluri_permisiuni`
  ADD CONSTRAINT `roluri_permisiuni_ibfk_1` FOREIGN KEY (`idpermisiuni`) REFERENCES `permisiuni` (`id`),
  ADD CONSTRAINT `roluri_permisiuni_ibfk_2` FOREIGN KEY (`rolid`) REFERENCES `roluri` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `utilizatori`
--
ALTER TABLE `utilizatori`
  ADD CONSTRAINT `utilizatori_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `roluri_permisiuni` (`rolid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
