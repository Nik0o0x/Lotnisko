-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Lis 2023, 13:27
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `lotniskodb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `backupiodtwarzanieawaryjne`
--

CREATE TABLE `backupiodtwarzanieawaryjne` (
  `BackupID` int(11) NOT NULL,
  `DataWykonaniaKopii` datetime DEFAULT NULL,
  `InformacjeODtwarzaniu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `backupiodtwarzanieawaryjne`
--

INSERT INTO `backupiodtwarzanieawaryjne` (`BackupID`, `DataWykonaniaKopii`, `InformacjeODtwarzaniu`) VALUES
(1, '2023-01-05 02:00:00', 'Pomyślne odtworzenie kopii z dnia 2023-01-01'),
(2, '2023-02-10 01:30:00', 'Pomyślne odtworzenie kopii z dnia 2023-02-05');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bagaże`
--

CREATE TABLE `bagaże` (
  `NumerBiletu` int(11) NOT NULL,
  `NumerLotu` int(11) DEFAULT NULL,
  `WagaBagażu` decimal(5,2) DEFAULT NULL,
  `StatusBagażu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `bagaże`
--

INSERT INTO `bagaże` (`NumerBiletu`, `NumerLotu`, `WagaBagażu`, `StatusBagażu`) VALUES
(1, 1, '20.50', 'odebrany'),
(2, 2, '18.20', 'odebrany');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bezpieczenstwo`
--

CREATE TABLE `bezpieczenstwo` (
  `PasażerID` int(11) NOT NULL,
  `ListaNoFly` tinyint(1) DEFAULT NULL,
  `InformacjeOKontroli` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `bezpieczenstwo`
--

INSERT INTO `bezpieczenstwo` (`PasażerID`, `ListaNoFly`, `InformacjeOKontroli`) VALUES
(1, 1, 'Pasażer na liście No Fly'),
(2, 0, 'Brak uwag');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `historialotow`
--

CREATE TABLE `historialotow` (
  `HistoriaID` int(11) NOT NULL,
  `OperacjaLotnicza` varchar(255) DEFAULT NULL,
  `DataOperacji` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `historialotow`
--

INSERT INTO `historialotow` (`HistoriaID`, `OperacjaLotnicza`, `DataOperacji`) VALUES
(1, 'Start samolotu SP-LRA z Lotniska Warszawa-Okęcie', '2023-01-01 12:00:00'),
(2, 'Przylot samolotu SP-KRK na Lotnisko Kraków-Baranówka', '2023-02-02 18:30:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `loty`
--

CREATE TABLE `loty` (
  `LotID` int(11) NOT NULL,
  `NumerLotu` varchar(20) DEFAULT NULL,
  `DataOdlotu` datetime DEFAULT NULL,
  `DataPrzylotu` datetime DEFAULT NULL,
  `TrasaLotu` varchar(255) DEFAULT NULL,
  `NumerBramki` varchar(10) DEFAULT NULL,
  `NumerMiejsca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `loty`
--

