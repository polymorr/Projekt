-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 27. zář 2018, 11:51
-- Verze serveru: 5.6.24
-- Verze PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `bazar`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `id` int(11) NOT NULL,
  `src` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `inzerat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `inzerat`
--

CREATE TABLE IF NOT EXISTS `inzerat` (
  `id` int(11) NOT NULL,
  `nazev` varchar(65) COLLATE utf8_czech_ci NOT NULL,
  `popis` text COLLATE utf8_czech_ci NOT NULL,
  `cena` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `lokalita` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `datum` datetime NOT NULL,
  `podrubrika_id` int(11) NOT NULL,
  `uzivatel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `podrubrika`
--

CREATE TABLE IF NOT EXISTS `podrubrika` (
  `id` int(11) NOT NULL,
  `nazev` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `rubrika_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `rubrika`
--

CREATE TABLE IF NOT EXISTS `rubrika` (
  `id` int(11) NOT NULL,
  `nazev` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `obrazek` varchar(65) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel`
--

CREATE TABLE IF NOT EXISTS `uzivatel` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(35) COLLATE utf8_czech_ci NOT NULL,
  `telefon` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `heslo` varchar(45) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_foto_inzerat1_idx` (`inzerat_id`);

--
-- Klíče pro tabulku `inzerat`
--
ALTER TABLE `inzerat`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `cena_UNIQUE` (`cena`), ADD UNIQUE KEY `datum_UNIQUE` (`datum`), ADD KEY `fk_inzerat_podrubrika_idx` (`podrubrika_id`), ADD KEY `fk_inzerat_uzivatel1_idx` (`uzivatel_id`);

--
-- Klíče pro tabulku `podrubrika`
--
ALTER TABLE `podrubrika`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_podrubrika_rubrika1_idx` (`rubrika_id`);

--
-- Klíče pro tabulku `rubrika`
--
ALTER TABLE `rubrika`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `foto`
--
ALTER TABLE `foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `inzerat`
--
ALTER TABLE `inzerat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `podrubrika`
--
ALTER TABLE `podrubrika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `rubrika`
--
ALTER TABLE `rubrika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `foto`
--
ALTER TABLE `foto`
ADD CONSTRAINT `fk_foto_inzerat1` FOREIGN KEY (`inzerat_id`) REFERENCES `inzerat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `inzerat`
--
ALTER TABLE `inzerat`
ADD CONSTRAINT `fk_inzerat_podrubrika` FOREIGN KEY (`podrubrika_id`) REFERENCES `podrubrika` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_inzerat_uzivatel1` FOREIGN KEY (`uzivatel_id`) REFERENCES `uzivatel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `podrubrika`
--
ALTER TABLE `podrubrika`
ADD CONSTRAINT `fk_podrubrika_rubrika1` FOREIGN KEY (`rubrika_id`) REFERENCES `rubrika` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
