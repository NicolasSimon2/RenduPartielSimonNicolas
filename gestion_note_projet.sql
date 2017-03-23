-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 23 Mars 2017 à 17:30
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gestion_note_projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ID_CLIENT` int(50) NOT NULL AUTO_INCREMENT,
  `NOM_CLIENT` text,
  `ADRESSE` text,
  `EMAIL` text,
  `TELEPHONE` text,
  PRIMARY KEY (`ID_CLIENT`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ID_CLIENT`, `NOM_CLIENT`, `ADRESSE`, `EMAIL`, `TELEPHONE`) VALUES
(1, 'Apple', 'Amerique', 'apple@mail.fr', '0264759824'),
(2, 'Microsoft', 'France', 'microsoft@mail.fr', '5896541257');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `ID_NOTE` int(50) NOT NULL AUTO_INCREMENT,
  `ID_UTILISATEUR` int(50) NOT NULL,
  `ID_PROJET` int(50) NOT NULL,
  `NOTE` text,
  `DATE_NOTE` text,
  PRIMARY KEY (`ID_NOTE`),
  KEY `I_FK_NOTE_UTILISATEUR` (`ID_UTILISATEUR`),
  KEY `I_FK_NOTE_PROJET` (`ID_PROJET`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `participe`
--

CREATE TABLE IF NOT EXISTS `participe` (
  `ID_PROJET` int(50) NOT NULL,
  `ID_UTILISATEUR` int(50) NOT NULL,
  PRIMARY KEY (`ID_PROJET`,`ID_UTILISATEUR`),
  KEY `I_FK_PARTICIPE_PROJET` (`ID_PROJET`),
  KEY `I_FK_PARTICIPE_UTILISATEUR` (`ID_UTILISATEUR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `participe`
--

INSERT INTO `participe` (`ID_PROJET`, `ID_UTILISATEUR`) VALUES
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `ID_PROJET` int(50) NOT NULL AUTO_INCREMENT,
  `ID_CLIENT` int(50) NOT NULL,
  `NOM_PROJET` text,
  `NATURE_PROJET` text,
  `PLANIFICATION_PROJET` text,
  `RESSOURCE_PROJET` text,
  PRIMARY KEY (`ID_PROJET`),
  KEY `I_FK_PROJET_CLIENT` (`ID_CLIENT`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `projet`
--

INSERT INTO `projet` (`ID_PROJET`, `ID_CLIENT`, `NOM_PROJET`, `NATURE_PROJET`, `PLANIFICATION_PROJET`, `RESSOURCE_PROJET`) VALUES
(1, 1, 'Création d''un base de donnée mobile', 'Création d''une application gérant une base de donnée', 'Création de la base de donnée pour dans 2 semaines', '100 000 $'),
(2, 2, 'Création d''un intranet', 'Mise en place d''un intranet dans une entreprise', 'Finir l''intranet pour dans 2 mois', '50 000 $');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID_UTILISATEUR` int(50) NOT NULL AUTO_INCREMENT,
  `IDENTIFIANT` text,
  `NOM_UTILISATEUR` text NOT NULL,
  `PRENOM_UTILISATEUR` text NOT NULL,
  `MOT_DE_PASSE` text,
  `EMAIL` text,
  `TELEPHONE` text,
  PRIMARY KEY (`ID_UTILISATEUR`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_UTILISATEUR`, `IDENTIFIANT`, `NOM_UTILISATEUR`, `PRENOM_UTILISATEUR`, `MOT_DE_PASSE`, `EMAIL`, `TELEPHONE`) VALUES
(2, 'SimonNicolas', 'Simon', 'Nicolas', 'nicolas', 'nicolas@mail.fr', '0255468514'),
(3, 'JulienRenau', 'Renau', 'Julien', 'julien', 'julien@mail.fr', '0254635891'),
(7, 'fvsderfg', 'test', 'rgser', 'test', 'ezfesdz', 'fdsezgdrse');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
