-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 15 Juillet 2019 à 10:02
-- Version du serveur :  10.1.37-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pizzeria`
--
CREATE DATABASE IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pizzeria`;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `numero` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`numero`, `date`, `user_id`, `status`) VALUES
(12, '2019-07-13 18:55:26', 11, 'Terminee'),
(13, '2019-07-13 05:36:04', 11, 'En cours'),
(14, '2019-07-13 06:00:08', 11, 'En cours'),
(15, '2019-07-13 06:03:35', 11, 'En cours'),
(16, '2019-07-13 06:04:24', 11, 'En cours'),
(17, '2019-07-13 06:07:20', 12, 'En cours'),
(18, '2019-07-13 06:27:26', 11, 'En cours'),
(19, '2019-07-13 21:59:27', 18, 'En cours'),
(20, '2019-07-13 22:00:01', 11, 'En cours'),
(21, '2019-07-13 23:47:41', 19, 'En cours'),
(22, '2019-07-13 23:48:27', 11, 'En cours'),
(23, '2019-07-14 00:17:56', 11, 'En cours'),
(24, '2019-07-14 07:33:47', 20, 'En cours'),
(25, '2019-07-14 07:34:37', 11, 'En cours'),
(26, '2019-07-15 05:11:34', 21, 'En cours');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `nom`, `prix`) VALUES
(1, 'Olives', 2),
(2, 'Ananas', 2),
(3, 'Roquefort', 1),
(4, 'Magret', 4),
(5, 'Piment', 1),
(8, 'Mozarella', 1),
(9, 'Champignon', 2),
(11, 'Peperonni', 3),
(12, 'Merguez', 4),
(13, 'Bleu', 2);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient_pizza`
--

CREATE TABLE `ingredient_pizza` (
  `ingredient_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `ingredient_pizza`
--

INSERT INTO `ingredient_pizza` (`ingredient_id`, `pizza_id`) VALUES
(1, 10),
(1, 12),
(1, 13),
(1, 14),
(2, 14),
(3, 11),
(3, 13),
(4, 12),
(4, 13),
(5, 13),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(9, 10),
(9, 12),
(9, 13),
(11, 10),
(11, 13),
(13, 11);

-- --------------------------------------------------------

--
-- Structure de la table `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `libelle` varchar(45) NOT NULL,
  `prix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `pizza`
--

INSERT INTO `pizza` (`id`, `libelle`, `prix`) VALUES
(10, 'Royale', 10),
(11, '3 Fromages', 11),
(12, 'Toulousaine', 14),
(13, 'la spéciale', 18),
(14, 'Hawaienne', 12);

-- --------------------------------------------------------

--
-- Structure de la table `pizza_commande`
--

CREATE TABLE `pizza_commande` (
  `pizza_id` int(11) NOT NULL,
  `commande_numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `pizza_commande`
--

INSERT INTO `pizza_commande` (`pizza_id`, `commande_numero`) VALUES
(10, 25),
(11, 20),
(11, 25),
(12, 13),
(12, 14),
(12, 16),
(12, 17),
(12, 18),
(12, 19),
(12, 21),
(12, 24),
(12, 26),
(13, 12),
(13, 14),
(13, 15),
(13, 18),
(13, 22),
(13, 23),
(13, 24),
(13, 26),
(14, 12),
(14, 13),
(14, 15);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `role`, `nom`, `prenom`, `adresse`, `login`, `passwd`) VALUES
(7, 'ADMINISTRATOR', 'BATUT', 'Seabstien', '35 cchemin ttot', 'sbatut', '827ccbeea8a706c4c34a16891f84e7b'),
(8, 'VISITEUR', 'BATUT', 'André', '10 Hameau de  beausoleil 12330 marcillac', 'undefined', 'undefined'),
(9, 'VISITEUR', 'DUPONT', 'henri', '10 rue jacque prevert 31000 TOULOUSE', 'undefined', 'undefined'),
(11, 'USER', 'MERLHE', 'Pierrette', 'saint-marcel 12330 conques', 'pmerlhe', '827ccbeea8a706c4c34a16891f84e7b'),
(12, 'VISITEUR', 'DURAND', 'Sébastien', '10 bd lascrosse 31000 TOULOUSE', 'undefined', 'undefined'),
(13, 'USER', 'BATUT', 'Paul', '10 avenue petit 31000 TOULOUSE', 'pbatut', '827ccbeea8a706c4c34a16891f84e7b'),
(14, 'USER', 'BATUT', 'Matthieu', '10 bd lascrosse 31000 TOULOUSE', 'mbatut', '827ccbeea8a706c4c34a16891f84e7b'),
(15, 'VISITEUR', 'DUBOIS', 'Patrick', '15 rue des renards 12000 RODEZ', 'undefined', 'undefined'),
(16, 'VISITEUR', 'DUBOIS', 'Laurent', '10 avenue petit 31000 TOULOUSE', 'undefined', 'undefined'),
(17, 'VISITEUR', 'DUBOIS', 'Paul', '10 avenue petit 31000 TOULOUSE', 'undefined', 'undefined'),
(18, 'VISITEUR', 'DUBOIS', 'kevin', '10 rue jacque prevert 31000 TOULOUSE', 'undefined', 'undefined'),
(19, 'VISITEUR', 'BATUT', 'Yoan', '15 chemin des rosiers 31500 Toulouse', 'undefined', 'undefined'),
(20, 'VISITEUR', 'PETIT', 'Laurent', '35 chemen daurat 31000 TOULOUSE', 'undefined', 'undefined'),
(21, 'VISITEUR', 'PETIT', 'Laurent', '10 rue jacque prevert 31000 TOULOUSE', 'undefined', 'undefined');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`numero`,`user_id`),
  ADD KEY `fk_commande_user1_idx` (`user_id`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ingredient_pizza`
--
ALTER TABLE `ingredient_pizza`
  ADD PRIMARY KEY (`ingredient_id`,`pizza_id`),
  ADD KEY `fk_ingredient_has_pizza_pizza1_idx` (`pizza_id`),
  ADD KEY `fk_ingredient_has_pizza_ingredient_idx` (`ingredient_id`);

--
-- Index pour la table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pizza_commande`
--
ALTER TABLE `pizza_commande`
  ADD PRIMARY KEY (`pizza_id`,`commande_numero`),
  ADD KEY `fk_pizza_has_commande_commande1_idx` (`commande_numero`),
  ADD KEY `fk_pizza_has_commande_pizza1_idx` (`pizza_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ingredient_pizza`
--
ALTER TABLE `ingredient_pizza`
  ADD CONSTRAINT `fk_ingredient_has_pizza_ingredient` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ingredient_has_pizza_pizza1` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `pizza_commande`
--
ALTER TABLE `pizza_commande`
  ADD CONSTRAINT `fk_pizza_has_commande_commande1` FOREIGN KEY (`commande_numero`) REFERENCES `commande` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pizza_has_commande_pizza1` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
