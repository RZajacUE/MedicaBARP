-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 16, 2023 at 11:22 AM
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
  `Imie` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `Pesel` varchar(11) DEFAULT NULL,
  `DataUrodzenia` date DEFAULT NULL,
  `Adres` varchar(255) DEFAULT NULL,
  `NumerTel` varchar(20) DEFAULT NULL,
  `Haslo` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `pacjenci`
--

INSERT INTO `pacjenci` (`IdPacjenta`, `Imie`, `Nazwisko`, `Pesel`, `DataUrodzenia`, `Adres`, `NumerTel`, `Haslo`, `Email`) VALUES
(1, 'Jan', 'Kowalski', '12345678901', '1980-05-15', 'ul. Kwiatowa 7', '123456789', 'g87!eDja', 'UeKat1@gmail.com'),
(2, 'Anna', 'Nowak', '98765432109', '1995-08-20', 'ul. Słoneczna 14', '987654321', 'dA!123rt', 'UeKat2@gmail.com'),
(3, 'Marek', 'Wiśniewski', '56789012345', '1976-12-10', 'ul. Leśna 3', '567890123', 'S34!ikds', 'UeKat3@gmail.com'),
(4, 'Ewa', 'Jankowska', '34567890123', '1990-03-25', 'ul. Parkowa 11', '345678901', 'Gg!g54i4', 'UeKat4@gmail.com'),
(5, 'Piotr', 'Kowalczyk', '78901234567', '1985-09-08', 'ul. Polna 9', '789012345', 'Lio8!tya', 'UeKat5@gmail.com'),
(6, 'Alicja', 'Lis', '45678901234', '2000-07-30', 'ul. Wiosenna 2', '456789012', 'UeKat66!', 'UeKat6@gmail.com'),
(7, 'Kamil', 'Kaczor', '23456789012', '1972-01-14', 'ul. Główna 4', '234567890', 'UeKat77!', 'UeKat7@gmail.com'),
(8, 'Karolina', 'Wójcik', '65432109876', '1988-11-05', 'ul. Cicha 8', '654321098', 'UeKat88!', 'UeKat8@gmail.com'),
(9, 'Wojciech', 'Nowicki', '87654321098', '1993-04-18', 'ul. Zielona 12', '876543210', 'UeKat99!', 'UeKat9@gmail.com'),
(10, 'Magdalena', 'Duda', '11223344556', '1974-06-22', 'ul. Różana 6', '112233445', 'UeKat00!', 'UeKat10@gmail.com');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`IdPacjenta`),
  ADD UNIQUE KEY `Unique_Pesel` (`Pesel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pacjenci`
--
ALTER TABLE `pacjenci`
  MODIFY `IdPacjenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
