-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 30 mars 2022 à 14:31
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hypnos`
--

-- --------------------------------------------------------

--
-- Structure de la table `attachement`
--

DROP TABLE IF EXISTS `attachement`;
CREATE TABLE IF NOT EXISTS `attachement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suite_id` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdd_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_901C19614FFCB518` (`suite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attachement`
--

INSERT INTO `attachement` (`id`, `suite_id`, `updated_at`, `image`, `createdd_at`) VALUES
(1, 3, '2022-03-22 13:15:49', 'bedroom-g1a40a897f_640.jpg', '2022-03-22 13:15:48'),
(2, 3, '2022-03-22 13:15:49', 'architectural-g61a92766d_640.jpg', '2022-03-22 13:15:48'),
(3, 4, '2022-03-22 16:10:43', 'bedroom-gdb452d0fc_640.jpg', '2022-03-22 16:10:43'),
(4, 4, '2022-03-22 16:10:43', 'conference-room-gf3c16454d_1920.jpg', '2022-03-22 16:10:43'),
(5, 5, '2022-03-29 11:49:31', 'inner-space-g629be2042_640.jpg', '2022-03-29 11:49:30'),
(6, 5, '2022-03-29 11:49:31', 'massage-gaba9068db_640.jpg', '2022-03-29 11:49:30'),
(7, 5, '2022-03-29 11:49:31', 'water-g29c5b81b7_640.jpg', '2022-03-29 11:49:30'),
(8, 5, '2022-03-29 11:49:31', 'greece-g6f5d42fbe_640.jpg', '2022-03-29 11:49:30'),
(9, 3, '2022-03-29 12:12:03', 'pool-ge0270a6ad_640.jpg', '2022-03-29 12:12:02'),
(10, 3, '2022-03-29 12:12:03', 'luxury-hotel-gf3c6123de_640.jpg', '2022-03-29 12:12:02'),
(11, 4, '2022-03-29 12:13:26', 'massage-gaba9068db_640.jpg', '2022-03-29 12:13:26'),
(12, 4, '2022-03-29 12:13:26', 'inner-space-g629be2042_640.jpg', '2022-03-29 12:13:26'),
(13, 6, '2022-03-29 12:50:40', 'sea-g0e0670b73_640.jpg', '2022-03-29 12:50:40'),
(14, 6, '2022-03-29 12:50:40', 'hotel-ga75bf0900_640.jpg', '2022-03-29 12:50:40'),
(15, 6, '2022-03-29 12:50:40', 'window-gfbd58cccf_640.jpg', '2022-03-29 12:50:40'),
(16, 6, '2022-03-29 12:50:40', 'pool-bar-g5822ade5f_640.jpg', '2022-03-29 12:50:40');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C62E63823EDC87` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `subject_id`, `name`, `email`, `phone`, `content`, `created_at`, `is_read`) VALUES
(1, 2, 'Robert', 'robert@gmail.com', '02-40-54-50-12', 'J\'aimerais savoir si vous pouvez venir nous chercher à la gare.', '2022-03-22 18:44:03', 1),
(2, 2, 'Robert', 'robert@gmail.com', '0240545012', 'Est-ce possible de venir nous chercher à la gare?', '2022-03-22 18:44:35', 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220323123355', '2022-03-23 12:45:46', 2216),
('DoctrineMigrations\\Version20220324094904', '2022-03-24 09:54:43', 80),
('DoctrineMigrations\\Version20220324160558', '2022-03-24 16:08:27', 84),
('DoctrineMigrations\\Version20220325132200', '2022-03-25 13:22:54', 83),
('DoctrineMigrations\\Version20220328162128', '2022-03-28 16:23:27', 86),
('DoctrineMigrations\\Version20220328164211', '2022-03-28 16:43:56', 90),
('DoctrineMigrations\\Version20220329131839', '2022-03-29 13:19:26', 80),
('DoctrineMigrations\\Version20220329135349', '2022-03-29 13:54:43', 80),
('DoctrineMigrations\\Version20220329152137', '2022-03-29 15:22:19', 78),
('DoctrineMigrations\\Version20220330134200', '2022-03-30 13:42:33', 62);

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

DROP TABLE IF EXISTS `etablissement`;
CREATE TABLE IF NOT EXISTS `etablissement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_suite` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `villes_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_20FD592C286C17BC` (`villes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id`, `name`, `adress`, `description`, `nombre_suite`, `updated_at`, `thumbnail`, `villes_id`, `slug`, `short_description`) VALUES
(1, 'La Croisette', '3 boulevard de la mer 06000 Nice', 'Notre hôtel « La Croisette », c\'est le confort de l\'hôtel de bord de mer, avec la richesse des activités d\'un hôtel 5*. C\'est le lieu idéal pour ceux qui veulent aller sur la Côte méditerranéenne, mais être accompagnés durant leur séjour!\r\nOn est ouverts toute l\'année et la région est attirante et vivante à tout moment. \r\nToutes vos suites disposent:\r\nspa privatif\r\nsauna et hamam\r\ndu room service 24h24\r\nde musique d\'ambiance\r\nbain à remou\r\nmatelas à mémoire de forme\r\nLors de votre séjour, vous bénéficier également\r\nd\'un massage par jour\r\nd\'une piscine extérieur et intérieur\r\nbar à volonté\r\npension complète au restaurant gastronome de l\'hôtel\r\nVous pourrez profiter d\'un jardin avec barbecue et faire de la randonnée dans les environs.', 6, '2022-03-23 13:34:16', 'burj-al-arab-2624317_1920.jpg', 1, 'croisette', 'Profitez d\'un séjour romantique avec service all exclusive dans de magnifique chambre tout confort.'),
(2, 'Dream Castle', '3 boulevard de la mer 56250 Quiberon', 'Notre château  « Dream Castle », vous accueille toute l\'année avec la richesse du confort, du luxe et du romantisme. C\'est le lieu idéal pour  les couples en quète de calme, magie et de douceur. Vous pourrez également vous aérez et découvrir la région magnifique de la Bretagne.\r\nToutes vos suites disposent:\r\nspa privatif\r\nsauna et hamam\r\ndu room service 24h24\r\nde musique d\'ambiance\r\nbain à remou\r\nmatelas à mémoire de forme\r\nLors de votre séjour, vous bénéficier également\r\nd\'un massage par jour\r\nd\'une piscine extérieur et intérieur\r\nbar à volonté\r\npension complète au restaurant gastronome de l\'hôtel\r\nVous pourrez profiter d\'un jardin avec barbecue et faire de la randonnée dans les environs.', 5, '2022-03-22 11:39:17', 'new-town-hall-g4138c772a_1920.jpg', 2, 'dream-club', 'Profitez d\'un séjour romantique avec service all exclusive dans de magnifique chambre tout confort.'),
(3, 'Royal Hôtel', '15 place du Duc 75000 Paris', 'Notre hôtel  « Royal hôtel », vous accueille toute l\'année avec la richesse du confort, du luxe et du romantisme. C\'est le lieu idéal pour  les couples en quète de calme, magie et de douceur. Paris est la ville du romantisme et nous vous permettons de la découvrir avec votre chauffeur privatif.\r\nToutes vos suites disposent:\r\nspa privatif\r\nsauna et hamam\r\ndu room service 24h24\r\nde musique d\'ambiance\r\nbain à remou\r\nmatelas à mémoire de forme\r\nLors de votre séjour, vous bénéficier également\r\nd\'un massage par jour\r\nd\'une piscine extérieur et intérieur\r\nbar à volonté\r\npension complète au restaurant gastronome de l\'hôtel\r\nVous pourrez profiter d\'un jardin avec barbecue et faire de la randonnée dans les environs.', 10, '2022-03-23 13:50:47', 'las-vegas-gf21372716_1920.jpg', 3, 'royal-hotel', 'Profitez d\'un séjour romantique avec service all exclusive dans de magnifique chambre tout confort.'),
(4, 'Chic Hôtel', '3 boulevard des mers 14600 Honfleurs', 'Notre hôtel  « Chic Hôtel », vous accueille toute l\'année avec la richesse du confort, du luxe et du romantisme. C\'est le lieu idéal pour  les couples en quète de calme, magie et de douceur. Vous pourrez également vous aérez et découvrir la région magnifique de la Normandie.\r\nToutes vos suites disposent:\r\nspa privatif\r\nsauna et hamam\r\ndu room service 24h24\r\nde musique d\'ambiance\r\nbain à remou\r\nmatelas à mémoire de forme\r\nLors de votre séjour, vous bénéficier également\r\nd\'un massage par jour\r\nd\'une piscine extérieur et intérieur\r\nbar à volonté\r\npension complète au restaurant gastronome de l\'hôtel\r\nVous pourrez profiter d\'un jardin avec barbecue et faire de la randonnée dans les environs.', 8, '2022-03-22 13:30:10', 'pool-g707570cda_640.jpg', 4, 'chic-hotel', 'Profitez d\'un séjour romantique avec service all exclusive dans de magnifique chambre tout confort.'),
(5, 'Beach Luxury', '20 place royale 34200 Sète', 'Notre hôtel  « Beach Luxury », vous accueille toute l\'année avec la richesse du confort, du luxe et du romantisme. C\'est le lieu idéal pour  les couples en quète de calme, magie et de douceur. Vous pourrez également vous aérez et découvrir la région magnifique de la Méditerannée.\r\nToutes vos suites disposent:\r\nspa privatif\r\nsauna et hamam\r\ndu room service 24h24\r\nde musique d\'ambiance\r\nbain à remou\r\nmatelas à mémoire de forme\r\nLors de votre séjour, vous bénéficier également\r\nd\'un massage par jour\r\nd\'une piscine extérieur et intérieur\r\nbar à volonté\r\npension complète au restaurant gastronome de l\'hôtel\r\nVous pourrez profiter d\'un jardin avec barbecue et faire de la randonnée dans les environs.', 6, '2022-03-22 13:31:25', 'swimming-pool-g2382234a9_640.jpg', 5, 'beach-luxury', 'Profitez d\'un séjour romantique avec service all exclusive dans de magnifique chambre tout confort.'),
(6, 'Pallazo Castle', '3 allée des châteaux 01000 Tourcoing', 'Notre château « Palazzo Castle », vous accueille toute l\'année avec la richesse du confort, du luxe et du romantisme. C\'est le lieu idéal pour les couples en quète de calme, magie et de douceur. Vous pourrez également vous aérez et découvrir la région magnifique du Nord. Toutes vos suites disposent: spa privatif sauna et hamam du room service 24h24 de musique d\'ambiance bain à remou matelas à mémoire de forme Lors de votre séjour, vous bénéficier également d\'un massage par jour d\'une piscine extérieur et intérieur bar à volonté pension complète au restaurant gastronome de l\'hôtel Vous pourrez profiter d\'un jardin avec barbecue et faire de la randonnée dans les environs.', 10, '2022-03-22 17:06:51', 'hotel-gca98ab369_1920.jpg', 7, 'pallazo-castle', 'Profitez d\'un séjour romantique avec service all exclusive dans de magnifique chambre tout confort.'),
(7, 'Romantic Hôtel', '3 rue An toinette 68000 Strasbourg', 'Notre hôtel «Romantic Hôtel», vous accueille toute l\'année avec la richesse du confort, du luxe et du romantisme. C\'est le lieu idéal pour les couples en quète de calme, magie et de douceur. Vous pourrez également vous aérez et découvrir la région magnifique de l\' est. Toutes vos suites disposent: spa privatif sauna et hamam du room service 24h24 de musique d\'ambiance bain à remou matelas à mémoire de forme Lors de votre séjour, vous bénéficier également d\'un massage par jour d\'une piscine extérieur et intérieur bar à volonté pension complète au restaurant gastronome de l\'hôtel Vous pourrez profiter d\'un jardin avec barbecue et faire de la randonnée dans les environs.', 6, '2022-03-23 13:58:08', 'real-estate-ga47612c91_1920.jpg', 6, 'romantic-hotel', 'Profitez d\'un séjour romantique avec service all exclusive dans de magnifique chambre tout confort.');

-- --------------------------------------------------------

--
-- Structure de la table `gerant`
--

DROP TABLE IF EXISTS `gerant`;
CREATE TABLE IF NOT EXISTS `gerant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etablissement_id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D1D45C70E7927C74` (`email`),
  UNIQUE KEY `UNIQ_D1D45C70FF631228` (`etablissement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gerant`
--

INSERT INTO `gerant` (`id`, `email`, `roles`, `password`, `etablissement_id`, `firstname`, `lastname`) VALUES
(1, 'mathieu@gmail.com', '[\"ROLE_EDITOR\"]', 'Mathieu44', 7, 'Mathieu', 'Duval'),
(3, 'stephane@gmail.com', '[\"ROLE_EDITOR\"]', 'Stephane20', 2, 'Stephane', 'Le Tallec'),
(4, 'albert@gmail.com', '[\"ROLE_EDITOR\"]', 'Albert36', 3, 'Albert', 'Chartrin'),
(6, 'berangere@gmail.com', '[\"ROLE_EDITOR\"]', 'Berangere12', 4, 'Bérangère', 'Lupin'),
(7, 'steven@gmail.com', '[\"ROLE_EDITOR\"]', 'Steven65', 5, 'Steven', 'Poulain'),
(8, 'sophie@gmail.com', '[\"ROLE_EDITOR\"]', 'Sophie21', 6, 'Sophie', 'Bellagio'),
(11, 'cecile@gmail.com', '[\"ROLE_EDITOR\"]', 'Cecile56', 1, 'Cécile', 'Porcher');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:170:\\\"https://127.0.0.1:8000/verify/email?expires=1647620540&signature=BVHXPU8GhMuxZ6o5qG9IO0ch7C%2BL4HwX3ewfJoLhAf4%3D&token=%2FyC%2Biorm70wz3sHkTEdritniXsU5zqpzLQpp54U341s%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"delphine.gavaud56@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:16:\\\"\\\"contact hypnos\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"lucas@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2022-03-18 15:22:20', '2022-03-18 15:22:20', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:169:\\\"https://127.0.0.1:8000/verify/email?expires=1647879831&id=3&signature=CrRvD28UK1wDC1BjgevmqLM9rD4MEV5DKlDmti3165o%3D&token=d9LxcNohSDExRaPdSZ4mmLJD3JsHacrVMIXi7Q0PXr8%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"delphine.gavaud56@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:16:\\\"\\\"contact hypnos\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"dert@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2022-03-21 15:23:52', '2022-03-21 15:23:52', NULL),
(3, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:171:\\\"https://127.0.0.1:8000/verify/email?expires=1648032543&id=4&signature=l1UKsmj02moCKwiWcde38uvz2hCmzugFO7Tyy2KVM68%3D&token=sRfpe3mseiERfVfgU2a4AyrATb66pm%2BJHKiosyX7kXM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"delphine.gavaud56@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:16:\\\"\\\"contact hypnos\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:16:\\\"cecile@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2022-03-23 09:49:04', '2022-03-23 09:49:04', NULL),
(4, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:175:\\\"https://127.0.0.1:8000/verify/email?expires=1648032748&id=5&signature=qTxWB2%2BgjoJNNM59aRyyNyvM5G6F84xq9%2Fg2HegHsd0%3D&token=YWafZ3oExU0aZqc%2BIebfiMVbHDf4Uoi0WjUEVVOPrrk%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"delphine.gavaud56@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:16:\\\"\\\"contact hypnos\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:16:\\\"sophie@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2022-03-23 09:52:28', '2022-03-23 09:52:28', NULL),
(5, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:173:\\\"https://127.0.0.1:8000/verify/email?expires=1648585273&id=6&signature=MY%2Fnqd3blCSRdd%2FBdGaHzBm8pEge5KmkCesBViXSo2s%3D&token=ihJrAVAT6CdXuqAv1PuuSBL5sxpc6eRghJ9suWMQ1F8%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"delphine.gavaud56@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:16:\\\"\\\"contact hypnos\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"mathieu@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2022-03-29 19:21:17', '2022-03-29 19:21:17', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `suites_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `decription` longtext COLLATE utf8mb4_unicode_ci,
  `all_day` tinyint(1) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etablissement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_42C84955F452D9C6` (`suites_id`),
  KEY `IDX_42C84955A76ED395` (`user_id`),
  KEY `IDX_42C84955FF631228` (`etablissement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `date_debut`, `date_fin`, `suites_id`, `user_id`, `decription`, `all_day`, `titre`, `etablissement_id`) VALUES
