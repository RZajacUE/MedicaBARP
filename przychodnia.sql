-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 11, 2024 at 11:09 AM
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
  `IdLekarza` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `wizyty`
--

INSERT INTO `wizyty` (`IdWizyty`, `DataWizyty`, `IdPacjenta`, `IdLekarza`) VALUES
(1, '2024-02-12 08:00:00', NULL, 1),
(2, '2024-02-12 09:00:00', NULL, 1),
(3, '2024-02-12 10:00:00', NULL, 1),
(4, '2024-02-12 11:00:00', NULL, 1),
(5, '2024-02-12 12:00:00', NULL, 1),
(6, '2024-02-12 13:00:00', NULL, 1),
(7, '2024-02-12 14:00:00', NULL, 1),
(8, '2024-02-12 15:00:00', NULL, 1),
(9, '2024-02-12 08:00:00', NULL, 2);

--
-- Indeksy dla zrzutów tabel
--

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
  MODIFY `IdWizyty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
