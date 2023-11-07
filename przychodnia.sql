-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 07, 2023 at 08:37 PM
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
-- Struktura tabeli dla tabeli `karty pacjenta`
--

CREATE TABLE `karty pacjenta` (
  `test` int(11) NOT NULL,
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
  `Imie` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `Pesel` varchar(11) DEFAULT NULL,
  `DataUrodzenia` date DEFAULT NULL,
  `Adres` varchar(255) DEFAULT NULL,
  `NumerTel` varchar(20) DEFAULT NULL,
  `IdPacjenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pacjenci`
--

INSERT INTO `pacjenci` (`Imie`, `Nazwisko`, `Pesel`, `DataUrodzenia`, `Adres`, `NumerTel`, `IdPacjenta`) VALUES
('Jan', 'Kowalski', '12345678901', '1980-05-15', 'ul. Kwiatowa 7', '123-456-789', 1),
('Anna', 'Nowak', '98765432109', '1995-08-20', 'ul. Słoneczna 14', '987-654-321', 2),
('Marek', 'Wiśniewski', '56789012345', '1976-12-10', 'ul. Leśna 3', '567-890-123', 3),
('Ewa', 'Jankowska', '34567890123', '1990-03-25', 'ul. Parkowa 11', '345-678-901', 4),
('Piotr', 'Kowalczyk', '78901234567', '1985-09-08', 'ul. Polna 9', '789-012-345', 5),
('Alicja', 'Lis', '45678901234', '2000-07-30', 'ul. Wiosenna 2', '456-789-012', 6),
('Kamil', 'Kaczor', '23456789012', '1972-01-14', 'ul. Główna 4', '234-567-890', 7),
('Karolina', 'Wójcik', '65432109876', '1988-11-05', 'ul. Cicha 8', '654-321-098', 8),
('Wojciech', 'Nowicki', '87654321098', '1993-04-18', 'ul. Zielona 12', '876-543-210', 9),
('Magdalena', 'Duda', '11223344556', '1974-06-22', 'ul. Różana 6', '112-233-445', 10);

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

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `karty pacjenta`
--
ALTER TABLE `karty pacjenta`
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
  ADD PRIMARY KEY (`IdPacjenta`);

--
-- Indeksy dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  ADD PRIMARY KEY (`IdPokoju`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `karty pacjenta`
--
ALTER TABLE `karty pacjenta`
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
