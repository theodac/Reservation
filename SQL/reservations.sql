-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 07 fév. 2018 à 18:12
-- Version du serveur :  10.1.28-MariaDB
-- Version de PHP :  7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `reservations`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_reservations`
--

CREATE TABLE `t_reservations` (
  `ID_RESERVATION` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `HEUREDEBUT` time DEFAULT NULL,
  `HEUREFIN` time DEFAULT NULL,
  `NOM` varchar(45) DEFAULT NULL,
  `T_SALLES_ID_SALLE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_reservations`
--

INSERT INTO `t_reservations` (`ID_RESERVATION`, `DATE`, `HEUREDEBUT`, `HEUREFIN`, `NOM`, `T_SALLES_ID_SALLE`) VALUES
(1, '2018-02-08', '09:00:00', '12:00:00', 'Poutoux', 1),
(2, '2018-02-09', '06:00:00', '09:00:00', 'Goufax', 1),
(3, '2018-02-10', '08:00:00', '10:00:00', 'Theo', 1),
(4, '2018-02-10', '08:00:00', '10:00:00', 'Theo', 1),
(5, '2018-02-11', '01:00:00', '01:01:00', 'Theo', 1),
(6, '2018-02-11', '01:00:00', '01:01:00', 'Theo', 1),
(7, '2018-02-11', '01:00:00', '01:01:00', 'Theo', 1),
(8, '2018-02-11', '01:00:00', '01:01:00', 'Theo', 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_salles`
--

CREATE TABLE `t_salles` (
  `ID_SALLE` int(11) NOT NULL,
  `SALLENOM` varchar(45) DEFAULT NULL,
  `SALLEPLACE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_salles`
--

INSERT INTO `t_salles` (`ID_SALLE`, `SALLENOM`, `SALLEPLACE`) VALUES
(1, 'JULES CESAR', 20),
(2, 'CLAUDE FRANCOIS', 35);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `t_reservations`
--
ALTER TABLE `t_reservations`
  ADD PRIMARY KEY (`ID_RESERVATION`,`T_SALLES_ID_SALLE`),
  ADD KEY `fk_T_RESERVATIONS_T_SALLES_idx` (`T_SALLES_ID_SALLE`);

--
-- Index pour la table `t_salles`
--
ALTER TABLE `t_salles`
  ADD PRIMARY KEY (`ID_SALLE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `t_reservations`
--
ALTER TABLE `t_reservations`
  MODIFY `ID_RESERVATION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `t_salles`
--
ALTER TABLE `t_salles`
  MODIFY `ID_SALLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_reservations`
--
ALTER TABLE `t_reservations`
  ADD CONSTRAINT `fk_T_RESERVATIONS_T_SALLES` FOREIGN KEY (`T_SALLES_ID_SALLE`) REFERENCES `t_salles` (`ID_SALLE`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
