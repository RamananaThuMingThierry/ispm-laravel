-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 25 oct. 2023 à 07:07
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_ispm`
--

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `niveauClasses` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

DROP TABLE IF EXISTS `departements`;
CREATE TABLE IF NOT EXISTS `departements` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomDepartement` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomEtudiants` varchar(255) NOT NULL,
  `prenomEtudiants` varchar(255) DEFAULT NULL,
  `ddnEtudiants` date NOT NULL,
  `ldnEtudiants` varchar(255) NOT NULL,
  `sexe` varchar(191) NOT NULL,
  `contactEtudiants` varchar(191) NOT NULL,
  `emailEtudiants` varchar(250) NOT NULL,
  `adresseEtudiants` varchar(250) NOT NULL,
  `imageEtudidants` varchar(250) DEFAULT NULL,
  `numMatriculeMoto` varchar(191) DEFAULT NULL,
  `documents` varchar(191) NOT NULL,
  `codeBarre` varchar(191) NOT NULL,
  `filieres_id` bigint UNSIGNED NOT NULL,
  `classes_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etudiants_filieres_id_foreign` (`filieres_id`),
  KEY `etudiants_classes_id_foreign` (`classes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `filieres`
--

DROP TABLE IF EXISTS `filieres`;
CREATE TABLE IF NOT EXISTS `filieres` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomFilieres` varchar(250) NOT NULL,
  `sigleFilieres` varchar(50) DEFAULT NULL,
  `departements_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filieres_departements_id_foreign` (`departements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `historiques`
--

DROP TABLE IF EXISTS `historiques`;
CREATE TABLE IF NOT EXISTS `historiques` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(191) DEFAULT NULL,
  `numero` varchar(191) DEFAULT NULL,
  `entrer` date DEFAULT NULL,
  `sortir` date DEFAULT NULL,
  `code_barre` varchar(191) NOT NULL,
  `genre` varchar(191) NOT NULL,
  `type_vehicule` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_04_08_152038_create_departements_table', 1),
(7, '2023_04_17_150500_create_classes_table', 1),
(8, '2023_04_17_150534_create_filieres_table', 1),
(9, '2023_04_17_150544_create_etudiants_table', 1),
(10, '2023_07_06_074735_create_historiques_table', 1),
(11, '2023_07_21_104723_create_pre_selections_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'ramananathumingthierry@gmail.com_Token', 'b6fac663b3cd2ccb7db8b951561c06ccaeb7712101eb06fe60812af9b8523927', '[\"*\"]', NULL, NULL, '2023-10-25 01:30:26', '2023-10-25 01:30:26'),
(2, 'App\\Models\\User', 2, 'tiafinjaran@gmail.com_Token', '64549db0b14ca4b7aa1fef48fff6f88e6e62fd57258df93692f1007b0277b7b8', '[\"*\"]', NULL, NULL, '2023-10-25 01:33:05', '2023-10-25 01:33:05'),
(3, 'App\\Models\\User', 3, 'l@gmail.com_Token', '9a663981076fa3b8f95de43d4a8e58338a9071c6510e97d40087d01eb44d2352', '[\"*\"]', NULL, NULL, '2023-10-25 01:34:41', '2023-10-25 01:34:41'),
(4, 'App\\Models\\User', 1, 'ramananathumingthierry@gmail.com_Token', 'e74adbc2044433398869754e57afa752ad5ea000db893c0e8cd914af26fe4f28', '[\"*\"]', '2023-10-25 02:02:31', NULL, '2023-10-25 01:38:33', '2023-10-25 02:02:31');

-- --------------------------------------------------------

--
-- Structure de la table `pre_selections`
--

DROP TABLE IF EXISTS `pre_selections`;
CREATE TABLE IF NOT EXISTS `pre_selections` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_complet` varchar(255) NOT NULL,
  `contact` varchar(191) DEFAULT NULL,
  `facebookID` int DEFAULT NULL,
  `documents` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `roles` int DEFAULT '0' COMMENT '0 => users, 1 => admin',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `pseudo`, `email`, `email_verified_at`, `password`, `roles`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'RAMANANA Thu Ming Thierry', 'ramananathumingthierry@gmail.com', NULL, '$2y$10$ewV5DI4fMqa/7952zPbGyu/JChukc0nht/9PYg.nfBvC9s2v.Awlq', 0, NULL, '2023-10-25 01:30:26', '2023-10-25 01:30:26'),
(2, 'Tiafinjra', 'tiafinjaran@gmail.com', NULL, '$2y$10$PVEyNfygCRdVAb3ypg9uU.x6YFXDNBmGG4nRkIY6Dp9selyZRhpbq', 0, NULL, '2023-10-25 01:33:05', '2023-10-25 01:33:05'),
(3, 'Vitaza', 'l@gmail.com', NULL, '$2y$10$seFQAVz3t0XJJmUxoqcMseQJs.tv3zXMhEGvcVEH7rpoYq5j2xUMO', 0, NULL, '2023-10-25 01:34:41', '2023-10-25 01:34:41');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_classes_id_foreign` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etudiants_filieres_id_foreign` FOREIGN KEY (`filieres_id`) REFERENCES `filieres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `filieres`
--
ALTER TABLE `filieres`
  ADD CONSTRAINT `filieres_departements_id_foreign` FOREIGN KEY (`departements_id`) REFERENCES `departements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
