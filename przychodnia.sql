-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 20, 2023 at 05:08 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

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
  `IdPacjenta` int(11) DEFAULT NULL,
  `HistoriaChorob` text DEFAULT NULL,
  `PrzebytyZabiegi` text DEFAULT NULL,
  `PrzypisaneLeki` text DEFAULT NULL
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
  `NrLicencjiLekarskiej` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `lekarze`
--

INSERT INTO `lekarze` (`IdLekarza`, `Imie`, `Nazwisko`, `Specjalizacja`, `NrLicencjiLekarskiej`) VALUES
(1, 'Adam', 'Nowak', 'Kardiolog', 'L12345'),
(2, 'Ewa', 'Kowalska', 'Dermatolog', 'L54321'),
(3, 'Marek', 'Wójcik', 'Ortopeda', 'L98765'),
(4, 'Anna', 'Lis', 'Neurolog', 'L45678'),
(5, 'Jan', 'Kaczor', 'Ginekolog', 'L87654'),
(6, 'Karolina', 'Jankowska', 'Pediatra', 'L23456'),
(7, 'Piotr', 'Wiśniewski', 'Chirurg', 'L65432'),
(8, 'Alicja', 'Duda', 'Internista', 'L76543');

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
  `NumerTel` varchar(20) DEFAULT NULL,
  `Haslo` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Plec` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pacjenci`
--

INSERT INTO `pacjenci` (`IdPacjenta`, `Imie`, `Nazwisko`, `Pesel`, `DataUrodzenia`, `NumerTel`, `Haslo`, `Email`, `Plec`) VALUES
(1, 'Jan', 'Kowalski', '12345678901', '1980-05-15', '123456789', 'UeKat11!', 'UeKat1@gmail.com', 'Mężczyzna'),
(2, 'Anna', 'Nowak', '98765432109', '1995-08-20', '987654321', 'UeKat22!', 'UeKat2@gmail.com', 'Kobieta'),
(3, 'Marek', 'Wiśniewski', '56789012345', '1976-12-10', '567890123', 'UeKat33!', 'UeKat3@gmail.com', 'Mężczyzna'),
(4, 'Ewa', 'Jankowska', '34567890123', '1990-03-25', '345678901', 'UeKat44!', 'UeKat4@gmail.com', 'Kobieta'),
(5, 'Piotr', 'Kowalczyk', '78901234567', '1985-09-08', '789012345', 'UeKat55!', 'UeKat5@gmail.com', 'Mężczyzna'),
(6, 'Alicja', 'Lis', '45678901234', '2000-07-30', '456789012', 'UeKat66!', 'UeKat6@gmail.com', 'Kobieta'),
(7, 'Kamil', 'Kaczor', '23456789012', '1972-01-14', '234567890', 'UeKat77!', 'UeKat7@gmail.com', 'Mężczyzna'),
(8, 'Karolina', 'Wójcik', '65432109876', '1988-11-05', '654321098', 'UeKat88!', 'UeKat8@gmail.com', 'Kobieta'),
(9, 'Wojciech', 'Nowicki', '87654321098', '1993-04-18', '876543210', 'UeKat99!', 'UeKat9@gmail.com', 'Mężczyzna'),
(10, 'Magdalena', 'Duda', '11223344556', '1974-06-22', '112233445', 'UeKat00!', 'UeKat10@gmail.com', 'Kobieta');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoje`
--

CREATE TABLE `pokoje` (
  `IdPokoju` int(11) NOT NULL,
  `NumerPokoju` int(11) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `IdPrzychodni` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pokoje`
--

INSERT INTO `pokoje` (`IdPokoju`, `NumerPokoju`, `Status`, `IdPrzychodni`) VALUES
(1, 101, 'Wolny', 1),
(2, 102, 'Zajęty', 1),
(3, 201, 'Wolny', 1),
(4, 202, 'Zajęty', 1),
(5, 301, 'Wolny', 1),
(6, 302, 'Wolny', 1);

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
  `IdPokoju` int(11) DEFAULT NULL,
  `IdPrzychodni` int(11) DEFAULT NULL,
  `OpisWizyty` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `wizyty`
--

