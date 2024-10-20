-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-10-2024 a las 06:34:48
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `torrolesport`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$2TwSsP4gMOOojv74wZTMmW$AG8XlEgewsOMlwqHLJqKR5VevgGhpldkcLeUSBa4N5Q=', '2024-10-20 05:52:12.114037', 0, 'admin', '', '', '', 0, 1, '2024-02-21 00:30:39.610688'),
(2, 'pbkdf2_sha256$720000$NTTONCVe1QTWGkowr3wDkk$aCtPfGru/xsZoV05yXK7P5I1ggFm+uMysAmtddOKcSM=', '2024-02-21 16:12:07.299332', 1, 'dawjosele', '', '', 'dawjosele@gmail.com', 1, 1, '2024-02-21 16:11:37.094363'),
(3, 'pbkdf2_sha256$720000$gkf6G6bsNG0wTKjqGhBxxY$y1BxBgMqkeZ7lTOVY/yEzdgSvhMh5ZCFmK3/Ydqc6s0=', '2024-02-25 17:40:53.290108', 0, 'jose', '', '', '', 0, 1, '2024-02-25 17:40:52.836737');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

DROP TABLE IF EXISTS `deportes`;
CREATE TABLE IF NOT EXISTS `deportes` (
  `id_deporte` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_deporte`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`id_deporte`, `nombre`) VALUES
(1, 'Fútbol'),
(2, 'Baloncesto'),
(3, 'Tenis'),
(4, 'Natación'),
(5, 'Atletismo'),
(6, 'Ciclismo'),
(7, 'Voleibol'),
(8, 'Golf'),
(9, 'Rugby'),
(10, 'Hockey');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'TsDeportes', 'deportes'),
(8, 'TsDeportes', 'equipo'),
(9, 'TsDeportes', 'instalaciones'),
(10, 'TsDeportes', 'jugador'),
(11, 'TsDeportes', 'partido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-16 20:17:59.493101'),
(2, 'auth', '0001_initial', '2024-02-16 20:18:00.115455'),
(3, 'admin', '0001_initial', '2024-02-16 20:18:00.304631'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-02-16 20:18:00.312683'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-16 20:18:00.328986'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-02-16 20:18:00.427368'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-02-16 20:18:00.464367'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-02-16 20:18:00.521595'),
(9, 'auth', '0004_alter_user_username_opts', '2024-02-16 20:18:00.526577'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-02-16 20:18:00.574107'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-02-16 20:18:00.574107'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-02-16 20:18:00.589653'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-02-16 20:18:00.640152'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-02-16 20:18:00.681254'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-02-16 20:18:00.730355'),
(16, 'auth', '0011_update_proxy_permissions', '2024-02-16 20:18:00.740225'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-02-16 20:18:00.788152'),
(18, 'sessions', '0001_initial', '2024-02-16 20:18:00.829181');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('u5fweo7ts18l73mf9cdvk7iav7lxdb39', 'e30:1rcaVU:xC8Q8fV3D-BhDpBIhIYyDnEpZXA7RVrfcZvfZiZlhbo', '2024-03-06 00:30:40.086832'),
('684h8gr82ujq0eov17trv0f5ii1d5dzr', '.eJxVjDsOwjAQBe_iGln-xNlASc8ZrLV3FweQI8VJhbg7iZQC2jcz760irkuJa-M5jqQuyqrT75YwP7nugB5Y75POU13mMeld0Qdt-jYRv66H-3dQsJWtDgNxzjSAiDhy585zsizB5wAZxBuDSIwMgJ3vvSQBI31gt0Gw3qrPFxwTOPw:1rhv02:An16KCb431VVNLJabjcEBgLAeM7t2BPLv7CA3NgOrRA', '2024-03-20 17:24:14.665080'),
('4f9lt4rq9irpnwz1lqthfpp9wdnve39f', '.eJxVjDsOwjAQBe_iGln-xNlASc8ZrLV3FweQI8VJhbg7iZQC2jcz760irkuJa-M5jqQuyqrT75YwP7nugB5Y75POU13mMeld0Qdt-jYRv66H-3dQsJWtDgNxzjSAiDhy585zsizB5wAZxBuDSIwMgJ3vvSQBI31gt0Gw3qrPFxwTOPw:1reIzn:7L152v_828Deiaf8CkjMaLxynUPqFAJayc5ycci1x7s', '2024-03-10 18:13:03.953892'),
('lzanod1ft6slpxgzf1sxw6ou9ppzz52u', '.eJxVjDsOwjAQBe_iGln-xNlASc8ZrLV3FweQI8VJhbg7iZQC2jcz760irkuJa-M5jqQuyqrT75YwP7nugB5Y75POU13mMeld0Qdt-jYRv66H-3dQsJWtDgNxzjSAiDhy585zsizB5wAZxBuDSIwMgJ3vvSQBI31gt0Gw3qrPFxwTOPw:1rmy5M:pn0FMTir75iILYj5QwF4llH_O9AOMoedaUk-U9dKCkU', '2024-04-03 15:42:36.423175'),
('a0duwh6uo3bcr57g9xosnto4ppqhlp02', '.eJxVjDsOwjAQBe_iGln-xNlASc8ZrLV3FweQI8VJhbg7iZQC2jcz760irkuJa-M5jqQuyqrT75YwP7nugB5Y75POU13mMeld0Qdt-jYRv66H-3dQsJWtDgNxzjSAiDhy585zsizB5wAZxBuDSIwMgJ3vvSQBI31gt0Gw3qrPFxwTOPw:1rsQED:MepF8b7RQMXZ4Dz1rOB-lx42F6nHWR-lV6iGDkbb_KM', '2024-04-18 16:46:17.796565'),
('4xlo0tv9i35kgn7mv5sxum7cak061noy', '.eJxVjDsOwjAQBe_iGln-xNlASc8ZrLV3FweQI8VJhbg7iZQC2jcz760irkuJa-M5jqQuyqrT75YwP7nugB5Y75POU13mMeld0Qdt-jYRv66H-3dQsJWtDgNxzjSAiDhy585zsizB5wAZxBuDSIwMgJ3vvSQBI31gt0Gw3qrPFxwTOPw:1t2OrM:4Jt9d2YA2vxfAONP1ZLHbRZw2wSgEABNZGbOTISvfOg', '2024-11-03 05:52:12.119038');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `id_deporte` int NOT NULL,
  `equipacion_principal` varchar(100) NOT NULL,
  `equipacion_suplente` varchar(100) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `id_deporte` (`id_deporte`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `nombre`, `id_deporte`, `equipacion_principal`, `equipacion_suplente`, `contacto`, `telefono`, `email`) VALUES
(1, 'Real Madrid', 1, 'Blanco', 'Negro', 'Juan Pérez', '123456789', 'real@madrid.com'),
(2, 'FC Barcelona', 1, 'Azul y Grana', 'Amarillo', 'Ana García', '987654321', 'fc@barcelona.com'),
(3, 'Atlético de Madrid', 1, 'Rojo y Blanco', 'Negro', 'Laura Gómez', '765432109', 'atletico@madrid.com'),
(4, 'Juventus', 1, 'Negro y Blanco', 'Rosa', 'Antonio Ruiz', '654109876', 'juventus@italia.com'),
(5, 'Baloncesto Madrid', 2, 'Azul y Blanco', 'Rojo', 'José López', '654321987', 'baloncesto@malaga.com'),
(6, 'Club de Tenis Costa ', 3, 'Verde', 'Blanco', 'María Rodríguez', '456789123', 'tenis@costadelsol.com'),
(7, 'Club Natación Playa ', 4, 'Azul y Amarillo', 'Blanco', 'Pedro Fernández', '789123456', 'natacion@playagrande.com'),
(8, 'Equipo Baloncesto Gr', 2, 'Rojo y Amarillo', 'Verde', 'Carlos Martínez', '987654321', 'baloncesto@granada.com'),
(9, 'Club de Tenis Malagu', 3, 'Azul', 'Gris', 'Elena Sánchez', '123456789', 'tenis@malaga.com'),
(10, 'Club Natación Marbel', 4, 'Azul y Blanco', 'Negro', 'Manuel Torres', '987654321', 'natacion@marbella.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instalaciones`
--

DROP TABLE IF EXISTS `instalaciones`;
CREATE TABLE IF NOT EXISTS `instalaciones` (
  `id_instalacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `iluminacion` tinyint(1) NOT NULL DEFAULT '0',
  `cubierta` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_instalacion`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `instalaciones`
--

INSERT INTO `instalaciones` (`id_instalacion`, `nombre`, `direccion`, `iluminacion`, `cubierta`) VALUES
(1, 'Estadio Municipal', 'Calle Principal, 123', 1, 1),
(2, 'Polideportivo La Pla', 'Avenida del Deporte, 45', 1, 0),
(3, 'Pista de Tenis Los P', 'Calle de los Árboles, 67', 0, 1),
(4, 'Piscina Olímpica', 'Calle del Agua, 89', 1, 1),
(5, 'Pista de Atletismo C', 'Avenida de los Corredores, 12', 1, 0),
(6, 'Club de Ciclismo Vel', 'Calle de las Bicicletas, 34', 0, 0),
(7, 'Pabellón Vóley Arena', 'Calle de la Arena, 56', 1, 1),
(8, 'Campo de Golf Los Ve', 'Camino del Golf, 78', 1, 0),
(9, 'Campo de Rugby El Ca', 'Avenida del Rugbier, 90', 1, 1),
(10, 'Pista de Hockey Hiel', 'Calle del Hielo, 32', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
CREATE TABLE IF NOT EXISTS `jugadores` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellido1` varchar(20) NOT NULL,
  `apellido2` varchar(20) DEFAULT NULL,
  `id_equipo` int NOT NULL,
  `dorsal` int NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `altura` decimal(3,2) NOT NULL,
  `peso` int NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id_jugador`),
  UNIQUE KEY `idx_equipo_dorsal` (`id_equipo`,`dorsal`)
) ;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `nombre`, `apellido1`, `apellido2`, `id_equipo`, `dorsal`, `fecha_nacimiento`, `altura`, `peso`, `telefono`) VALUES
(14, 'Rafael', 'Nadal', 'Parera', 4, 1, '1986-06-03', '1.85', 85, '998877665'),
(15, 'Michael', 'Phelps', '', 5, 23, '1985-06-30', '1.93', 88, '336699887'),
(16, 'Sergio', 'Ramos', '', 6, 4, '1986-03-30', '1.84', 75, '112233445'),
(13, 'LeBron', 'James', '', 3, 23, '1984-12-30', '2.03', 113, '667788899'),
(12, 'Lionel', 'Messi', '', 2, 10, '1987-06-24', '1.70', 70, '554433221'),
(11, 'Cristiano', 'Ronaldo', '', 1, 7, '1985-02-05', '1.87', 80, '112233445'),
(17, 'Paulo', 'Dybala', '', 7, 10, '1993-11-15', '1.77', 75, '554433221'),
(18, 'Sandra', 'López', 'García', 8, 15, '1990-08-18', '1.75', 68, '667788899'),
(19, 'David', 'Ferrer', '', 9, 3, '1982-04-02', '1.83', 74, '998877665'),
(20, 'Isabel', 'Fernández', 'Molina', 10, 8, '1995-07-12', '1.72', 60, '336699887'),
(21, 'Gareth', 'Bale', '', 1, 11, '1989-07-16', '1.83', 74, '112233445'),
(22, 'Karim', 'Benzema', '', 1, 9, '1987-12-19', '1.87', 81, '554433221'),
(23, 'Gerard', 'Piqué', '', 2, 3, '1987-02-02', '1.92', 85, '667788899'),
(24, 'Luis', 'Suárez', 'Miramontes', 2, 9, '1987-01-24', '1.82', 86, '998877665'),
(25, 'Joao', 'Félix', '', 3, 7, '1999-11-10', '1.80', 70, '336699887'),
(26, 'Neymar', 'da Silva', 'Santos', 3, 10, '1992-02-05', '1.75', 68, '112233445'),
(27, 'Giannis', 'Antetokounmpo', '', 4, 34, '1994-12-06', '2.11', 110, '554433221'),
(28, 'Anthony', 'Davis', '', 4, 3, '1993-03-11', '2.08', 115, '667788899'),
(29, 'Luka', 'Dončić', '', 5, 77, '1999-02-28', '2.01', 90, '998877665'),
(30, 'Stephen', 'Curry', '', 5, 30, '1988-03-14', '1.88', 86, '336699887'),
(31, 'Leandro', 'Bolmaro', '', 6, 8, '2000-09-11', '2.03', 93, '112233445'),
(32, 'Rudy', 'Fernández', 'Fernández', 6, 5, '1985-04-04', '1.96', 95, '554433221');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

