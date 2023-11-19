-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 19, 2023 at 05:59 PM
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

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`IdPacjenta`),
  ADD UNIQUE KEY `Unique_Pesel` (`Pesel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