INSERT INTO `wizyty` (`IdWizyty`, `DataWizyty`, `IdPacjenta`, `IdLekarza`, `IdKarty`, `IdPokoju`, `IdPrzychodni`, `OpisWizyty`) VALUES
(1, '2024-02-12 08:00:00', NULL, 1, NULL, NULL, NULL, NULL),
(2, '2024-02-12 09:00:00', NULL, 1, NULL, NULL, NULL, NULL),
(3, '2024-02-12 10:00:00', NULL, 1, NULL, NULL, NULL, NULL),
(4, '2024-02-12 11:00:00', NULL, 1, NULL, NULL, NULL, NULL),
(5, '2024-02-12 12:00:00', NULL, 1, NULL, NULL, NULL, NULL),
(6, '2024-02-12 13:00:00', NULL, 1, NULL, NULL, NULL, NULL),
(7, '2024-02-12 14:00:00', NULL, 1, NULL, NULL, NULL, NULL),
(8, '2024-02-12 15:00:00', NULL, 1, NULL, NULL, NULL, NULL),
(9, '2024-02-12 08:00:00', NULL, 2, NULL, NULL, NULL, NULL),
(10, '2024-02-12 09:00:00', NULL, 2, NULL, NULL, NULL, NULL),
(11, '2024-02-12 10:00:00', NULL, 2, NULL, NULL, NULL, NULL),
(12, '2024-02-12 11:00:00', NULL, 2, NULL, NULL, NULL, NULL),
(13, '2024-02-12 12:00:00', NULL, 2, NULL, NULL, NULL, NULL),
(14, '2024-02-12 13:00:00', NULL, 2, NULL, NULL, NULL, NULL),
(15, '2024-02-12 14:00:00', NULL, 2, NULL, NULL, NULL, NULL),
(16, '2024-02-12 15:00:00', NULL, 2, NULL, NULL, NULL, NULL),
(17, '2024-02-12 08:00:00', NULL, 3, NULL, NULL, NULL, NULL),
(18, '2024-02-12 09:00:00', NULL, 3, NULL, NULL, NULL, NULL),
(19, '2024-02-12 10:00:00', NULL, 3, NULL, NULL, NULL, NULL),
(20, '2024-02-12 11:00:00', NULL, 3, NULL, NULL, NULL, NULL),
(21, '2024-02-12 12:00:00', NULL, 3, NULL, NULL, NULL, NULL),
(22, '2024-02-12 13:00:00', NULL, 3, NULL, NULL, NULL, NULL),
(23, '2024-02-12 14:00:00', NULL, 3, NULL, NULL, NULL, NULL),
(24, '2024-02-12 15:00:00', NULL, 3, NULL, NULL, NULL, NULL),
(25, '2024-02-12 08:00:00', NULL, 4, NULL, NULL, NULL, NULL),
(26, '2024-02-12 09:00:00', NULL, 4, NULL, NULL, NULL, NULL),
(27, '2024-02-12 10:00:00', NULL, 4, NULL, NULL, NULL, NULL),
(28, '2024-02-12 11:00:00', NULL, 4, NULL, NULL, NULL, NULL),
(29, '2024-02-12 12:00:00', NULL, 4, NULL, NULL, NULL, NULL),
(30, '2024-02-12 13:00:00', NULL, 4, NULL, NULL, NULL, NULL),
(31, '2024-02-12 14:00:00', NULL, 4, NULL, NULL, NULL, NULL),
(32, '2024-02-12 15:00:00', NULL, 4, NULL, NULL, NULL, NULL),
(33, '2024-02-12 08:00:00', NULL, 5, NULL, NULL, NULL, NULL),
(34, '2024-02-12 09:00:00', NULL, 5, NULL, NULL, NULL, NULL),
(35, '2024-02-12 10:00:00', NULL, 5, NULL, NULL, NULL, NULL),
(36, '2024-02-12 11:00:00', NULL, 5, NULL, NULL, NULL, NULL),
(37, '2024-02-12 12:00:00', NULL, 5, NULL, NULL, NULL, NULL),
(38, '2024-02-12 13:00:00', NULL, 5, NULL, NULL, NULL, NULL),
(39, '2024-02-12 14:00:00', NULL, 5, NULL, NULL, NULL, NULL),
(40, '2024-02-12 15:00:00', NULL, 5, NULL, NULL, NULL, NULL),
(41, '2024-02-12 08:00:00', NULL, 6, NULL, NULL, NULL, NULL),
(42, '2024-02-12 09:00:00', NULL, 6, NULL, NULL, NULL, NULL),
(43, '2024-02-12 10:00:00', NULL, 6, NULL, NULL, NULL, NULL),
(44, '2024-02-12 11:00:00', NULL, 6, NULL, NULL, NULL, NULL),
(45, '2024-02-12 12:00:00', NULL, 6, NULL, NULL, NULL, NULL),
(46, '2024-02-12 13:00:00', NULL, 6, NULL, NULL, NULL, NULL),
(47, '2024-02-12 14:00:00', NULL, 6, NULL, NULL, NULL, NULL),
(48, '2024-02-12 15:00:00', NULL, 6, NULL, NULL, NULL, NULL),
(49, '2024-02-12 08:00:00', NULL, 7, NULL, NULL, NULL, NULL),
(50, '2024-02-12 09:00:00', NULL, 7, NULL, NULL, NULL, NULL),
(51, '2024-02-12 10:00:00', NULL, 7, NULL, NULL, NULL, NULL),
(52, '2024-02-12 11:00:00', NULL, 7, NULL, NULL, NULL, NULL),
(53, '2024-02-12 12:00:00', NULL, 7, NULL, NULL, NULL, NULL),
(54, '2024-02-12 13:00:00', NULL, 7, NULL, NULL, NULL, NULL),
(55, '2024-02-12 14:00:00', NULL, 7, NULL, NULL, NULL, NULL),
(56, '2024-02-12 15:00:00', NULL, 7, NULL, NULL, NULL, NULL),
(57, '2024-02-12 08:00:00', NULL, 8, NULL, NULL, NULL, NULL),
(58, '2024-02-12 09:00:00', NULL, 8, NULL, NULL, NULL, NULL),
(59, '2024-02-12 10:00:00', NULL, 8, NULL, NULL, NULL, NULL),
(60, '2024-02-12 11:00:00', NULL, 8, NULL, NULL, NULL, NULL),
(61, '2024-02-12 12:00:00', NULL, 8, NULL, NULL, NULL, NULL),
(62, '2024-02-12 13:00:00', NULL, 8, NULL, NULL, NULL, NULL),
(63, '2024-02-12 14:00:00', NULL, 8, NULL, NULL, NULL, NULL),
(64, '2024-02-12 15:00:00', NULL, 8, NULL, NULL, NULL, NULL);

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
  MODIFY `IdPokoju` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wizyty`
--
ALTER TABLE `wizyty`
  MODIFY `IdWizyty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