(1, '2022-04-09', '2022-04-10', 3, 1, 'Réservation d\'une nuit', 1, 'réservation', 1),
(4, '2022-04-01', '2022-04-02', 4, 1, 'location', 1, 'réservation', 1),
(6, '2022-04-01', '2022-04-02', 3, NULL, NULL, 1, 'réservation', 1),
(7, '2022-05-11', '2022-05-12', 3, NULL, NULL, 1, 'réservation', 1),
(8, '2022-04-11', '2022-04-13', 3, 3, NULL, 1, 'réservation', 1),
(12, '2022-03-30', '2022-03-31', 4, 1, 'hgvhvv', 0, 'reservation', 1),
(13, '2022-03-30', '2022-03-31', 5, 3, NULL, 0, 'réservation', NULL),
(14, '2022-04-15', '2022-04-16', 5, 3, NULL, 1, 'reservation', NULL),
(15, '2022-05-01', '2022-05-08', 5, 6, NULL, 1, 'reservation', NULL),
(16, '2022-04-01', '2022-04-02', 3, 3, NULL, 0, 'réservation', NULL),
(17, '2022-04-04', '2022-04-05', 4, 3, NULL, 1, 'réservation', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reservation_suite`
--

DROP TABLE IF EXISTS `reservation_suite`;
CREATE TABLE IF NOT EXISTS `reservation_suite` (
  `reservation_id` int(11) NOT NULL,
  `suite_id` int(11) NOT NULL,
  PRIMARY KEY (`reservation_id`,`suite_id`),
  KEY `IDX_56433481B83297E7` (`reservation_id`),
  KEY `IDX_564334814FFCB518` (`suite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservation_suite`
--

INSERT INTO `reservation_suite` (`reservation_id`, `suite_id`) VALUES
(4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `subject`
--

INSERT INTO `subject` (`id`, `titre`) VALUES
(1, 'Je souhaite poser une réclamation'),
(2, 'Je souhaite commander un service supplémentaire'),
(3, 'Je souhaite en savoir plus sur une suite'),
(4, 'J\'ai un souci avec l\'application');

-- --------------------------------------------------------

--
-- Structure de la table `suite`
--

DROP TABLE IF EXISTS `suite`;
CREATE TABLE IF NOT EXISTS `suite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `etablissement_id` int(11) NOT NULL,
  `ville_id` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gerant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_153CE426FF631228` (`etablissement_id`),
  KEY `IDX_153CE426A73F0036` (`ville_id`),
  KEY `IDX_153CE426A500A924` (`gerant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `suite`
--

INSERT INTO `suite` (`id`, `titre`, `thumbnail`, `description`, `price`, `etablissement_id`, `ville_id`, `updated_at`, `image`, `slug`, `gerant_id`) VALUES
(3, 'Galaxy Suite', 'hotel-g678651f19_640.jpg', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 15500, 1, 1, '2022-03-22 13:15:49', NULL, 'galaxy-suite', 11),
(4, 'Dream Suite', 'new-town-hall-g4138c772a_1920.jpg', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 25000, 2, 2, '2022-03-22 16:10:43', NULL, 'galaxy-suite', 3),
(5, 'Star Suite', 'hotel-gca98ab369_1920.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 19500, 6, 7, '2022-03-29 11:49:31', NULL, 'star-suite', 1),
(6, 'Le rêve Bleu', 'architecture-g6995b04be_1920.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 14000, 4, 4, '2022-03-29 12:50:40', NULL, 'le-reve-bleu', 6);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastnamme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastnamme`, `is_verified`) VALUES
(1, 'lucas@gmail.com', '[]', '$2y$13$k142cpYHsDVgJ25WFRQr6uLeoFCEi57Y98MUVDM1vijQR9x0O3.N.', 'lucas', 'kuint', 1),
(3, 'dert@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$cHLTel78PIbhpTnGSwD8XO/8918YZNnCL6RRC7bIBFzmh.zzaUK06', 'Dert', 'Floriane', 1),
(5, 'sophie@gmail.com', '[\"ROLE_EDITOR\"]', '$2y$13$CTkmqVh/y4GH8ogDJwtC5efy25FQvIXBjHJYjoGjmm0MuQoyGYZne', 'Sophie', 'Bellagio', 1),
(6, 'mathieu@gmail.com', '[]', '$2y$13$a40CXBS3hWqbO.SecHr/SuVJSyWblCQ0M/xmHbOyCAN4alLYq7rO6', 'mathieu', 'Duval', 0);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `name`, `region`) VALUES
(1, 'Nice', 'Provence-alpes côte d\'azur'),
(2, 'Quiberon', 'Bretagne'),
(3, 'Paris', 'Ile de france'),
(4, 'Honfleur', 'Basse-Normandie'),
(5, 'Sète', 'Languedoc-Roussillon'),
(6, 'Strasbourg', 'Alsace'),
(7, 'Tourcoing', 'Nord-Pas-de-Calais');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attachement`
--
ALTER TABLE `attachement`
  ADD CONSTRAINT `FK_901C19614FFCB518` FOREIGN KEY (`suite_id`) REFERENCES `suite` (`id`);

--
-- Contraintes pour la table `contact`aykwi9uf8l3gm88s
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_4C62E63823EDC87` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`);

--
-- Contraintes pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `FK_20FD592C286C17BC` FOREIGN KEY (`villes_id`) REFERENCES `ville` (`id`);

--
-- Contraintes pour la table `gerant`
--
ALTER TABLE `gerant`
  ADD CONSTRAINT `FK_D1D45C70FF631228` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C84955A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_42C84955F452D9C6` FOREIGN KEY (`suites_id`) REFERENCES `suite` (`id`),
  ADD CONSTRAINT `FK_42C84955FF631228` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`);

--
-- Contraintes pour la table `reservation_suite`
--
ALTER TABLE `reservation_suite`
  ADD CONSTRAINT `FK_564334814FFCB518` FOREIGN KEY (`suite_id`) REFERENCES `suite` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_56433481B83297E7` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `suite`
--
ALTER TABLE `suite`
  ADD CONSTRAINT `FK_153CE426A500A924` FOREIGN KEY (`gerant_id`) REFERENCES `gerant` (`id`),
  ADD CONSTRAINT `FK_153CE426A73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`),
  ADD CONSTRAINT `FK_153CE426FF631228` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
