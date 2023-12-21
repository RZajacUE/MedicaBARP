-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2023 at 08:09 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `przychodnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `karty_pacjentow`
--

CREATE TABLE `karty_pacjentow` (
  `IdKarty` int(11) NOT NULL,
  `IdPacjenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekarze`
--

CREATE TABLE `lekarze` (
  `IdLekarza` int(11) NOT NULL,
  `Imie` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `Specjalizacja` varchar(255) DEFAULT NULL,
  `NrLicencjiLekarskiej` varchar(20) DEFAULT NULL,
  `IdPokoju` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `lekarze`
--

INSERT INTO `lekarze` (`IdLekarza`, `Imie`, `Nazwisko`, `Specjalizacja`, `NrLicencjiLekarskiej`, `IdPokoju`) VALUES
(1, 'Adam', 'Nowak', 'Kardiolog', 'L12345', 1),
(2, 'Ewa', 'Kowalska', 'Dermatolog', 'L54321', 2),
(3, 'Marek', 'Wójcik', 'Ortopeda', 'L98765', 3),
(4, 'Anna', 'Lis', 'Neurolog', 'L45678', 4),
(5, 'Jan', 'Kaczor', 'Ginekolog', 'L87654', 5),
(6, 'Karolina', 'Jankowska', 'Pediatra', 'L23456', 6),
(7, 'Piotr', 'Wiśniewski', 'Chirurg', 'L65432', 7),
(8, 'Alicja', 'Duda', 'Internista', 'L76543', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjenci`
--

