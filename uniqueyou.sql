-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 24 Novembre 2023 à 20:11
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
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `_id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `prix` float NOT NULL,
  `prix_promo` float DEFAULT NULL,
  `promotion` int(1) DEFAULT '0',
  `image` varchar(200) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `statut` varchar(15) DEFAULT 'En-cours',
  `date_cmd` datetime DEFAULT CURRENT_TIMESTAMP,
  `decision` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `quantite` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id`, `_id`, `libelle`, `prix`, `prix_promo`, `promotion`, `image`, `description`, `id_user`, `type`, `statut`, `date_cmd`, `decision`, `id_client`, `quantite`) VALUES
(36, 11, 'Lait Beaute', 20, 15, 0, './assets/images/database/', '', 19, 3, 'Finale', '2023-11-24 15:56:49', 1, 14, 2),
(40, 1, 'bama mayo', 110, 0, 0, './assets/images/database/', '', 14, 2, 'Finale', '2023-11-24 19:43:17', 0, 19, 1),
(41, 3, 'gazouz', 10, 0, 0, './assets/images/database/', '', 14, 2, 'Finale', '2023-11-24 19:43:17', 1, 19, 1),
(42, 4, 'Jus ananas', 100, 0, 0, './assets/images/database/', '', 15, 2, 'En-cours', '2023-11-24 19:43:17', NULL, 19, 1),
(43, 7, 'Maltina', 10, 0, 0, './assets/images/database/', '', 15, 2, 'En-cours', '2023-11-24 19:43:17', NULL, 19, 1),
(44, 8, 'Las', 15, 0, 0, './assets/images/database/', '', 15, 2, 'En-cours', '2023-11-24 19:43:17', NULL, 19, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `_id` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `ville` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT '1',
  `mdps` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`_id`, `nom`, `telephone`, `email`, `codePostal`, `ville`, `pays`, `type`, `mdps`) VALUES
