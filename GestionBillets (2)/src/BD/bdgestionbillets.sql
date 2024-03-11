-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 29 Février 2024 à 16:22
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bdgestionbillets`
--

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE IF NOT EXISTS `avion` (
  `id_avion` int(255) NOT NULL AUTO_INCREMENT,
  `etat` varchar(30) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `numeroAvion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_avion`),
  KEY `designation_2` (`designation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `avion`
--

INSERT INTO `avion` (`id_avion`, `etat`, `designation`, `numeroAvion`) VALUES
(1, 'Fonctionnel', 'NICEPLANE', 'A123456'),
(12, 'En panne', 'NICEPLAN', '2112'),
(14, 'En panne', 'NICEPLAN', '11'),
(15, 'Fonctionnel', 'NICEPLAN', '13'),
(16, 'En panne', 'Bestplane', '123'),
(17, 'Fonctionnel', 'chicplane', '1223ZAAZ'),
(18, 'Fonctionnel', 'Motoplaneurs', '123133'),
(19, 'Fonctionnel', 'PLANE', 'AZE132'),
(20, 'Fonctionnel', 'Planeurs', '1212121'),
(21, 'Fonctionnel', 'ULM ', '324241AA');

-- --------------------------------------------------------

--
-- Structure de la table `billets`
--

