-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 15 Sty 2017, 17:53
-- Wersja serwera: 5.5.49-0ubuntu0.14.04.1
-- Wersja PHP: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `hotel`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adres`
--

CREATE TABLE IF NOT EXISTS `adres` (
  `adres_id` int(11) NOT NULL,
  `ulica` varchar(20) DEFAULT NULL,
  `nr_domu` int(3) NOT NULL,
  `nr_mieszkania` int(3) DEFAULT NULL,
  `miejscowosc` varchar(20) NOT NULL,
  `kraj` varchar(20) NOT NULL,
  PRIMARY KEY (`adres_id`),
  KEY `adres_id` (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czarna_lista`
--

CREATE TABLE IF NOT EXISTS `czarna_lista` (
  `klient_id` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(40) NOT NULL,
  `PESEL` int(14) NOT NULL,
  `opis` varchar(255) NOT NULL,
  PRIMARY KEY (`klient_id`),
  KEY `klient_id` (`klient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACJE TABELI `czarna_lista`:
--   `klient_id`
--       `klient` -> `klient_id`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dane_firmy`
--

CREATE TABLE IF NOT EXISTS `dane_firmy` (
  `firma_id` int(11) NOT NULL,
  `nazwa` varchar(40) NOT NULL,
  `NIP` varchar(14) NOT NULL,
  `adres_id` int(10) NOT NULL,
  `numer_telefonu` int(10) NOT NULL,
  `email` int(11) DEFAULT NULL,
  PRIMARY KEY (`firma_id`),
  UNIQUE KEY `NIP` (`NIP`),
  KEY `firma_id` (`firma_id`,`adres_id`),
  KEY `fk_dane_firmy_adres_id` (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACJE TABELI `dane_firmy`:
--   `adres_id`
--       `adres` -> `adres_id`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dane_osobowe`
--

CREATE TABLE IF NOT EXISTS `dane_osobowe` (
  `osoba_id` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(40) NOT NULL,
  `PESEL` varchar(14) NOT NULL,
  `adres_id` int(10) NOT NULL,
  `numer_telefonu` int(10) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`osoba_id`),
  UNIQUE KEY `PESEL` (`PESEL`),
  KEY `osoba_id` (`osoba_id`,`adres_id`),
  KEY `fk_dane_osobowe__adres_id` (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACJE TABELI `dane_osobowe`:
--   `adres_id`
--       `adres` -> `adres_id`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE IF NOT EXISTS `klient` (
  `klient_id` int(11) NOT NULL,
  `osoba_id` int(10) NOT NULL,
  `firma_id` int(10) DEFAULT NULL,
  `staly_klient` tinyint(1) NOT NULL,
  `czarna_lista` tinyint(1) NOT NULL,
  PRIMARY KEY (`klient_id`),
  KEY `klient_id` (`klient_id`,`osoba_id`,`firma_id`),
  KEY `fk_klient__osoba_id` (`osoba_id`),
  KEY `fk_klient__firma_id` (`firma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACJE TABELI `klient`:
--   `firma_id`
--       `dane_firmy` -> `firma_id`
--   `osoba_id`
--       `dane_osobowe` -> `osoba_id`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opinie`
--

CREATE TABLE IF NOT EXISTS `opinie` (
  `opinia_id` int(11) NOT NULL,
  `autor` varchar(20) NOT NULL,
  `liczba_gwiazdek` int(5) NOT NULL,
  `tresc` varchar(500) NOT NULL,
  PRIMARY KEY (`opinia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Struktura tabeli dla tabeli `platnosc`
--

CREATE TABLE IF NOT EXISTS `platnosc` (
  `platnosc_id` int(11) NOT NULL,
  `nazwa` varchar(40) NOT NULL,
  `kwota` int(5) NOT NULL,
  PRIMARY KEY (`platnosc_id`),
  KEY `platnosc_id` (`platnosc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoj`
--

CREATE TABLE IF NOT EXISTS `pokoj` (
  `pokoj_id` int(4) NOT NULL,
  `typ_id` int(2) NOT NULL,
  PRIMARY KEY (`pokoj_id`),
  KEY `pokoj_id` (`pokoj_id`,`typ_id`),
  KEY `fk_pokoj__typ_id` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACJE TABELI `pokoj`:
--   `typ_id`
--       `typ_pokoju` -> `typ_id`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE IF NOT EXISTS `pracownik` (
  `pracownik_id` int(11) NOT NULL,
  `osoba_id` int(10) NOT NULL,
  `aktywne` tinyint(1) NOT NULL,
  `uprawnienia_id` int(4) NOT NULL,
  PRIMARY KEY (`pracownik_id`),
  KEY `pracownik_id` (`pracownik_id`,`osoba_id`,`uprawnienia_id`),
  KEY `fk_pracownik__osoba_id` (`osoba_id`),
  KEY `fk_pracownik__uprawnienia_id` (`uprawnienia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACJE TABELI `pracownik`:
--   `uprawnienia_id`
--       `uprawnienia` -> `uprawnienia_id`
--   `osoba_id`
--       `dane_osobowe` -> `osoba_id`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacja`
--

CREATE TABLE IF NOT EXISTS `rezerwacja` (
  `rezerwacja_id` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(40) NOT NULL,
  `klient_id` int(10) NOT NULL,
  `pokoj_id` int(3) NOT NULL,
  `platnosc_id` int(10) NOT NULL,
  `kwota_zaliczki` int(10) NOT NULL,
  `status_id` int(2) NOT NULL,
  `data_rezerwacji` date NOT NULL,
  `rezerwacja_od` date NOT NULL,
  `rezerwacja_do` date NOT NULL,
  `usluga_id` int(3) NOT NULL,
  `pracownik_id` int(4) DEFAULT NULL,
  `rezerwacja_grupowa_id` int(10) DEFAULT NULL,
  `imie_rezerwujacego` int(60) DEFAULT NULL,
  `nazwisko_rezerwujacego` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`rezerwacja_id`),
  KEY `rezerwacja_id` (`rezerwacja_id`,`klient_id`,`pokoj_id`,`platnosc_id`,`status_id`,`usluga_id`,`pracownik_id`,`rezerwacja_grupowa_id`),
  KEY `fk_rezerwacja__klient_id` (`klient_id`),
  KEY `fk_rezerwacja__pokoj_id` (`pokoj_id`),
  KEY `fk_rezerwacja__platnosc_id` (`platnosc_id`),
  KEY `fk_rezerwacja__status_id` (`status_id`),
  KEY `fk_rezerwacja__usluga_id` (`usluga_id`),
  KEY `fk_rezerwacja__pracownik_id` (`pracownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACJE TABELI `rezerwacja`:
--   `klient_id`
--       `klient` -> `klient_id`
--   `platnosc_id`
--       `platnosc` -> `platnosc_id`
--   `pokoj_id`
--       `pokoj` -> `pokoj_id`
--   `pracownik_id`
--       `pracownik` -> `pracownik_id`
--   `status_id`
--       `status_rezerwacji` -> `status_id`
--   `usluga_id`
--       `usluga` -> `usluga_id`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stali_klienci`
--

CREATE TABLE IF NOT EXISTS `stali_klienci` (
  `klient_id` int(11) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(40) NOT NULL,
  `PESEL` int(14) NOT NULL,
  `znizka` int(4) NOT NULL,
  PRIMARY KEY (`klient_id`),
  UNIQUE KEY `PESEL` (`PESEL`),
  KEY `klient_id` (`klient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACJE TABELI `stali_klienci`:
--   `klient_id`
--       `klient` -> `klient_id`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_rezerwacji`
--

CREATE TABLE IF NOT EXISTS `status_rezerwacji` (
  `status_id` int(11) NOT NULL,
  `wstepna` tinyint(1) NOT NULL,
  `potwierdzona` tinyint(1) NOT NULL,
  `zaliczka` tinyint(1) NOT NULL,
  `oplacona` tinyint(1) NOT NULL,
  `zameldowany` tinyint(1) NOT NULL,
  `wymeldowany` tinyint(1) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typ_pokoju`
--

CREATE TABLE IF NOT EXISTS `typ_pokoju` (
  `typ_id` int(11) NOT NULL,
  `rodzaj` varchar(10) NOT NULL,
  `cena_za_dobe` int(4) NOT NULL,
  `liczba_osob` int(1) NOT NULL,
  `balkon` tinyint(1) NOT NULL,
  `widok` varchar(10) NOT NULL,
  PRIMARY KEY (`typ_id`),
  KEY `typ_id` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uprawnienia`
--

CREATE TABLE IF NOT EXISTS `uprawnienia` (
  `uprawnienia_id` int(11) NOT NULL,
  `klient` tinyint(1) NOT NULL,
  `recepcjonista` tinyint(1) NOT NULL,
  `kierownik` tinyint(1) NOT NULL,
  `wlasciciel` tinyint(1) NOT NULL,
  `administrator` tinyint(1) NOT NULL,
  PRIMARY KEY (`uprawnienia_id`),
  KEY `uprawnienia_id` (`uprawnienia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `usluga`
--

CREATE TABLE IF NOT EXISTS `usluga` (
  `usluga_id` int(11) NOT NULL,
  `nazwa` varchar(20) NOT NULL,
  `koszt` int(4) NOT NULL,
  PRIMARY KEY (`usluga_id`),
  KEY `usluga_id` (`usluga_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `czarna_lista`
--
ALTER TABLE `czarna_lista`
  ADD CONSTRAINT `fk_czarna_lista__klient_id` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`klient_id`);

--
-- Ograniczenia dla tabeli `dane_firmy`
--
ALTER TABLE `dane_firmy`
  ADD CONSTRAINT `fk_dane_firmy_adres_id` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`);

--
-- Ograniczenia dla tabeli `dane_osobowe`
--
ALTER TABLE `dane_osobowe`
  ADD CONSTRAINT `fk_dane_osobowe__adres_id` FOREIGN KEY (`adres_id`) REFERENCES `adres` (`adres_id`);

--
-- Ograniczenia dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD CONSTRAINT `fk_klient__firma_id` FOREIGN KEY (`firma_id`) REFERENCES `dane_firmy` (`firma_id`),
  ADD CONSTRAINT `fk_klient__osoba_id` FOREIGN KEY (`osoba_id`) REFERENCES `dane_osobowe` (`osoba_id`);

--
-- Ograniczenia dla tabeli `pokoj`
--
ALTER TABLE `pokoj`
  ADD CONSTRAINT `fk_pokoj__typ_id` FOREIGN KEY (`typ_id`) REFERENCES `typ_pokoju` (`typ_id`);

--
-- Ograniczenia dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD CONSTRAINT `fk_pracownik__uprawnienia_id` FOREIGN KEY (`uprawnienia_id`) REFERENCES `uprawnienia` (`uprawnienia_id`),
  ADD CONSTRAINT `fk_pracownik__osoba_id` FOREIGN KEY (`osoba_id`) REFERENCES `dane_osobowe` (`osoba_id`);

--
-- Ograniczenia dla tabeli `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD CONSTRAINT `fk_rezerwacja__klient_id` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`klient_id`),
  ADD CONSTRAINT `fk_rezerwacja__platnosc_id` FOREIGN KEY (`platnosc_id`) REFERENCES `platnosc` (`platnosc_id`),
  ADD CONSTRAINT `fk_rezerwacja__pokoj_id` FOREIGN KEY (`pokoj_id`) REFERENCES `pokoj` (`pokoj_id`),
  ADD CONSTRAINT `fk_rezerwacja__pracownik_id` FOREIGN KEY (`pracownik_id`) REFERENCES `pracownik` (`pracownik_id`),
  ADD CONSTRAINT `fk_rezerwacja__status_id` FOREIGN KEY (`status_id`) REFERENCES `status_rezerwacji` (`status_id`),
  ADD CONSTRAINT `fk_rezerwacja__usluga_id` FOREIGN KEY (`usluga_id`) REFERENCES `usluga` (`usluga_id`);


--
-- Struktura tabeli dla tabeli `restauracja_dania`
--

CREATE TABLE IF NOT EXISTS `restauracja_dania` (
  `danie_id` int(11) NOT NULL,
  `nazwa` varchar(20) CHARACTER SET latin1 NOT NULL,
  `opis` varchar(200) CHARACTER SET latin1 NOT NULL,
  `cena` int(11) NOT NULL,
  PRIMARY KEY (`danie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Ograniczenia dla tabeli `stali_klienci`
--
ALTER TABLE `stali_klienci`
  ADD CONSTRAINT `fk_stali_klienci__klient_id` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`klient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