(1, 'ABC Inc.', '123-456-7890', 'abc@example.com', 12345, 'New York', 'USA', 1, '1234'),
(2, 'XYZ Company', '987-654-3210', 'xyz@example.com', 54321, 'Los Angeles', 'USA', 3, '1234'),
(3, 'Smith & Sons', '555-123-4567', 'smith@example.com', 67890, 'Chicago', 'USA', 1, '1234'),
(6, 'Lee Tang', 'lee@example.com', '222-888-4444', 45678, 'Miami', 'USA', 1, '1234'),
(14, 'Guedila', '00213779063957', 'guedila@example.com', 35000, 'Boumerdes', 'Algerie', 2, '1234'),
(15, 'saleh mahamat', 'saleh@example.com', '123456789', 23456, 'Boumerdes', 'Algerie', 2, '1234'),
(16, 'BILT', '2345678', 'biltheoitoua@gmail.com', 35000, 'Boumerdes', 'Algerie', 3, '1234'),
(17, 'SQLEH', '3456789', 'salehindev@example.com', 35000, 'BoumerdÃ©s', 'AlgÃ©rie', 1, '1234'),
(18, 'SQLEH', '23456789', 'salehindev@df.com', 3, 'Boudouaou', 'AlgÃ©rie', 2, '1234'),
(19, 'saleh dans le dev', '234567', 'salehindev@dIf.com', 35000, 'Boumerdes', 'Angola', 3, '1234'),
(20, 'unique you', '456734563', 'admin@uniqueyou.com', 35000, 'Boumerdes', 'ALGERIE', 4, '1234');

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
(16, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'AlgÃ©rie', '2023-12-09', 18),
(17, '023456789', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'Boudouaou', 'BÃ©nin', '2023-12-01', 18),
(18, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'AlgÃ©rie', '2023-11-06', 18),
(19, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'Lesotho', '2023-11-06', 18),
(20, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'Angola', '2023-11-06', 18),
(21, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'Angola', '2023-11-06', 18),
(22, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'Gabon', '2023-11-06', 18),
(23, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'Djibouti', '2023-11-18', 18),
(24, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'Angola', '2023-11-06', 18),
(25, '023456789', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'Boudouaou', 'Cameroun', '2023-11-15', 18),
(26, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'AlgÃ©rie', '2023-11-06', 18),
(27, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'AlgÃ©rie', '2023-11-06', 18),
(28, '023456789', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'Boudouaou', 'AlgÃ©rie', '2023-11-08', 18),
(29, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bo', 'BoumerdÃ©s', 'AlgÃ©rie', '2023-11-16', 19),
(30, '+213779063957', '35000 Algerie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'Boumerdes', 'Tchad', '2023-11-16', 6),
(31, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'Angola', '2023-11-17', 19),
(32, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'Burundi', '2023-11-17', 19),
(33, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'AlgÃ©rie', '2023-11-17', 19),
(34, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'AlgÃ©rie', '2023-11-17', 19),
(35, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'AlgÃ©rie', '2023-11-17', 19),
(36, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'AlgÃ©rie', '2023-11-17', 19),
(37, '023456789', '35000 Algerie Boumerdes residence universitaire Bo', 'Boudouaou', 'Angola', '2023-11-17', 19),
(38, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'AlgÃ©rie', '2023-11-17', 19),
(39, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'AlgÃ©rie', '2023-11-25', 19),
(40, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'AlgÃ©rie', '2023-11-17', 19),
(41, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'Angola', '2023-11-17', 19),
(42, '023456789', '35000 Algerie Boumerdes residence universitaire Bo', 'Boudouaou', 'Lesotho', '2023-11-17', 19),
(43, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'Lesotho', '2023-11-17', 19),
(44, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'Angola', '2023-11-17', 19),
(45, '023456789', '35000 Algerie Boumerdes residence universitaire Bo', 'Boudouaou', 'Madagascar', '2023-11-17', 19),
(46, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'Lesotho', '2023-11-17', 19),
(47, '023456789', '35000 Algerie Boumerdes residence universitaire Bo', 'Boudouaou', 'Djibouti', '2023-11-24', 19),
(48, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'Angola', '2023-12-03', 19),
(49, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'Afrique du Sud', '2023-11-25', 19),
(50, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'BÃ©nin', '2023-11-23', 19),
(51, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'AlgÃ©rie', '2023-11-23', 19),
(52, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'RDC', '2023-11-24', 19),
(53, '+213779063957', '35000 Algerie Boumerdes residence universitaire Bo', 'Boumerdes', 'Angola', '2023-11-23', 19),
(54, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'BoumerdÃ©s', 'Gabon', '2023-11-24', 14),
(55, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'BoumerdÃ©s', 'Gabon', '2023-11-24', 14),
(56, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'BoumerdÃ©s', 'Gabon', '2023-11-24', 14),
(57, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'BoumerdÃ©s', 'Gabon', '2023-11-24', 14),
(58, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'BoumerdÃ©s', 'Comores', '2023-11-24', 14),
(59, '+213779063957', '35000 AlgÃ©rie Boumerdes rÃ©sidence universitaire Bouhri Boulem ex inh', 'BoumerdÃ©s', 'Gabon', '2023-11-24', 19);

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `_id` int(11) NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` float NOT NULL,
  `prix_promo` float DEFAULT NULL,
  `promotion` int(1) DEFAULT '0',
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`_id`, `libelle`, `prix`, `prix_promo`, `promotion`, `image`, `description`, `id_user`, `type`) VALUES
(1, 'bama mayo', 110, 0, 0, './assets/images/database/téléchargement (2)_1700141698416.jfif', '', 14, 2),
(3, 'gazouz', 10, 0, 0, './assets/images/database/photo.jpg', '', 14, 2),
(4, 'Jus ananas', 100, 0, 0, './assets/images/database/téléchargement_1698874519363.jpg', '', 15, 2),
(7, 'Maltina', 10, 0, 0, './assets/images/database/KITCHEN BOTANY_ Rice (1)_1698790372607.jpg', '', 15, 2),
(8, 'Las', 15, 0, 0, './assets/images/database/téléchargement_1698790442320.jpg', '', 15, 2),
(11, 'Lait Beaute', 20, 15, 0, './assets/images/database/téléchargement (3)_1700145403698.jfif', '', 19, 3),
(13, 'Tab', 5, 3, 1, './assets/images/database/téléchargement (4)_1700164990771.jfif', '', 19, 3);

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
(46, 8, 19),
(47, 7, 19),
(49, 8, 15),
(50, 8, 15),
(51, 7, 15),
(59, 4, 19);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `mescascades` (`id_user`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `mescascades_item` (`id_user`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `mescascades_panier` (`id_user`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `formulaire`
--
ALTER TABLE `formulaire`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `formulaire`
--
ALTER TABLE `formulaire`
  ADD CONSTRAINT `formulaire_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `compte` (`_id`),
  ADD CONSTRAINT `mescascades` FOREIGN KEY (`id_user`) REFERENCES `compte` (`_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `compte` (`_id`),
  ADD CONSTRAINT `mescascades_item` FOREIGN KEY (`id_user`) REFERENCES `compte` (`_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `mescascades_panier` FOREIGN KEY (`id_user`) REFERENCES `compte` (`_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
