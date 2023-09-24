-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 24 Septembre 2023 à 23:21
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `uniqueyou`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `_id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `ville` varchar(25) NOT NULL,
  `pays` varchar(20) NOT NULL,
  `type` int(11) DEFAULT '1',
  `mdps` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`_id`, `nom`, `telephone`, `email`, `codePostal`, `ville`, `pays`, `type`, `mdps`) VALUES
(1, 'ABC Inc.', '123-456-7890', 'abc@example.com', 12345, 'New York', 'USA', 1, '1234'),
(2, 'XYZ Company', '987-654-3210', 'xyz@example.com', 54321, 'Los Angeles', 'USA', 3, '1234'),
(3, 'Smith & Sons', '555-123-4567', 'smith@example.com', 67890, 'Chicago', 'USA', 1, '1234'),
(4, 'GreenTech Ltd.', '333-999-8888', 'greentech@example.com', 98765, 'San Francisco', 'USA', 1, '1234'),
(5, 'Brown Industries', '111-777-2222', 'brown@example.com', 56789, 'Houston', 'USA', 3, '1234'),
(6, 'Lee Enterprises', '222-888-4444', 'lee@example.com', 45678, 'Miami', 'USA', 1, '1234'),
(7, 'Turner Corp.', '777-555-1111', 'turner@example.com', 76543, 'Boston', 'USA', 3, '1234'),
(8, 'Davis Holdings', '666-222-9999', 'davis@example.com', 34567, 'Seattle', 'USA', 2, '1234'),
(9, 'WhiteTech Solutions', '444-666-3333', 'whitetech@example.com', 23456, 'Denver', 'USA', 2, '1234'),
(10, 'Wilson Group', '888-333-7777', 'wilson@example.com', 65432, 'Austin', 'USA', 2, '1234'),
(14, 'Guedila', '00213779063957', 'guedila@example.com', 35000, 'Boumerdes', 'Algerie', 2, '1234'),
(15, 'saleh mahamat', 'saleh@example.com', '123456789', 23456, 'Boumerdes', 'Algerie', 2, '1234'),
(16, 'BILT', '2345678', 'biltheoitoua@gmail.com', 35000, 'Boumerdes', 'Algerie', 3, '1234'),
(17, 'SQLEH', '3456789', 'salehindev@example.com', 35000, 'BoumerdÃ©s', 'AlgÃ©rie', 1, '1234'),
(18, 'SQLEH', '23456789', 'salehindev@df.com', 3, 'Boudouaou', 'AlgÃ©rie', 2, '1234'),
(19, 'salehindev', '34567', 'salehindev@dIf.com', 3, 'Boudouaou', 'Angola', 3, '1234');

-- --------------------------------------------------------

--
-- Structure de la table `formulaire`
--

CREATE TABLE `formulaire` (
  `_id` int(11) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `adresse` varchar(150) DEFAULT NULL,
  `ville` varchar(25) NOT NULL,
  `pays` varchar(20) NOT NULL,
  `jour` date DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `formulaire`
--

INSERT INTO `formulaire` (`_id`, `telephone`, `adresse`, `ville`, `pays`, `jour`, `id_user`) VALUES
(1, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'AlgÃ©rie', '2023-09-29', 15),
(2, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'AlgÃ©rie', '2023-09-29', 14),
(3, '+213779063957', '102 rue du pont rale', 'Boudoua', 'Burundi', '2023-10-07', 16),
(4, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'AlgÃ©rie', '2023-09-20', 17),
(5, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'BÃ©nin', '2023-09-30', 19);

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `_id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `prix` float NOT NULL,
  `prix_promo` float DEFAULT NULL,
  `promotion` int(1) DEFAULT '0',
  `image` varchar(200) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`_id`, `libelle`, `prix`, `prix_promo`, `promotion`, `image`, `description`, `id_user`, `type`) VALUES
(1, 'bama', 100, 0, 0, './assets/images/database/photo.jpg', '', 14, 2),
(2, 'ifruit', 200, 160, 1, './assets/images/database/photo.jpg', '', 14, 2),
(3, 'gazouz', 10, 0, 0, './assets/images/database/photo.jpg', '', 14, 2),
(4, 'Jus', 123, 0, 0, './assets/images/database/photo.jpg', '', 15, 2),
(5, 'LLL', 234, 12, 1, './assets/images/database/photo.jpg', '', 16, 3),
(6, 'Jusly', 10, 0, 0, './assets/images/database/photo.jpg', '', 15, 2),
(7, 'jus planete', 250, 150, 1, './assets/images/database/photo.jpg', '', 15, 2),
(8, 'lait cardilait', 10, 0, 0, './assets/images/database/photo.jpg', '', 15, 2),
(9, 'Cafe', 140, 0, 0, './assets/images/database/photo_1695477018353.jpg', 'dhukhdkjfd fkujhdiljkhd \r\ndjhbdghd\r\nefgdhbkjdfthgyjl\r\ndchgnbdxlkj;c', 18, 2),
(12, 'huile vegetale', 6, 5, 1, './assets/images/database/mouala_1694466953904_1695477851561.jpg', 'huilesfdghjk\r\nsdfcv\r\nsdfcvb \r\nfgvbndfgchvberdtfghv\r\nrdgfcvbtdrfg\r\nhbntdrfgvhb\r\nerdfgcvbnstrdhg\r\nedgfvhbnsetdrfhbedgfcvbsretdrfghb\r\nedgfsedrgfhb', 19, 3);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `_id` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `panier`
--

INSERT INTO `panier` (`_id`, `id_item`, `id_user`) VALUES
(15, 1, 19),
(6, 2, 16),
(9, 3, 16),
(5, 5, 14),
(4, 5, 15),
(13, 5, 17),
(14, 5, 18),
(8, 6, 16),
(16, 6, 19),
(11, 7, 16),
(10, 8, 16),
(19, 12, 18);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`_id`);

--
-- Index pour la table `formulaire`
--
ALTER TABLE `formulaire`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `ligne_unique` (`id_item`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `formulaire`
--
ALTER TABLE `formulaire`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `formulaire`
--
ALTER TABLE `formulaire`
  ADD CONSTRAINT `formulaire_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `compte` (`_id`);

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `compte` (`_id`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`_id`),
  ADD CONSTRAINT `panier_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `compte` (`_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