DROP TABLE IF EXISTS `partidos`;
CREATE TABLE IF NOT EXISTS `partidos` (
  `id_partido` int NOT NULL AUTO_INCREMENT,
  `id_deporte` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `id_instalacion` int DEFAULT NULL,
  `id_local` int NOT NULL,
  `id_visitante` int NOT NULL,
  `puntos_local` int DEFAULT NULL,
  `puntos_visitante` int DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_partido`),
  KEY `id_deporte` (`id_deporte`),
  KEY `id_instalacion` (`id_instalacion`),
  KEY `id_local` (`id_local`),
  KEY `id_visitante` (`id_visitante`)
) ;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id_partido`, `id_deporte`, `fecha_hora`, `id_instalacion`, `id_local`, `id_visitante`, `puntos_local`, `puntos_visitante`, `observaciones`) VALUES
(11, 4, '2024-02-27 20:15:00', 4, 2, 3, 1, 0, 'Partido de prueba 4'),
(10, 3, '2024-02-25 10:45:00', 3, 5, 1, 2, 2, 'Partido de prueba 3'),
(9, 2, '2024-02-22 18:30:00', 2, 3, 4, 80, 75, 'Partido de prueba 2'),
(8, 1, '2024-02-20 15:00:00', 1, 1, 2, 3, 1, 'Partido de prueba 1'),
(12, 5, '2024-03-01 14:00:00', 5, 4, 5, 2, 1, 'Partido de prueba 5'),
(13, 1, '2024-03-05 16:30:00', 6, 1, 3, 2, 1, 'Partido de prueba 6'),
(14, 2, '2024-03-08 19:00:00', 7, 2, 4, 90, 85, 'Partido de prueba 7'),
(15, 3, '2024-03-10 12:15:00', 8, 3, 5, 1, 3, 'Partido de prueba 8'),
(16, 4, '2024-03-13 21:45:00', 9, 4, 1, 0, 1, 'Partido de prueba 9'),
(17, 5, '2024-03-16 15:30:00', 10, 5, 2, 3, 2, 'Partido de prueba 10'),
(18, 1, '2024-02-22 14:30:00', 1, 1, 2, 2, 1, 'Partido 1 - Jugado'),
(19, 2, '2024-02-25 16:45:00', 2, 3, 4, 78, 80, 'Partido 2 - Jugado'),
(20, 3, '2024-02-28 09:30:00', 3, 5, 1, 3, 1, 'Partido 3 - Jugado'),
(21, 4, '2024-03-02 19:00:00', 4, 2, 3, 1, 0, 'Partido 4 - Jugado'),
(22, 5, '2024-03-05 13:15:00', 5, 4, 5, 1, 2, 'Partido 5 - Jugado'),
(23, 1, '2024-03-08 17:45:00', 6, 1, 3, 3, 0, 'Partido 6 - Jugado'),
(24, 2, '2024-03-11 10:00:00', 7, 2, 4, 90, 85, 'Partido 7 - Jugado'),
(25, 3, '2024-03-14 20:30:00', 8, 3, 5, 1, 3, 'Partido 8 - Jugado'),
(26, 4, '2024-03-17 12:45:00', 9, 4, 1, 0, 2, 'Partido 9 - Jugado'),
(27, 5, '2024-03-20 15:30:00', 10, 5, 2, 2, 3, 'Partido 10 - Jugado'),
(28, 4, '2024-02-27 20:15:00', 9, 4, 2, 3, 1, 'Partido de prueba 4'),
(29, 3, '2024-02-25 10:45:00', 7, 3, 5, 1, 2, 'Partido de prueba 3'),
(30, 2, '2024-02-22 18:30:00', 3, 2, 3, 4, 80, 'Partido de prueba 2'),
(31, 1, '2024-02-20 15:00:00', 1, 1, 1, 2, 3, 'Partido de prueba 1'),
(32, 5, '2024-03-01 14:00:00', 5, 5, 4, 5, 2, 'Partido de prueba 5'),
(33, 1, '2024-03-05 16:30:00', 6, 6, 1, 3, 2, 'Partido de prueba 6'),
(34, 2, '2024-03-08 19:00:00', 4, 7, 2, 4, 90, 'Partido de prueba 7'),
(35, 3, '2024-03-10 12:15:00', 2, 8, 3, 5, 1, 'Partido de prueba 8'),
(36, 4, '2024-03-13 21:45:00', 10, 9, 4, 1, 0, 'Partido de prueba 9'),
(37, 5, '2024-03-16 15:30:00', 8, 10, 5, 2, 3, 'Partido de prueba 10'),
(38, 4, '2024-12-01 20:15:00', 9, 4, 2, NULL, NULL, 'Partido futuro 1'),
(39, 3, '2024-12-05 10:45:00', 7, 3, 5, NULL, NULL, 'Partido futuro 2'),
(40, 2, '2024-12-10 18:30:00', 3, 2, 3, NULL, NULL, 'Partido futuro 3'),
(41, 1, '2024-12-12 15:00:00', 1, 1, 1, NULL, NULL, 'Partido futuro 4'),
(42, 5, '2024-12-15 14:00:00', 5, 5, 4, NULL, NULL, 'Partido futuro 5'),
(43, 1, '2024-12-18 16:30:00', 6, 6, 1, NULL, NULL, 'Partido futuro 6'),
(44, 2, '2024-12-20 19:00:00', 4, 7, 2, NULL, NULL, 'Partido futuro 7'),
(45, 3, '2024-12-23 12:15:00', 2, 8, 3, NULL, NULL, 'Partido futuro 8'),
(46, 4, '2024-12-25 21:45:00', 10, 9, 4, NULL, NULL, 'Partido futuro 9'),
(47, 5, '2024-12-28 15:30:00', 8, 10, 5, NULL, NULL, 'Partido futuro 10');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
