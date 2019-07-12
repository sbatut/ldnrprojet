-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 12 Juillet 2019 à 07:23
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
(1, '2019-07-12 03:21:46', 1, 'Terminee'),
(2, '2019-07-12 03:22:05', 2, 'Terminee'),
(3, '2019-07-12 03:22:02', 1, 'Terminee');

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
(12, 'Merguez', 2),
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
(1, 'Client', 'Dupont', 'Dubois', 'Toulouse', 'toto', 'password'),
(2, 'Client', 'Tur', 'Brian', 'Pamiers', 'toto2', 'pwd'),
(3, 'Client', 'Roger', 'Robert', 'Labège', 'toto3', 'pwd');

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
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