CREATE TABLE IF NOT EXISTS `billets` (
  `id_billet` int(255) NOT NULL AUTO_INCREMENT,
  `destination` varchar(10000) NOT NULL,
  `date_heure_achat` datetime NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `id_vol` int(255) NOT NULL,
  `Mat` int(11) NOT NULL,
  PRIMARY KEY (`id_billet`),
  KEY `fk_voyage` (`id_vol`),
  KEY `fk_utilisateur` (`Mat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `billets`
--

INSERT INTO `billets` (`id_billet`, `destination`, `date_heure_achat`, `prix`, `id_vol`, `Mat`) VALUES
(1, 'Paris', '2024-02-28 00:55:14', '100000000', 10, 15),
(2, 'Paris', '2024-02-28 00:55:14', '100000000', 10, 15),
(3, 'Paris', '2024-02-28 00:55:14', '100000000', 10, 15),
(4, 'Quebec', '2024-02-28 00:55:14', '100000000', 10, 15),
(5, 'Cotonou', '2024-02-27 23:48:00', '20000000', 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `designation` varchar(100) NOT NULL DEFAULT 'NICEPLANE',
  `capacite` int(11) NOT NULL,
  `poids` int(11) NOT NULL,
  PRIMARY KEY (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`designation`, `capacite`, `poids`) VALUES
('Bestplane', 800000, 10000000),
('chicplane', 80000, 1000000),
('Motoplaneurs', 800000, 14700),
('NICEPLAN', 21474836, 700),
('NICEPLANE', 2147483642, 100099),
('PLANE', 470470, 470147147),
('Planeurs', 147000, 8000000),
('ULM ', 1470, 470);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `Mat` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(500) NOT NULL,
  `Prenom` varchar(1000) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`Mat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`Mat`, `Nom`, `Prenom`, `Contact`, `Password`) VALUES
(1, 'AGUESSY', 'Marie-Adelphe', '51836917', 'adodo'),
(2, 'AGOSSA', 'Berel', '00000000', 'Mot'),
(3, 'ATTEREY', 'Erika', '12345678', 'rika'),
(4, 'SOSSA', 'Armel', '87780990', 'armo'),
(5, 'Nom', 'Prenom', 'Contact', 'Mot de passe'),
(6, 'BOKO', 'René', '43344556', 'MPP%'),
(7, 'ADJE', 'Adéola', '78989809', 'ama'),
(8, 'AUEMON', 'Pascal', '90988987', 'Ama'),
(9, 'ALLO', 'Komi', '34567898', 'azerty'),
(10, 'A', 'Komi', '34567898', 'azerty'),
(13, 'AAKOUTEY', '', '1222222222', '12346789'),
(14, 'ZOLA', 'Odile', '90988990', 'adodo'),
(15, 'ADOHO', 'Nathan', '89762354', 'natou'),
(16, 'DADJO', 'Ange', '62217865', 'ange'),
(17, 'ABA', 'Sheki', '11111111', 'sheki'),
(18, 'AOLO', 'Leila', '40909090', 'lili'),
(19, 'COLA', 'Cola', '89988998', 'cola');

-- --------------------------------------------------------

--
-- Structure de la table `compagnie`
--

CREATE TABLE IF NOT EXISTS `compagnie` (
  `id_compagnie` int(11) NOT NULL AUTO_INCREMENT,
  `nom_compagnie` varchar(60) NOT NULL,
  `ville` varchar(60) NOT NULL,
  `adresse` varchar(60) NOT NULL,
  `Contact` int(8) NOT NULL,
  PRIMARY KEY (`id_compagnie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `compagnie`
--

INSERT INTO `compagnie` (`id_compagnie`, `nom_compagnie`, `ville`, `adresse`, `Contact`) VALUES
(1, 'BDA1', 'Abomey', 'bda@yahoo.bj', 51836917),
(2, 'BDA2', 'Calavi', 'bda1@yahoo.bj', 95801098);

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `IdPersonnel` int(255) NOT NULL AUTO_INCREMENT,
  `NomPersonnel` varchar(30) NOT NULL,
  `PrenomPersonnel` varchar(60) NOT NULL,
  `Contact` varchar(8) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `id_compagnie` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IdPersonnel`),
  KEY `id_compagnie` (`id_compagnie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `personnel`
--

INSERT INTO `personnel` (`IdPersonnel`, `NomPersonnel`, `PrenomPersonnel`, `Contact`, `Password`, `id_compagnie`) VALUES
(1, 'ATCHOU', 'Boris', '56657889', 'bobo', 2),
(2, 'AGUESSY', 'Johanna', '95801098', 'johana', 1),
(3, 'AHEHE', 'Placide', '3457812', 'placidodo', 2),
(4, 'AHEHE', 'Naomi', '89900998', 'placidodo', 1),
(5, 'ASSA', 'Assi', '12909887', 'assi', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

CREATE TABLE IF NOT EXISTS `reserver` (
  `id_reserver` int(255) NOT NULL AUTO_INCREMENT,
  `Mat` int(11) NOT NULL DEFAULT '12',
  `id_vol` int(255) NOT NULL,
  `statut` varchar(10) NOT NULL,
  `nomVoyageur` varchar(100) NOT NULL,
  `date_ajout` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_reserver`),
  KEY `Mat_2` (`Mat`),
  KEY `id_vol_2` (`id_vol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Contenu de la table `reserver`
--

INSERT INTO `reserver` (`id_reserver`, `Mat`, `id_vol`, `statut`, `nomVoyageur`, `date_ajout`) VALUES
(1, 1, 7, 'En attente', 'Adama BIBO', '2024-02-27 22:48:00'),
(3, 2, 6, 'En attente', 'Dorcelle YEKINI', '2024-02-27 22:48:00'),
(4, 3, 2, 'Validé', 'Josephe AKOUTEY', '2024-02-27 22:48:00'),
(20, 13, 3, 'Validé', 'Mimi AEZA', '2024-02-27 22:48:00'),
(22, 15, 9, 'Validé', 'Mike AZAEE', '2024-02-27 22:48:00'),
(23, 9, 5, 'Validé', 'Peace SOSSA', '2024-02-27 22:48:00'),
(26, 9, 7, 'En attente', 'BABAHIDE Kal', '2024-02-27 22:48:00'),
(27, 9, 5, 'Validé', 'Marie-Adelphe AGUESSY', '2024-02-27 22:48:00'),
(28, 9, 5, 'Validé', 'Dora RADO', '2024-02-27 22:48:00'),
(29, 15, 3, 'Validé', 'Testeur AMA', '2024-02-27 23:26:34'),
(30, 15, 7, 'Validé', 'Testeur ABA', '2024-02-27 23:37:43'),
(31, 15, 7, 'Validé', 'Testeur AAMA', '2024-02-27 23:46:57'),
(32, 15, 10, 'Validé', 'Testeur AAFMA', '2024-02-27 23:55:14'),
(33, 15, 10, 'Validé', 'Vicky AOLO', '2024-02-28 20:21:57'),
(34, 15, 5, 'En attente', '', '2024-02-28 20:48:49'),
(35, 15, 8, 'En attente', 'Léo CICI', '2024-02-28 21:32:58'),
(36, 15, 10, 'Validé', 'Anick ANICK', '2024-02-29 14:21:41'),
(37, 15, 7, 'Validé', 'Lulu LINA', '2024-02-29 14:30:41');

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE IF NOT EXISTS `vol` (
  `id_vol` int(255) NOT NULL AUTO_INCREMENT,
  `ville_depart` mediumtext NOT NULL,
  `ville_arrivee` mediumtext NOT NULL,
  `date_heure_depart` datetime NOT NULL,
  `date_heure_arrivee` datetime NOT NULL,
  `id_avion` int(255) NOT NULL,
  `prix` int(255) NOT NULL,
  PRIMARY KEY (`id_vol`),
  KEY `id_avion` (`id_avion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `vol`
--

INSERT INTO `vol` (`id_vol`, `ville_depart`, `ville_arrivee`, `date_heure_depart`, `date_heure_arrivee`, `id_avion`, `prix`) VALUES
(1, 'Cotonou', 'Quebec', '2024-02-24 00:00:00', '2024-02-28 00:00:00', 2, 1333333),
(2, 'Cotonou', 'Paris', '2024-02-24 00:00:00', '2024-04-24 00:00:00', 3, 888888888),
(3, 'Ville1', 'Ville2', '2024-07-23 12:00:00', '2024-08-23 02:00:00', 1, 122999999),
(4, 'Paris', 'Cotonou', '2024-11-11 07:10:20', '2024-12-11 07:10:20', 2, 122999999),
(5, 'Torunto', 'Paris', '2024-02-08 12:00:00', '2024-03-08 12:00:00', 2, 22999999),
(6, 'Cotonou', 'Londres', '2024-12-09 12:00:00', '2024-12-12 12:00:00', 2, 122999999),
(7, 'Madagascar', 'Cotonou', '2011-11-11 04:00:00', '2012-12-12 03:03:00', 113456788, 20000000),
(8, 'Tokio', 'Paris', '2007-11-11 13:00:00', '2007-12-11 10:00:00', 1234444444, 20000000),
(9, 'Cotonou', 'Toroto', '2012-09-09 09:00:00', '2012-09-12 09:00:00', 11, 10000000),
(10, 'Cotonou', 'Paris', '2024-11-02 12:12:00', '2024-12-04 12:12:00', 23479, 100000000),
(11, 'Cotonou', 'Paris', '2024-11-02 12:12:00', '2024-12-04 12:12:00', 23479, 100000000),
(12, 'Cotonou', 'Lomé', '2012-12-12 12:00:00', '2012-12-13 12:00:00', 1222344, 20000000),
(13, 'Cotonou', 'Bohicon', '2012-12-12 12:12:00', '2012-12-13 12:12:00', 123321, 1000000);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`designation`) REFERENCES `categorie` (`designation`);

--
-- Contraintes pour la table `billets`
--
ALTER TABLE `billets`
  ADD CONSTRAINT `fk_utilisateur` FOREIGN KEY (`Mat`) REFERENCES `clients` (`Mat`),
  ADD CONSTRAINT `fk_voyage` FOREIGN KEY (`id_vol`) REFERENCES `vol` (`id_vol`);

--
-- Contraintes pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD CONSTRAINT `reserver_ibfk_1` FOREIGN KEY (`Mat`) REFERENCES `clients` (`Mat`),
  ADD CONSTRAINT `reserver_ibfk_2` FOREIGN KEY (`id_vol`) REFERENCES `vol` (`id_vol`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