CREATE TABLE `pacjenci` (
  `IdPacjenta` int(11) NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Pesel` varchar(11) NOT NULL,
  `DataUrodzenia` date NOT NULL,
  `NumerTel` int(9) DEFAULT NULL,
  `Haslo` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Plec` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pacjenci`
--

INSERT INTO `pacjenci` (`IdPacjenta`, `Imie`, `Nazwisko`, `Pesel`, `DataUrodzenia`, `NumerTel`, `Haslo`, `Email`, `Plec`) VALUES
(1, 'Jan', 'Kowalski', '12345678901', '1980-05-15', 123456789, 'UeKat11!', 'UeKat1@gmail.com', 'M'),
(2, 'Anna', 'Nowak', '98765432109', '1995-08-20', 987654321, 'UeKat22!', 'UeKat2@gmail.com', 'K'),
(3, 'Marek', 'Wiśniewski', '56789012345', '1976-12-10', 567890123, 'UeKat33!', 'UeKat3@gmail.com', 'M'),
(4, 'Ewa', 'Jankowska', '34567890123', '1990-03-25', 345678901, 'UeKat44!', 'UeKat4@gmail.com', 'K'),
(5, 'Piotr', 'Kowalczyk', '78901234567', '1985-09-08', 789012345, 'UeKat55!', 'UeKat5@gmail.com', 'M'),
(6, 'Alicja', 'Lis', '45678901234', '2000-07-30', 456789012, 'UeKat66!', 'UeKat6@gmail.com', 'K'),
(7, 'Kamil', 'Kaczor', '23456789012', '1972-01-14', 234567890, 'UeKat77!', 'UeKat7@gmail.com', 'M'),
(8, 'Karolina', 'Wójcik', '65432109876', '1988-11-05', 654321098, 'UeKat88!', 'UeKat8@gmail.com', 'K'),
(9, 'Wojciech', 'Nowicki', '87654321098', '1993-04-18', 876543210, 'UeKat99!', 'UeKat9@gmail.com', 'M'),
(10, 'Magdalena', 'Duda', '11223344556', '1974-06-22', 112233445, 'UeKat00!', 'UeKat10@gmail.com', 'K');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoje`
--

CREATE TABLE `pokoje` (
  `IdPokoju` int(11) NOT NULL,
  `NumerPokoju` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pokoje`
--

INSERT INTO `pokoje` (`IdPokoju`, `NumerPokoju`) VALUES
(1, 101),
(2, 102),
(3, 201),
(4, 202),
(5, 301),
(6, 302),
(7, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wizyty`
--

CREATE TABLE `wizyty` (
  `IdWizyty` int(11) NOT NULL,
  `DataWizyty` datetime DEFAULT NULL,
  `IdPacjenta` int(11) DEFAULT NULL,
  `IdLekarza` int(11) DEFAULT NULL,
  `IdKarty` int(11) DEFAULT NULL,
  `IdPokoju` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `wizyty`
--

INSERT INTO `wizyty` (`IdWizyty`, `DataWizyty`, `IdPacjenta`, `IdLekarza`, `IdKarty`, `IdPokoju`) VALUES
(1, '2024-02-12 08:00:00', NULL, 1, NULL, NULL),
(2, '2024-02-12 09:00:00', NULL, 1, NULL, NULL),
(3, '2024-02-12 10:00:00', NULL, 1, NULL, NULL),
(4, '2024-02-12 11:00:00', NULL, 1, NULL, NULL),
(5, '2024-02-12 12:00:00', NULL, 1, NULL, NULL),
(6, '2024-02-12 13:00:00', NULL, 1, NULL, NULL),
(7, '2024-02-12 14:00:00', NULL, 1, NULL, NULL),
(8, '2024-02-12 15:00:00', NULL, 1, NULL, NULL),
(9, '2024-02-12 08:00:00', NULL, 2, NULL, NULL),
(10, '2024-02-12 09:00:00', NULL, 2, NULL, NULL),
(11, '2024-02-12 10:00:00', NULL, 2, NULL, NULL),
(12, '2024-02-12 11:00:00', NULL, 2, NULL, NULL),
(13, '2024-02-12 12:00:00', NULL, 2, NULL, NULL),
(14, '2024-02-12 13:00:00', NULL, 2, NULL, NULL),
(15, '2024-02-12 14:00:00', NULL, 2, NULL, NULL),
(16, '2024-02-12 15:00:00', NULL, 2, NULL, NULL),
(17, '2024-02-12 08:00:00', NULL, 3, NULL, NULL),
(18, '2024-02-12 09:00:00', NULL, 3, NULL, NULL),
(19, '2024-02-12 10:00:00', NULL, 3, NULL, NULL),
(20, '2024-02-12 11:00:00', NULL, 3, NULL, NULL),
(21, '2024-02-12 12:00:00', NULL, 3, NULL, NULL),
(22, '2024-02-12 13:00:00', NULL, 3, NULL, NULL),
(23, '2024-02-12 14:00:00', NULL, 3, NULL, NULL),
(24, '2024-02-12 15:00:00', NULL, 3, NULL, NULL),
(25, '2024-02-12 08:00:00', NULL, 4, NULL, NULL),
(26, '2024-02-12 09:00:00', NULL, 4, NULL, NULL),
(27, '2024-02-12 10:00:00', NULL, 4, NULL, NULL),
(28, '2024-02-12 11:00:00', NULL, 4, NULL, NULL),
(29, '2024-02-12 12:00:00', NULL, 4, NULL, NULL),
(30, '2024-02-12 13:00:00', NULL, 4, NULL, NULL),
(31, '2024-02-12 14:00:00', NULL, 4, NULL, NULL),
(32, '2024-02-12 15:00:00', NULL, 4, NULL, NULL),
(33, '2024-02-12 08:00:00', NULL, 5, NULL, NULL),
(34, '2024-02-12 09:00:00', NULL, 5, NULL, NULL),
(35, '2024-02-12 10:00:00', NULL, 5, NULL, NULL),
(36, '2024-02-12 11:00:00', NULL, 5, NULL, NULL),
(37, '2024-02-12 12:00:00', NULL, 5, NULL, NULL),
(38, '2024-02-12 13:00:00', NULL, 5, NULL, NULL),
(39, '2024-02-12 14:00:00', NULL, 5, NULL, NULL),
(40, '2024-02-12 15:00:00', NULL, 5, NULL, NULL),
(41, '2024-02-12 08:00:00', NULL, 6, NULL, NULL),
(42, '2024-02-12 09:00:00', NULL, 6, NULL, NULL),
(43, '2024-02-12 10:00:00', NULL, 6, NULL, NULL),
(44, '2024-02-12 11:00:00', NULL, 6, NULL, NULL),
(45, '2024-02-12 12:00:00', NULL, 6, NULL, NULL),
(46, '2024-02-12 13:00:00', NULL, 6, NULL, NULL),
(47, '2024-02-12 14:00:00', NULL, 6, NULL, NULL),
(48, '2024-02-12 15:00:00', NULL, 6, NULL, NULL),
(49, '2024-02-12 08:00:00', NULL, 7, NULL, NULL),
(50, '2024-02-12 09:00:00', NULL, 7, NULL, NULL),
(51, '2024-02-12 10:00:00', NULL, 7, NULL, NULL),
(52, '2024-02-12 11:00:00', NULL, 7, NULL, NULL),
(53, '2024-02-12 12:00:00', NULL, 7, NULL, NULL),
(54, '2024-02-12 13:00:00', NULL, 7, NULL, NULL),
(55, '2024-02-12 14:00:00', NULL, 7, NULL, NULL),
(56, '2024-02-12 15:00:00', NULL, 7, NULL, NULL),
(57, '2024-02-12 08:00:00', NULL, 8, NULL, NULL),
(58, '2024-02-12 09:00:00', NULL, 8, NULL, NULL),
(59, '2024-02-12 10:00:00', NULL, 8, NULL, NULL),
(60, '2024-02-12 11:00:00', NULL, 8, NULL, NULL),
(61, '2024-02-12 12:00:00', NULL, 8, NULL, NULL),
(62, '2024-02-12 13:00:00', NULL, 8, NULL, NULL),
(63, '2024-02-12 14:00:00', NULL, 8, NULL, NULL),
(64, '2024-02-12 15:00:00', NULL, 8, NULL, NULL),
(65, '2024-02-14 08:00:00', NULL, 1, NULL, NULL),
(66, '2024-02-14 09:00:00', NULL, 1, NULL, NULL),
(67, '2024-02-14 10:00:00', NULL, 1, NULL, NULL),
(68, '2024-02-14 11:00:00', NULL, 1, NULL, NULL),
(69, '2024-02-14 12:00:00', NULL, 1, NULL, NULL),
(70, '2024-02-14 13:00:00', NULL, 1, NULL, NULL),
(71, '2024-02-14 14:00:00', NULL, 1, NULL, NULL),
(72, '2024-02-14 08:00:00', NULL, 2, NULL, NULL),
(73, '2024-02-14 09:00:00', NULL, 2, NULL, NULL),
(74, '2024-02-14 10:00:00', NULL, 2, NULL, NULL),
(75, '2024-02-14 11:00:00', NULL, 2, NULL, NULL),
(76, '2024-02-14 12:00:00', NULL, 2, NULL, NULL),
(77, '2024-02-14 13:00:00', NULL, 2, NULL, NULL),
(78, '2024-02-14 14:00:00', NULL, 2, NULL, NULL),
(79, '2024-02-14 08:00:00', NULL, 3, NULL, NULL),
(80, '2024-02-14 09:00:00', NULL, 3, NULL, NULL),
(81, '2024-02-14 10:00:00', NULL, 3, NULL, NULL),
(82, '2024-02-14 11:00:00', NULL, 3, NULL, NULL),
(83, '2024-02-14 12:00:00', NULL, 3, NULL, NULL),
(84, '2024-02-14 13:00:00', NULL, 3, NULL, NULL),
(85, '2024-02-14 14:00:00', NULL, 3, NULL, NULL),
(86, '2024-02-14 08:00:00', NULL, 4, NULL, NULL),
(87, '2024-02-14 09:00:00', NULL, 4, NULL, NULL),
(88, '2024-02-14 10:00:00', NULL, 4, NULL, NULL),
(89, '2024-02-14 11:00:00', NULL, 4, NULL, NULL),
(90, '2024-02-14 12:00:00', NULL, 4, NULL, NULL),
(91, '2024-02-14 13:00:00', NULL, 4, NULL, NULL),
(92, '2024-02-14 14:00:00', NULL, 4, NULL, NULL),
(93, '2024-02-14 08:00:00', NULL, 5, NULL, NULL),
(94, '2024-02-14 09:00:00', NULL, 5, NULL, NULL),
(95, '2024-02-14 10:00:00', NULL, 5, NULL, NULL),
(96, '2024-02-14 11:00:00', NULL, 5, NULL, NULL),
(97, '2024-02-14 12:00:00', NULL, 5, NULL, NULL),
(98, '2024-02-14 13:00:00', NULL, 5, NULL, NULL),
(99, '2024-02-14 14:00:00', NULL, 5, NULL, NULL),
(100, '2024-02-14 08:00:00', NULL, 6, NULL, NULL),
(101, '2024-02-14 09:00:00', NULL, 6, NULL, NULL),
(102, '2024-02-14 10:00:00', NULL, 6, NULL, NULL),
(103, '2024-02-14 11:00:00', NULL, 6, NULL, NULL),
(104, '2024-02-14 12:00:00', NULL, 6, NULL, NULL),
(105, '2024-02-14 13:00:00', NULL, 6, NULL, NULL),
(106, '2024-02-14 14:00:00', NULL, 6, NULL, NULL),
(107, '2024-02-14 08:00:00', NULL, 7, NULL, NULL),
(108, '2024-02-14 09:00:00', NULL, 7, NULL, NULL),
(109, '2024-02-14 10:00:00', NULL, 7, NULL, NULL),
(110, '2024-02-14 11:00:00', NULL, 7, NULL, NULL),
(111, '2024-02-14 12:00:00', NULL, 7, NULL, NULL),
(112, '2024-02-14 13:00:00', NULL, 7, NULL, NULL),
(113, '2024-02-14 14:00:00', NULL, 7, NULL, NULL),
(114, '2024-02-14 08:00:00', NULL, 8, NULL, NULL),
(115, '2024-02-14 09:00:00', NULL, 8, NULL, NULL),
(116, '2024-02-14 10:00:00', NULL, 8, NULL, NULL),
(117, '2024-02-14 11:00:00', NULL, 8, NULL, NULL),
(118, '2024-02-14 12:00:00', NULL, 8, NULL, NULL),
(119, '2024-02-14 13:00:00', NULL, 8, NULL, NULL),
(120, '2024-02-14 14:00:00', NULL, 8, NULL, NULL),
(128, '2024-02-16 08:00:00', NULL, 1, NULL, NULL),
(129, '2024-02-16 09:00:00', NULL, 1, NULL, NULL),
(130, '2024-02-16 10:00:00', NULL, 1, NULL, NULL),
(131, '2024-02-16 11:00:00', NULL, 1, NULL, NULL),
(132, '2024-02-16 12:00:00', NULL, 1, NULL, NULL),
(133, '2024-02-16 13:00:00', NULL, 1, NULL, NULL),
(134, '2024-02-16 14:00:00', NULL, 1, NULL, NULL),
(135, '2024-02-16 08:00:00', NULL, 2, NULL, NULL),
(136, '2024-02-16 09:00:00', NULL, 2, NULL, NULL),
(137, '2024-02-16 10:00:00', NULL, 2, NULL, NULL),
(138, '2024-02-16 11:00:00', NULL, 2, NULL, NULL),
(139, '2024-02-16 12:00:00', NULL, 2, NULL, NULL),
(140, '2024-02-16 13:00:00', NULL, 2, NULL, NULL),
(141, '2024-02-16 14:00:00', NULL, 2, NULL, NULL),
(142, '2024-02-16 08:00:00', NULL, 3, NULL, NULL),
(143, '2024-02-16 09:00:00', NULL, 3, NULL, NULL),
(144, '2024-02-16 10:00:00', NULL, 3, NULL, NULL),
(145, '2024-02-16 11:00:00', NULL, 3, NULL, NULL),
(146, '2024-02-16 12:00:00', NULL, 3, NULL, NULL),
(147, '2024-02-16 13:00:00', NULL, 3, NULL, NULL),
(148, '2024-02-16 14:00:00', NULL, 3, NULL, NULL),
(149, '2024-02-16 08:00:00', NULL, 4, NULL, NULL),
(150, '2024-02-16 09:00:00', NULL, 4, NULL, NULL),
(151, '2024-02-16 10:00:00', NULL, 4, NULL, NULL),
(152, '2024-02-16 11:00:00', NULL, 4, NULL, NULL),
(153, '2024-02-16 12:00:00', NULL, 4, NULL, NULL),
(154, '2024-02-16 13:00:00', NULL, 4, NULL, NULL),
(155, '2024-02-16 14:00:00', NULL, 4, NULL, NULL),
(156, '2024-02-16 08:00:00', NULL, 5, NULL, NULL),
(157, '2024-02-16 09:00:00', NULL, 5, NULL, NULL),
(158, '2024-02-16 10:00:00', NULL, 5, NULL, NULL),
(159, '2024-02-16 11:00:00', NULL, 5, NULL, NULL),
(160, '2024-02-16 12:00:00', NULL, 5, NULL, NULL),
(161, '2024-02-16 13:00:00', NULL, 5, NULL, NULL),
(162, '2024-02-16 14:00:00', NULL, 5, NULL, NULL),
(163, '2024-02-16 08:00:00', NULL, 6, NULL, NULL),
(164, '2024-02-16 09:00:00', NULL, 6, NULL, NULL),
(165, '2024-02-16 10:00:00', NULL, 6, NULL, NULL),
(166, '2024-02-16 11:00:00', NULL, 6, NULL, NULL),
(167, '2024-02-16 12:00:00', NULL, 6, NULL, NULL),
(168, '2024-02-16 13:00:00', NULL, 6, NULL, NULL),
(169, '2024-02-16 14:00:00', NULL, 6, NULL, NULL),
(170, '2024-02-16 08:00:00', NULL, 7, NULL, NULL),
(171, '2024-02-16 09:00:00', NULL, 7, NULL, NULL),
(172, '2024-02-16 10:00:00', NULL, 7, NULL, NULL),
(173, '2024-02-16 11:00:00', NULL, 7, NULL, NULL),
(174, '2024-02-16 12:00:00', NULL, 7, NULL, NULL),
(175, '2024-02-16 13:00:00', NULL, 7, NULL, NULL),
(176, '2024-02-16 14:00:00', NULL, 7, NULL, NULL),
(177, '2024-02-16 08:00:00', NULL, 8, NULL, NULL),
(178, '2024-02-16 09:00:00', NULL, 8, NULL, NULL),
(179, '2024-02-16 10:00:00', NULL, 8, NULL, NULL),
(180, '2024-02-16 11:00:00', NULL, 8, NULL, NULL),
(181, '2024-02-16 12:00:00', NULL, 8, NULL, NULL),
(182, '2024-02-16 13:00:00', NULL, 8, NULL, NULL),
(183, '2024-02-16 14:00:00', NULL, 8, NULL, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `karty_pacjentow`
--
ALTER TABLE `karty_pacjentow`
  ADD PRIMARY KEY (`IdKarty`);

--
-- Indeksy dla tabeli `lekarze`
--
ALTER TABLE `lekarze`
  ADD PRIMARY KEY (`IdLekarza`);

--
-- Indeksy dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`IdPacjenta`),
  ADD UNIQUE KEY `Unique_Pesel` (`Pesel`);

--
-- Indeksy dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  ADD PRIMARY KEY (`IdPokoju`);

--
-- Indeksy dla tabeli `wizyty`
--
ALTER TABLE `wizyty`
  ADD PRIMARY KEY (`IdWizyty`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `karty_pacjentow`
--
ALTER TABLE `karty_pacjentow`
  MODIFY `IdKarty` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lekarze`
--
ALTER TABLE `lekarze`
  MODIFY `IdLekarza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pacjenci`
--
ALTER TABLE `pacjenci`
  MODIFY `IdPacjenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pokoje`
--
ALTER TABLE `pokoje`
  MODIFY `IdPokoju` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wizyty`
--
ALTER TABLE `wizyty`
  MODIFY `IdWizyty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