INSERT INTO `loty` (`LotID`, `NumerLotu`, `DataOdlotu`, `DataPrzylotu`, `TrasaLotu`, `NumerBramki`, `NumerMiejsca`) VALUES
(1, 'LO123', '2023-01-01 12:00:00', '2023-01-01 15:00:00', 'Warszawa - Nowy Jork', 'A1', 25),
(2, 'LOT456', '2023-02-02 14:30:00', '2023-02-02 18:30:00', 'Kraków - Paryż', 'B3', 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pasażerowie`
--

CREATE TABLE `pasażerowie` (
  `PasazerID` int(11) NOT NULL,
  `ImieNazwisko` varchar(255) DEFAULT NULL,
  `DataUrodzenia` date DEFAULT NULL,
  `Plec` varchar(10) DEFAULT NULL,
  `NumerDokumentu` varchar(20) DEFAULT NULL,
  `KrajPochodzenia` varchar(50) DEFAULT NULL,
  `Adres` varchar(255) DEFAULT NULL,
  `NumerTelefonu` varchar(20) DEFAULT NULL,
  `AdresEmail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pasażerowie`
--

INSERT INTO `pasażerowie` (`PasazerID`, `ImieNazwisko`, `DataUrodzenia`, `Plec`, `NumerDokumentu`, `KrajPochodzenia`, `Adres`, `NumerTelefonu`, `AdresEmail`) VALUES
(1, 'Jan Kowalski', '1990-05-15', 'M', 'AB123456', 'Polska', 'ul. Wiejska 1, 00-001 Warszawa', '+48 123 456 789', 'jan.kowalski@example.com'),
(2, 'Anna Nowak', '1985-08-21', 'K', 'CD789012', 'Polska', 'ul. Kwiatowa 5, 02-002 Kraków', '+48 987 654 321', 'anna.nowak@example.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personellotniska`
--

CREATE TABLE `personellotniska` (
  `PracownikID` int(11) NOT NULL,
  `ImieNazwisko` varchar(255) DEFAULT NULL,
  `StanowiskoPracy` varchar(50) DEFAULT NULL,
  `NumerIdentyfikacyjny` int(11) DEFAULT NULL,
  `GodzinyPracy` varchar(50) DEFAULT NULL,
  `LotniskoLubLot` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `personellotniska`
--

INSERT INTO `personellotniska` (`PracownikID`, `ImieNazwisko`, `StanowiskoPracy`, `NumerIdentyfikacyjny`, `GodzinyPracy`, `LotniskoLubLot`) VALUES
(1, 'Marta Zięba', 'Pracownik obsługi naziemnej', 1001, '8:00 - 16:00', 'Lotnisko Warszawa-Okęcie'),
(2, 'Piotr Nowak', 'Kontroler ruchu lotniczego', 1002, '14:00 - 22:00', 'Lot Kraków-Baranówka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przesylkicargo`
--

CREATE TABLE `przesylkicargo` (
  `NumerPrzesylki` int(11) NOT NULL,
  `MasaPrzesylki` decimal(5,2) DEFAULT NULL,
  `AdresDostawy` varchar(255) DEFAULT NULL,
  `NumerLotuCargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `przesylkicargo`
--

INSERT INTO `przesylkicargo` (`NumerPrzesylki`, `MasaPrzesylki`, `AdresDostawy`, `NumerLotuCargo`) VALUES
(1, '500.00', 'ul. Logistyczna 10, 03-111 Warszawa', 1),
(2, '800.00', 'ul. Magazynowa 5, 30-222 Kraków', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samoloty`
--

CREATE TABLE `samoloty` (
  `NumerRejestracyjny` varchar(20) NOT NULL,
  `ModelSamolotu` varchar(50) DEFAULT NULL,
  `IloscMiejsc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `samoloty`
--

INSERT INTO `samoloty` (`NumerRejestracyjny`, `ModelSamolotu`, `IloscMiejsc`) VALUES
('SP-KRK', 'Airbus A320', 200),
('SP-LRA', 'Boeing 737', 150);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `statystyki`
--

CREATE TABLE `statystyki` (
  `RaportID` int(11) NOT NULL,
  `LiczbaPasażerow` int(11) DEFAULT NULL,
  `Opóźnienia` int(11) DEFAULT NULL,
  `OdwołaniaLotow` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `statystyki`
--

INSERT INTO `statystyki` (`RaportID`, `LiczbaPasażerow`, `Opóźnienia`, `OdwołaniaLotow`) VALUES
(1, 1200, 30, 5),
(2, 800, 15, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `systembagazowy`
--

CREATE TABLE `systembagazowy` (
  `BagazID` int(11) NOT NULL,
  `SledzenieBagazu` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `systembagazowy`
--

INSERT INTO `systembagazowy` (`BagazID`, `SledzenieBagazu`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `systemkontrolilotow`
--

CREATE TABLE `systemkontrolilotow` (
  `KontrolaLotowID` int(11) NOT NULL,
  `MonitorowanieRuchuLotniczego` tinyint(1) DEFAULT NULL,
  `ZarzadzanieTrasamiLotow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `systemkontrolilotow`
--

INSERT INTO `systemkontrolilotow` (`KontrolaLotowID`, `MonitorowanieRuchuLotniczego`, `ZarzadzanieTrasamiLotow`) VALUES
(1, 1, 1),
(2, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `systemobslugiklienta`
--

CREATE TABLE `systemobslugiklienta` (
  `ObslugaKlientaID` int(11) NOT NULL,
  `ObslugaSkarg` tinyint(1) DEFAULT NULL,
  `PytaniaPasażerów` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `systemobslugiklienta`
--

INSERT INTO `systemobslugiklienta` (`ObslugaKlientaID`, `ObslugaSkarg`, `PytaniaPasażerów`) VALUES
(1, 1, 1),
(2, 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `systemrezerwacji`
--

CREATE TABLE `systemrezerwacji` (
  `RezerwacjaID` int(11) NOT NULL,
  `RezerwacjeOnline` tinyint(1) DEFAULT NULL,
  `PrzetwarzaniePlatnosci` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `systemrezerwacji`
--

INSERT INTO `systemrezerwacji` (`RezerwacjaID`, `RezerwacjeOnline`, `PrzetwarzaniePlatnosci`) VALUES
(1, 1, 1),
(2, 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zabezpieczeniaiuprawnienia`
--

CREATE TABLE `zabezpieczeniaiuprawnienia` (
  `OchronaDanychOsobowych` tinyint(1) DEFAULT NULL,
  `UprawnieniaDostepu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zabezpieczeniaiuprawnienia`
--

INSERT INTO `zabezpieczeniaiuprawnienia` (`OchronaDanychOsobowych`, `UprawnieniaDostepu`) VALUES
(1, 'Pełen dostęp'),
(0, 'Ograniczony dostęp');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zarezerwowanebilety`
--

CREATE TABLE `zarezerwowanebilety` (
  `NumerBiletu` int(11) NOT NULL,
  `CenaBiletu` decimal(10,2) DEFAULT NULL,
  `KlasaBiletu` varchar(20) DEFAULT NULL,
  `StatusPłatności` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zarezerwowanebilety`
--

INSERT INTO `zarezerwowanebilety` (`NumerBiletu`, `CenaBiletu`, `KlasaBiletu`, `StatusPłatności`) VALUES
(1, '250.00', 'ekonomiczna', 'opłacone'),
(2, '500.00', 'biznesowa', 'nieopłacone');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zarzadzaniezasobami`
--

CREATE TABLE `zarzadzaniezasobami` (
  `ZasobID` int(11) NOT NULL,
  `RodzajZasobu` varchar(50) DEFAULT NULL,
  `Dostepnosc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zarzadzaniezasobami`
--

INSERT INTO `zarzadzaniezasobami` (`ZasobID`, `RodzajZasobu`, `Dostepnosc`) VALUES
(1, 'bramka', 'wolna'),
(2, 'bramka', 'zajęta');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `backupiodtwarzanieawaryjne`
--
ALTER TABLE `backupiodtwarzanieawaryjne`
  ADD PRIMARY KEY (`BackupID`);

--
-- Indeksy dla tabeli `bagaże`
--
ALTER TABLE `bagaże`
  ADD PRIMARY KEY (`NumerBiletu`);

--
-- Indeksy dla tabeli `bezpieczenstwo`
--
ALTER TABLE `bezpieczenstwo`
  ADD PRIMARY KEY (`PasażerID`);

--
-- Indeksy dla tabeli `historialotow`
--
ALTER TABLE `historialotow`
  ADD PRIMARY KEY (`HistoriaID`);

--
-- Indeksy dla tabeli `loty`
--
ALTER TABLE `loty`
  ADD PRIMARY KEY (`LotID`);

--
-- Indeksy dla tabeli `pasażerowie`
--
ALTER TABLE `pasażerowie`
  ADD PRIMARY KEY (`PasazerID`);

--
-- Indeksy dla tabeli `personellotniska`
--
ALTER TABLE `personellotniska`
  ADD PRIMARY KEY (`PracownikID`);

--
-- Indeksy dla tabeli `przesylkicargo`
--
ALTER TABLE `przesylkicargo`
  ADD PRIMARY KEY (`NumerPrzesylki`);

--
-- Indeksy dla tabeli `samoloty`
--
ALTER TABLE `samoloty`
  ADD PRIMARY KEY (`NumerRejestracyjny`);

--
-- Indeksy dla tabeli `statystyki`
--
ALTER TABLE `statystyki`
  ADD PRIMARY KEY (`RaportID`);

--
-- Indeksy dla tabeli `systembagazowy`
--
ALTER TABLE `systembagazowy`
  ADD PRIMARY KEY (`BagazID`);

--
-- Indeksy dla tabeli `systemkontrolilotow`
--
ALTER TABLE `systemkontrolilotow`
  ADD PRIMARY KEY (`KontrolaLotowID`);

--
-- Indeksy dla tabeli `systemobslugiklienta`
--
ALTER TABLE `systemobslugiklienta`
  ADD PRIMARY KEY (`ObslugaKlientaID`);

--
-- Indeksy dla tabeli `systemrezerwacji`
--
ALTER TABLE `systemrezerwacji`
  ADD PRIMARY KEY (`RezerwacjaID`);

--
-- Indeksy dla tabeli `zarezerwowanebilety`
--
ALTER TABLE `zarezerwowanebilety`
  ADD PRIMARY KEY (`NumerBiletu`);

--
-- Indeksy dla tabeli `zarzadzaniezasobami`
--
ALTER TABLE `zarzadzaniezasobami`
  ADD PRIMARY KEY (`ZasobID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
