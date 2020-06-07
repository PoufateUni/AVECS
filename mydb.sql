-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-06-2020 a las 08:02:12
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `fecha_entrada` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `profesor_persona_id_persona` int(11) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`fecha_entrada`, `fecha_salida`, `profesor_persona_id_persona`, `contrasena`) VALUES
('2020-05-12', '2020-05-21', 664, '87');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `idasistencia` int(11) NOT NULL,
  `aprobado` tinyint(4) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visita_idvisita` int(11) NOT NULL,
  `estudiante_persona_id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamento` int(2) UNSIGNED NOT NULL,
  `departamento` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `departamento`) VALUES
(5, 'antioquia'),
(8, 'atlántico'),
(11, 'bogotá, d.c.'),
(13, 'bolívar'),
(15, 'boyacá'),
(17, 'caldas'),
(18, 'caquetá'),
(19, 'cauca'),
(20, 'cesar'),
(23, 'córdoba'),
(25, 'cundinamarca'),
(27, 'chocó'),
(41, 'huila'),
(44, 'la guajira'),
(47, 'magdalena'),
(50, 'meta'),
(52, 'nariño'),
(54, 'norte de santander'),
(63, 'quindio'),
(66, 'risaralda'),
(68, 'santander'),
(70, 'sucre'),
(73, 'tolima'),
(76, 'valle del cauca'),
(81, 'arauca'),
(85, 'casanare'),
(86, 'putumayo'),
(88, 'archipiélago de san andrés, providencia y santa catalina'),
(91, 'amazonas'),
(94, 'guainía'),
(95, 'guaviare'),
(97, 'vaupés'),
(99, 'vichada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_apoyo`
--

CREATE TABLE `documento_apoyo` (
  `tipo_doc_apoyo_idtipo_doc_apoyo` int(11) NOT NULL,
  `id_doc` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion_url` varchar(300) DEFAULT NULL,
  `fecha_creacion` varchar(45) DEFAULT NULL,
  `visita_idvisita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `rut` int(11) NOT NULL,
  `nombre_razon_social` varchar(45) DEFAULT NULL,
  `telefono` int(12) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `representante_legal` int(11) NOT NULL,
  `natural_juridica` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 para persona juridica',
  `correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`rut`, `nombre_razon_social`, `telefono`, `direccion`, `representante_legal`, `natural_juridica`, `correo`) VALUES
(98, 'Postobon', 123, 'asd', 3, 0, 'correo@ejemplo.com'),
(1111, 'modelaje del oriente', 1234, 'asdasd', 5, 0, ''),
(122321, 'graficas y tablas .inc', 31237, 'direccion #1233', 2, 0, ''),
(87012311, 'medios digitales sa', 1234, 'av 7 este', 9, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`id`, `nombre`) VALUES
(1, 'eps1'),
(2, 'eps2'),
(5, 'prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `persona_id_persona` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `eps` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`persona_id_persona`, `codigo`, `eps`) VALUES
(1, '1151624', 5),
(12, '887', NULL),
(155, '1765', NULL),
(98732, '4412', NULL),
(10909344, '999', 5),
(123444444, '66', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `idgenero` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`idgenero`, `nombre`) VALUES
(1, 'masculino'),
(2, 'femenino'),
(3, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idgrupo` int(11) NOT NULL,
  `materia_idmateria` int(11) NOT NULL,
  `profesor_persona_id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`idgrupo`, `materia_idmateria`, `profesor_persona_id_persona`) VALUES
(1, 123, 667),
(2, 1234, 667),
(778, 118, 664),
(166677, 17123, 195),
(13307031, 1330703, 664);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `semestre_idsemestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`idmateria`, `nombre`, `semestre_idsemestre`) VALUES
(118, 'sociedad y cultura', 5),
(123, 'fotografia', 1),
(1234, 'fotografia 2', 6),
(17123, 'fabricación de mock-ups', 7),
(1330703, 'estrategia de medios', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id_municipio` int(6) UNSIGNED NOT NULL,
  `municipio` varchar(255) NOT NULL DEFAULT '',
  `departamento_id` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `municipio`, `departamento_id`) VALUES
(1, 'abriaquí', 5),
(2, 'acacías', 50),
(3, 'acandí', 27),
(4, 'acevedo', 41),
(5, 'achí', 13),
(6, 'agrado', 41),
(7, 'agua de dios', 25),
(8, 'aguachica', 20),
(9, 'aguada', 68),
(10, 'aguadas', 17),
(11, 'aguazul', 85),
(12, 'agustín codazzi', 20),
(13, 'aipe', 41),
(14, 'albania', 18),
(15, 'albania', 44),
(16, 'albania', 68),
(17, 'albán', 25),
(18, 'albán (san josé)', 52),
(19, 'alcalá', 76),
(20, 'alejandria', 5),
(21, 'algarrobo', 47),
(22, 'algeciras', 41),
(23, 'almaguer', 19),
(24, 'almeida', 15),
(25, 'alpujarra', 73),
(26, 'altamira', 41),
(27, 'alto baudó (pie de pato)', 27),
(28, 'altos del rosario', 13),
(29, 'alvarado', 73),
(30, 'amagá', 5),
(31, 'amalfi', 5),
(32, 'ambalema', 73),
(33, 'anapoima', 25),
(34, 'ancuya', 52),
(35, 'andalucía', 76),
(36, 'andes', 5),
(37, 'angelópolis', 5),
(38, 'angostura', 5),
(39, 'anolaima', 25),
(40, 'anorí', 5),
(41, 'anserma', 17),
(42, 'ansermanuevo', 76),
(43, 'anzoátegui', 73),
(44, 'anzá', 5),
(45, 'apartadó', 5),
(46, 'apulo', 25),
(47, 'apía', 66),
(48, 'aquitania', 15),
(49, 'aracataca', 47),
(50, 'aranzazu', 17),
(51, 'aratoca', 68),
(52, 'arauca', 81),
(53, 'arauquita', 81),
(54, 'arbeláez', 25),
(55, 'arboleda (berruecos)', 52),
(56, 'arboledas', 54),
(57, 'arboletes', 5),
(58, 'arcabuco', 15),
(59, 'arenal', 13),
(60, 'argelia', 5),
(61, 'argelia', 19),
(62, 'argelia', 76),
(63, 'ariguaní (el difícil)', 47),
(64, 'arjona', 13),
(65, 'armenia', 5),
(66, 'armenia', 63),
(67, 'armero (guayabal)', 73),
(68, 'arroyohondo', 13),
(69, 'astrea', 20),
(70, 'ataco', 73),
(71, 'atrato (yuto)', 27),
(72, 'ayapel', 23),
(73, 'bagadó', 27),
(74, 'bahía solano (mútis)', 27),
(75, 'bajo baudó (pizarro)', 27),
(76, 'balboa', 19),
(77, 'balboa', 66),
(78, 'baranoa', 8),
(79, 'baraya', 41),
(80, 'barbacoas', 52),
(81, 'barbosa', 5),
(82, 'barbosa', 68),
(83, 'barichara', 68),
(84, 'barranca de upía', 50),
(85, 'barrancabermeja', 68),
(86, 'barrancas', 44),
(87, 'barranco de loba', 13),
(88, 'barranquilla', 8),
(89, 'becerríl', 20),
(90, 'belalcázar', 17),
(91, 'bello', 5),
(92, 'belmira', 5),
(93, 'beltrán', 25),
(94, 'belén', 15),
(95, 'belén', 52),
(96, 'belén de bajirá', 27),
(97, 'belén de umbría', 66),
(98, 'belén de los andaquíes', 18),
(99, 'berbeo', 15),
(100, 'betania', 5),
(101, 'beteitiva', 15),
(102, 'betulia', 5),
(103, 'betulia', 68),
(104, 'bituima', 25),
(105, 'boavita', 15),
(106, 'bochalema', 54),
(107, 'bogotá d.c.', 11),
(108, 'bojacá', 25),
(109, 'bojayá (bellavista)', 27),
(110, 'bolívar', 5),
(111, 'bolívar', 19),
(112, 'bolívar', 68),
(113, 'bolívar', 76),
(114, 'bosconia', 20),
(115, 'boyacá', 15),
(116, 'briceño', 5),
(117, 'briceño', 15),
(118, 'bucaramanga', 68),
(119, 'bucarasica', 54),
(120, 'buenaventura', 76),
(121, 'buenavista', 15),
(122, 'buenavista', 23),
(123, 'buenavista', 63),
(124, 'buenavista', 70),
(125, 'buenos aires', 19),
(126, 'buesaco', 52),
(127, 'buga', 76),
(128, 'bugalagrande', 76),
(129, 'burítica', 5),
(130, 'busbanza', 15),
(131, 'cabrera', 25),
(132, 'cabrera', 68),
(133, 'cabuyaro', 50),
(134, 'cachipay', 25),
(135, 'caicedo', 5),
(136, 'caicedonia', 76),
(137, 'caimito', 70),
(138, 'cajamarca', 73),
(139, 'cajibío', 19),
(140, 'cajicá', 25),
(141, 'calamar', 13),
(142, 'calamar', 95),
(143, 'calarcá', 63),
(144, 'caldas', 5),
(145, 'caldas', 15),
(146, 'caldono', 19),
(147, 'california', 68),
(148, 'calima (darién)', 76),
(149, 'caloto', 19),
(150, 'calí', 76),
(151, 'campamento', 5),
(152, 'campo de la cruz', 8),
(153, 'campoalegre', 41),
(154, 'campohermoso', 15),
(155, 'canalete', 23),
(156, 'candelaria', 8),
(157, 'candelaria', 76),
(158, 'cantagallo', 13),
(159, 'cantón de san pablo', 27),
(160, 'caparrapí', 25),
(161, 'capitanejo', 68),
(162, 'caracolí', 5),
(163, 'caramanta', 5),
(164, 'carcasí', 68),
(165, 'carepa', 5),
(166, 'carmen de apicalá', 73),
(167, 'carmen de carupa', 25),
(168, 'carmen de viboral', 5),
(169, 'carmen del darién (curbaradó)', 27),
(170, 'carolina', 5),
(171, 'cartagena', 13),
(172, 'cartagena del chairá', 18),
(173, 'cartago', 76),
(174, 'carurú', 97),
(175, 'casabianca', 73),
(176, 'castilla la nueva', 50),
(177, 'caucasia', 5),
(178, 'cañasgordas', 5),
(179, 'cepita', 68),
(180, 'cereté', 23),
(181, 'cerinza', 15),
(182, 'cerrito', 68),
(183, 'cerro san antonio', 47),
(184, 'chachaguí', 52),
(185, 'chaguaní', 25),
(186, 'chalán', 70),
(187, 'chaparral', 73),
(188, 'charalá', 68),
(189, 'charta', 68),
(190, 'chigorodó', 5),
(191, 'chima', 68),
(192, 'chimichagua', 20),
(193, 'chimá', 23),
(194, 'chinavita', 15),
(195, 'chinchiná', 17),
(196, 'chinácota', 54),
(197, 'chinú', 23),
(198, 'chipaque', 25),
(199, 'chipatá', 68),
(200, 'chiquinquirá', 15),
(201, 'chiriguaná', 20),
(202, 'chiscas', 15),
(203, 'chita', 15),
(204, 'chitagá', 54),
(205, 'chitaraque', 15),
(206, 'chivatá', 15),
(207, 'chivolo', 47),
(208, 'choachí', 25),
(209, 'chocontá', 25),
(210, 'chámeza', 85),
(211, 'chía', 25),
(212, 'chíquiza', 15),
(213, 'chívor', 15),
(214, 'cicuco', 13),
(215, 'cimitarra', 68),
(216, 'circasia', 63),
(217, 'cisneros', 5),
(218, 'ciénaga', 15),
(219, 'ciénaga', 47),
(220, 'ciénaga de oro', 23),
(221, 'clemencia', 13),
(222, 'cocorná', 5),
(223, 'coello', 73),
(224, 'cogua', 25),
(225, 'colombia', 41),
(226, 'colosó (ricaurte)', 70),
(227, 'colón', 86),
(228, 'colón (génova)', 52),
(229, 'concepción', 5),
(230, 'concepción', 68),
(231, 'concordia', 5),
(232, 'concordia', 47),
(233, 'condoto', 27),
(234, 'confines', 68),
(235, 'consaca', 52),
(236, 'contadero', 52),
(237, 'contratación', 68),
(238, 'convención', 54),
(239, 'copacabana', 5),
(240, 'coper', 15),
(241, 'cordobá', 63),
(242, 'corinto', 19),
(243, 'coromoro', 68),
(244, 'corozal', 70),
(245, 'corrales', 15),
(246, 'cota', 25),
(247, 'cotorra', 23),
(248, 'covarachía', 15),
(249, 'coveñas', 70),
(250, 'coyaima', 73),
(251, 'cravo norte', 81),
(252, 'cuaspud (carlosama)', 52),
(253, 'cubarral', 50),
(254, 'cubará', 15),
(255, 'cucaita', 15),
(256, 'cucunubá', 25),
(257, 'cucutilla', 54),
(258, 'cuitiva', 15),
(259, 'cumaral', 50),
(260, 'cumaribo', 99),
(261, 'cumbal', 52),
(262, 'cumbitara', 52),
(263, 'cunday', 73),
(264, 'curillo', 18),
(265, 'curití', 68),
(266, 'curumaní', 20),
(267, 'cáceres', 5),
(268, 'cáchira', 54),
(269, 'cácota', 54),
(270, 'cáqueza', 25),
(271, 'cértegui', 27),
(272, 'cómbita', 15),
(273, 'córdoba', 13),
(274, 'córdoba', 52),
(275, 'cúcuta', 54),
(276, 'dabeiba', 5),
(277, 'dagua', 76),
(278, 'dibulla', 44),
(279, 'distracción', 44),
(280, 'dolores', 73),
(281, 'don matías', 5),
(282, 'dos quebradas', 66),
(283, 'duitama', 15),
(284, 'durania', 54),
(285, 'ebéjico', 5),
(286, 'el bagre', 5),
(287, 'el banco', 47),
(288, 'el cairo', 76),
(289, 'el calvario', 50),
(290, 'el carmen', 54),
(291, 'el carmen', 68),
(292, 'el carmen de atrato', 27),
(293, 'el carmen de bolívar', 13),
(294, 'el castillo', 50),
(295, 'el cerrito', 76),
(296, 'el charco', 52),
(297, 'el cocuy', 15),
(298, 'el colegio', 25),
(299, 'el copey', 20),
(300, 'el doncello', 18),
(301, 'el dorado', 50),
(302, 'el dovio', 76),
(303, 'el espino', 15),
(304, 'el guacamayo', 68),
(305, 'el guamo', 13),
(306, 'el molino', 44),
(307, 'el paso', 20),
(308, 'el paujil', 18),
(309, 'el peñol', 52),
(310, 'el peñon', 13),
(311, 'el peñon', 68),
(312, 'el peñón', 25),
(313, 'el piñon', 47),
(314, 'el playón', 68),
(315, 'el retorno', 95),
(316, 'el retén', 47),
(317, 'el roble', 70),
(318, 'el rosal', 25),
(319, 'el rosario', 52),
(320, 'el tablón de gómez', 52),
(321, 'el tambo', 19),
(322, 'el tambo', 52),
(323, 'el tarra', 54),
(324, 'el zulia', 54),
(325, 'el águila', 76),
(326, 'elías', 41),
(327, 'encino', 68),
(328, 'enciso', 68),
(329, 'entrerríos', 5),
(330, 'envigado', 5),
(331, 'espinal', 73),
(332, 'facatativá', 25),
(333, 'falan', 73),
(334, 'filadelfia', 17),
(335, 'filandia', 63),
(336, 'firavitoba', 15),
(337, 'flandes', 73),
(338, 'florencia', 18),
(339, 'florencia', 19),
(340, 'floresta', 15),
(341, 'florida', 76),
(342, 'floridablanca', 68),
(343, 'florián', 68),
(344, 'fonseca', 44),
(345, 'fortúl', 81),
(346, 'fosca', 25),
(347, 'francisco pizarro', 52),
(348, 'fredonia', 5),
(349, 'fresno', 73),
(350, 'frontino', 5),
(351, 'fuente de oro', 50),
(352, 'fundación', 47),
(353, 'funes', 52),
(354, 'funza', 25),
(355, 'fusagasugá', 25),
(356, 'fómeque', 25),
(357, 'fúquene', 25),
(358, 'gachalá', 25),
(359, 'gachancipá', 25),
(360, 'gachantivá', 15),
(361, 'gachetá', 25),
(362, 'galapa', 8),
(363, 'galeras (nueva granada)', 70),
(364, 'galán', 68),
(365, 'gama', 25),
(366, 'gamarra', 20),
(367, 'garagoa', 15),
(368, 'garzón', 41),
(369, 'gigante', 41),
(370, 'ginebra', 76),
(371, 'giraldo', 5),
(372, 'girardot', 25),
(373, 'girardota', 5),
(374, 'girón', 68),
(375, 'gonzalez', 20),
(376, 'gramalote', 54),
(377, 'granada', 5),
(378, 'granada', 25),
(379, 'granada', 50),
(380, 'guaca', 68),
(381, 'guacamayas', 15),
(382, 'guacarí', 76),
(383, 'guachavés', 52),
(384, 'guachené', 19),
(385, 'guachetá', 25),
(386, 'guachucal', 52),
(387, 'guadalupe', 5),
(388, 'guadalupe', 41),
(389, 'guadalupe', 68),
(390, 'guaduas', 25),
(391, 'guaitarilla', 52),
(392, 'gualmatán', 52),
(393, 'guamal', 47),
(394, 'guamal', 50),
(395, 'guamo', 73),
(396, 'guapota', 68),
(397, 'guapí', 19),
(398, 'guaranda', 70),
(399, 'guarne', 5),
(400, 'guasca', 25),
(401, 'guatapé', 5),
(402, 'guataquí', 25),
(403, 'guatavita', 25),
(404, 'guateque', 15),
(405, 'guavatá', 68),
(406, 'guayabal de siquima', 25),
(407, 'guayabetal', 25),
(408, 'guayatá', 15),
(409, 'guepsa', 68),
(410, 'guicán', 15),
(411, 'gutiérrez', 25),
(412, 'guática', 66),
(413, 'gámbita', 68),
(414, 'gámeza', 15),
(415, 'génova', 63),
(416, 'gómez plata', 5),
(417, 'hacarí', 54),
(418, 'hatillo de loba', 13),
(419, 'hato', 68),
(420, 'hato corozal', 85),
(421, 'hatonuevo', 44),
(422, 'heliconia', 5),
(423, 'herrán', 54),
(424, 'herveo', 73),
(425, 'hispania', 5),
(426, 'hobo', 41),
(427, 'honda', 73),
(428, 'ibagué', 73),
(429, 'icononzo', 73),
(430, 'iles', 52),
(431, 'imúes', 52),
(432, 'inzá', 19),
(433, 'inírida', 94),
(434, 'ipiales', 52),
(435, 'isnos', 41),
(436, 'istmina', 27),
(437, 'itagüí', 5),
(438, 'ituango', 5),
(439, 'izá', 15),
(440, 'jambaló', 19),
(441, 'jamundí', 76),
(442, 'jardín', 5),
(443, 'jenesano', 15),
(444, 'jericó', 5),
(445, 'jericó', 15),
(446, 'jerusalén', 25),
(447, 'jesús maría', 68),
(448, 'jordán', 68),
(449, 'juan de acosta', 8),
(450, 'junín', 25),
(451, 'juradó', 27),
(452, 'la apartada y la frontera', 23),
(453, 'la argentina', 41),
(454, 'la belleza', 68),
(455, 'la calera', 25),
(456, 'la capilla', 15),
(457, 'la ceja', 5),
(458, 'la celia', 66),
(459, 'la cruz', 52),
(460, 'la cumbre', 76),
(461, 'la dorada', 17),
(462, 'la esperanza', 54),
(463, 'la estrella', 5),
(464, 'la florida', 52),
(465, 'la gloria', 20),
(466, 'la jagua de ibirico', 20),
(467, 'la jagua del pilar', 44),
(468, 'la llanada', 52),
(469, 'la macarena', 50),
(470, 'la merced', 17),
(471, 'la mesa', 25),
(472, 'la montañita', 18),
(473, 'la palma', 25),
(474, 'la paz', 68),
(475, 'la paz (robles)', 20),
(476, 'la peña', 25),
(477, 'la pintada', 5),
(478, 'la plata', 41),
(479, 'la playa', 54),
(480, 'la primavera', 99),
(481, 'la salina', 85),
(482, 'la sierra', 19),
(483, 'la tebaida', 63),
(484, 'la tola', 52),
(485, 'la unión', 5),
(486, 'la unión', 52),
(487, 'la unión', 70),
(488, 'la unión', 76),
(489, 'la uvita', 15),
(490, 'la vega', 19),
(491, 'la vega', 25),
(492, 'la victoria', 15),
(493, 'la victoria', 17),
(494, 'la victoria', 76),
(495, 'la virginia', 66),
(496, 'labateca', 54),
(497, 'labranzagrande', 15),
(498, 'landázuri', 68),
(499, 'lebrija', 68),
(500, 'leiva', 52),
(501, 'lejanías', 50),
(502, 'lenguazaque', 25),
(503, 'leticia', 91),
(504, 'liborina', 5),
(505, 'linares', 52),
(506, 'lloró', 27),
(507, 'lorica', 23),
(508, 'los córdobas', 23),
(509, 'los palmitos', 70),
(510, 'los patios', 54),
(511, 'los santos', 68),
(512, 'lourdes', 54),
(513, 'luruaco', 8),
(514, 'lérida', 73),
(515, 'líbano', 73),
(516, 'lópez (micay)', 19),
(517, 'macanal', 15),
(518, 'macaravita', 68),
(519, 'maceo', 5),
(520, 'machetá', 25),
(521, 'madrid', 25),
(522, 'magangué', 13),
(523, 'magüi (payán)', 52),
(524, 'mahates', 13),
(525, 'maicao', 44),
(526, 'majagual', 70),
(527, 'malambo', 8),
(528, 'mallama (piedrancha)', 52),
(529, 'manatí', 8),
(530, 'manaure', 44),
(531, 'manaure balcón del cesar', 20),
(532, 'manizales', 17),
(533, 'manta', 25),
(534, 'manzanares', 17),
(535, 'maní', 85),
(536, 'mapiripan', 50),
(537, 'margarita', 13),
(538, 'marinilla', 5),
(539, 'maripí', 15),
(540, 'mariquita', 73),
(541, 'marmato', 17),
(542, 'marquetalia', 17),
(543, 'marsella', 66),
(544, 'marulanda', 17),
(545, 'maría la baja', 13),
(546, 'matanza', 68),
(547, 'medellín', 5),
(548, 'medina', 25),
(549, 'medio atrato', 27),
(550, 'medio baudó', 27),
(551, 'medio san juan (andagoya)', 27),
(552, 'melgar', 73),
(553, 'mercaderes', 19),
(554, 'mesetas', 50),
(555, 'milán', 18),
(556, 'miraflores', 15),
(557, 'miraflores', 95),
(558, 'miranda', 19),
(559, 'mistrató', 66),
(560, 'mitú', 97),
(561, 'mocoa', 86),
(562, 'mogotes', 68),
(563, 'molagavita', 68),
(564, 'momil', 23),
(565, 'mompós', 13),
(566, 'mongua', 15),
(567, 'monguí', 15),
(568, 'moniquirá', 15),
(569, 'montebello', 5),
(570, 'montecristo', 13),
(571, 'montelíbano', 23),
(572, 'montenegro', 63),
(573, 'monteria', 23),
(574, 'monterrey', 85),
(575, 'morales', 13),
(576, 'morales', 19),
(577, 'morelia', 18),
(578, 'morroa', 70),
(579, 'mosquera', 25),
(580, 'mosquera', 52),
(581, 'motavita', 15),
(582, 'moñitos', 23),
(583, 'murillo', 73),
(584, 'murindó', 5),
(585, 'mutatá', 5),
(586, 'mutiscua', 54),
(587, 'muzo', 15),
(588, 'málaga', 68),
(589, 'nariño', 5),
(590, 'nariño', 25),
(591, 'nariño', 52),
(592, 'natagaima', 73),
(593, 'nechí', 5),
(594, 'necoclí', 5),
(595, 'neira', 17),
(596, 'neiva', 41),
(597, 'nemocón', 25),
(598, 'nilo', 25),
(599, 'nimaima', 25),
(600, 'nobsa', 15),
(601, 'nocaima', 25),
(602, 'norcasia', 17),
(603, 'norosí', 13),
(604, 'novita', 27),
(605, 'nueva granada', 47),
(606, 'nuevo colón', 15),
(607, 'nunchía', 85),
(608, 'nuquí', 27),
(609, 'nátaga', 41),
(610, 'obando', 76),
(611, 'ocamonte', 68),
(612, 'ocaña', 54),
(613, 'oiba', 68),
(614, 'oicatá', 15),
(615, 'olaya', 5),
(616, 'olaya herrera', 52),
(617, 'onzaga', 68),
(618, 'oporapa', 41),
(619, 'orito', 86),
(620, 'orocué', 85),
(621, 'ortega', 73),
(622, 'ospina', 52),
(623, 'otanche', 15),
(624, 'ovejas', 70),
(625, 'pachavita', 15),
(626, 'pacho', 25),
(627, 'padilla', 19),
(628, 'paicol', 41),
(629, 'pailitas', 20),
(630, 'paime', 25),
(631, 'paipa', 15),
(632, 'pajarito', 15),
(633, 'palermo', 41),
(634, 'palestina', 17),
(635, 'palestina', 41),
(636, 'palmar', 68),
(637, 'palmar de varela', 8),
(638, 'palmas del socorro', 68),
(639, 'palmira', 76),
(640, 'palmito', 70),
(641, 'palocabildo', 73),
(642, 'pamplona', 54),
(643, 'pamplonita', 54),
(644, 'pandi', 25),
(645, 'panqueba', 15),
(646, 'paratebueno', 25),
(647, 'pasca', 25),
(648, 'patía (el bordo)', 19),
(649, 'pauna', 15),
(650, 'paya', 15),
(651, 'paz de ariporo', 85),
(652, 'paz de río', 15),
(653, 'pedraza', 47),
(654, 'pelaya', 20),
(655, 'pensilvania', 17),
(656, 'peque', 5),
(657, 'pereira', 66),
(658, 'pesca', 15),
(659, 'peñol', 5),
(660, 'piamonte', 19),
(661, 'pie de cuesta', 68),
(662, 'piedras', 73),
(663, 'piendamó', 19),
(664, 'pijao', 63),
(665, 'pijiño', 47),
(666, 'pinchote', 68),
(667, 'pinillos', 13),
(668, 'piojo', 8),
(669, 'pisva', 15),
(670, 'pital', 41),
(671, 'pitalito', 41),
(672, 'pivijay', 47),
(673, 'planadas', 73),
(674, 'planeta rica', 23),
(675, 'plato', 47),
(676, 'policarpa', 52),
(677, 'polonuevo', 8),
(678, 'ponedera', 8),
(679, 'popayán', 19),
(680, 'pore', 85),
(681, 'potosí', 52),
(682, 'pradera', 76),
(683, 'prado', 73),
(684, 'providencia', 52),
(685, 'providencia', 88),
(686, 'pueblo bello', 20),
(687, 'pueblo nuevo', 23),
(688, 'pueblo rico', 66),
(689, 'pueblorrico', 5),
(690, 'puebloviejo', 47),
(691, 'puente nacional', 68),
(692, 'puerres', 52),
(693, 'puerto asís', 86),
(694, 'puerto berrío', 5),
(695, 'puerto boyacá', 15),
(696, 'puerto caicedo', 86),
(697, 'puerto carreño', 99),
(698, 'puerto colombia', 8),
(699, 'puerto concordia', 50),
(700, 'puerto escondido', 23),
(701, 'puerto gaitán', 50),
(702, 'puerto guzmán', 86),
(703, 'puerto leguízamo', 86),
(704, 'puerto libertador', 23),
(705, 'puerto lleras', 50),
(706, 'puerto lópez', 50),
(707, 'puerto nare', 5),
(708, 'puerto nariño', 91),
(709, 'puerto parra', 68),
(710, 'puerto rico', 18),
(711, 'puerto rico', 50),
(712, 'puerto rondón', 81),
(713, 'puerto salgar', 25),
(714, 'puerto santander', 54),
(715, 'puerto tejada', 19),
(716, 'puerto triunfo', 5),
(717, 'puerto wilches', 68),
(718, 'pulí', 25),
(719, 'pupiales', 52),
(720, 'puracé (coconuco)', 19),
(721, 'purificación', 73),
(722, 'purísima', 23),
(723, 'pácora', 17),
(724, 'páez', 15),
(725, 'páez (belalcazar)', 19),
(726, 'páramo', 68),
(727, 'quebradanegra', 25),
(728, 'quetame', 25),
(729, 'quibdó', 27),
(730, 'quimbaya', 63),
(731, 'quinchía', 66),
(732, 'quipama', 15),
(733, 'quipile', 25),
(734, 'ragonvalia', 54),
(735, 'ramiriquí', 15),
(736, 'recetor', 85),
(737, 'regidor', 13),
(738, 'remedios', 5),
(739, 'remolino', 47),
(740, 'repelón', 8),
(741, 'restrepo', 50),
(742, 'restrepo', 76),
(743, 'retiro', 5),
(744, 'ricaurte', 25),
(745, 'ricaurte', 52),
(746, 'rio negro', 68),
(747, 'rioblanco', 73),
(748, 'riofrío', 76),
(749, 'riohacha', 44),
(750, 'risaralda', 17),
(751, 'rivera', 41),
(752, 'roberto payán (san josé)', 52),
(753, 'roldanillo', 76),
(754, 'roncesvalles', 73),
(755, 'rondón', 15),
(756, 'rosas', 19),
(757, 'rovira', 73),
(758, 'ráquira', 15),
(759, 'río iró', 27),
(760, 'río quito', 27),
(761, 'río sucio', 17),
(762, 'río viejo', 13),
(763, 'río de oro', 20),
(764, 'ríonegro', 5),
(765, 'ríosucio', 27),
(766, 'sabana de torres', 68),
(767, 'sabanagrande', 8),
(768, 'sabanalarga', 5),
(769, 'sabanalarga', 8),
(770, 'sabanalarga', 85),
(771, 'sabanas de san angel (san angel)', 47),
(772, 'sabaneta', 5),
(773, 'saboyá', 15),
(774, 'sahagún', 23),
(775, 'saladoblanco', 41),
(776, 'salamina', 17),
(777, 'salamina', 47),
(778, 'salazar', 54),
(779, 'saldaña', 73),
(780, 'salento', 63),
(781, 'salgar', 5),
(782, 'samacá', 15),
(783, 'samaniego', 52),
(784, 'samaná', 17),
(785, 'sampués', 70),
(786, 'san agustín', 41),
(787, 'san alberto', 20),
(788, 'san andrés', 68),
(789, 'san andrés sotavento', 23),
(790, 'san andrés de cuerquía', 5),
(791, 'san antero', 23),
(792, 'san antonio', 73),
(793, 'san antonio de tequendama', 25),
(794, 'san benito', 68),
(795, 'san benito abad', 70),
(796, 'san bernardo', 25),
(797, 'san bernardo', 52),
(798, 'san bernardo del viento', 23),
(799, 'san calixto', 54),
(800, 'san carlos', 5),
(801, 'san carlos', 23),
(802, 'san carlos de guaroa', 50),
(803, 'san cayetano', 25),
(804, 'san cayetano', 54),
(805, 'san cristobal', 13),
(806, 'san diego', 20),
(807, 'san eduardo', 15),
(808, 'san estanislao', 13),
(809, 'san fernando', 13),
(810, 'san francisco', 5),
(811, 'san francisco', 25),
(812, 'san francisco', 86),
(813, 'san gíl', 68),
(814, 'san jacinto', 13),
(815, 'san jacinto del cauca', 13),
(816, 'san jerónimo', 5),
(817, 'san joaquín', 68),
(818, 'san josé', 17),
(819, 'san josé de miranda', 68),
(820, 'san josé de montaña', 5),
(821, 'san josé de pare', 15),
(822, 'san josé de uré', 23),
(823, 'san josé del fragua', 18),
(824, 'san josé del guaviare', 95),
(825, 'san josé del palmar', 27),
(826, 'san juan de arama', 50),
(827, 'san juan de betulia', 70),
(828, 'san juan de nepomuceno', 13),
(829, 'san juan de pasto', 52),
(830, 'san juan de río seco', 25),
(831, 'san juan de urabá', 5),
(832, 'san juan del cesar', 44),
(833, 'san juanito', 50),
(834, 'san lorenzo', 52),
(835, 'san luis', 73),
(836, 'san luís', 5),
(837, 'san luís de gaceno', 15),
(838, 'san luís de palenque', 85),
(839, 'san marcos', 70),
(840, 'san martín', 20),
(841, 'san martín', 50),
(842, 'san martín de loba', 13),
(843, 'san mateo', 15),
(844, 'san miguel', 68),
(845, 'san miguel', 86),
(846, 'san miguel de sema', 15),
(847, 'san onofre', 70),
(848, 'san pablo', 13),
(849, 'san pablo', 52),
(850, 'san pablo de borbur', 15),
(851, 'san pedro', 5),
(852, 'san pedro', 70),
(853, 'san pedro', 76),
(854, 'san pedro de cartago', 52),
(855, 'san pedro de urabá', 5),
(856, 'san pelayo', 23),
(857, 'san rafael', 5),
(858, 'san roque', 5),
(859, 'san sebastián', 19),
(860, 'san sebastián de buenavista', 47),
(861, 'san vicente', 5),
(862, 'san vicente del caguán', 18),
(863, 'san vicente del chucurí', 68),
(864, 'san zenón', 47),
(865, 'sandoná', 52),
(866, 'santa ana', 47),
(867, 'santa bárbara', 5),
(868, 'santa bárbara', 68),
(869, 'santa bárbara (iscuandé)', 52),
(870, 'santa bárbara de pinto', 47),
(871, 'santa catalina', 13),
(872, 'santa fé de antioquia', 5),
(873, 'santa genoveva de docorodó', 27),
(874, 'santa helena del opón', 68),
(875, 'santa isabel', 73),
(876, 'santa lucía', 8),
(877, 'santa marta', 47),
(878, 'santa maría', 15),
(879, 'santa maría', 41),
(880, 'santa rosa', 13),
(881, 'santa rosa', 19),
(882, 'santa rosa de cabal', 66),
(883, 'santa rosa de osos', 5),
(884, 'santa rosa de viterbo', 15),
(885, 'santa rosa del sur', 13),
(886, 'santa rosalía', 99),
(887, 'santa sofía', 15),
(888, 'santana', 15),
(889, 'santander de quilichao', 19),
(890, 'santiago', 54),
(891, 'santiago', 86),
(892, 'santo domingo', 5),
(893, 'santo tomás', 8),
(894, 'santuario', 5),
(895, 'santuario', 66),
(896, 'sapuyes', 52),
(897, 'saravena', 81),
(898, 'sardinata', 54),
(899, 'sasaima', 25),
(900, 'sativanorte', 15),
(901, 'sativasur', 15),
(902, 'segovia', 5),
(903, 'sesquilé', 25),
(904, 'sevilla', 76),
(905, 'siachoque', 15),
(906, 'sibaté', 25),
(907, 'sibundoy', 86),
(908, 'silos', 54),
(909, 'silvania', 25),
(910, 'silvia', 19),
(911, 'simacota', 68),
(912, 'simijaca', 25),
(913, 'simití', 13),
(914, 'sincelejo', 70),
(915, 'sincé', 70),
(916, 'sipí', 27),
(917, 'sitionuevo', 47),
(918, 'soacha', 25),
(919, 'soatá', 15),
(920, 'socha', 15),
(921, 'socorro', 68),
(922, 'socotá', 15),
(923, 'sogamoso', 15),
(924, 'solano', 18),
(925, 'soledad', 8),
(926, 'solita', 18),
(927, 'somondoco', 15),
(928, 'sonsón', 5),
(929, 'sopetrán', 5),
(930, 'soplaviento', 13),
(931, 'sopó', 25),
(932, 'sora', 15),
(933, 'soracá', 15),
(934, 'sotaquirá', 15),
(935, 'sotara (paispamba)', 19),
(936, 'sotomayor (los andes)', 52),
(937, 'suaita', 68),
(938, 'suan', 8),
(939, 'suaza', 41),
(940, 'subachoque', 25),
(941, 'sucre', 19),
(942, 'sucre', 68),
(943, 'sucre', 70),
(944, 'suesca', 25),
(945, 'supatá', 25),
(946, 'supía', 17),
(947, 'suratá', 68),
(948, 'susa', 25),
(949, 'susacón', 15),
(950, 'sutamarchán', 15),
(951, 'sutatausa', 25),
(952, 'sutatenza', 15),
(953, 'suárez', 19),
(954, 'suárez', 73),
(955, 'sácama', 85),
(956, 'sáchica', 15),
(957, 'tabio', 25),
(958, 'tadó', 27),
(959, 'talaigua nuevo', 13),
(960, 'tamalameque', 20),
(961, 'tame', 81),
(962, 'taminango', 52),
(963, 'tangua', 52),
(964, 'taraira', 97),
(965, 'tarazá', 5),
(966, 'tarqui', 41),
(967, 'tarso', 5),
(968, 'tasco', 15),
(969, 'tauramena', 85),
(970, 'tausa', 25),
(971, 'tello', 41),
(972, 'tena', 25),
(973, 'tenerife', 47),
(974, 'tenjo', 25),
(975, 'tenza', 15),
(976, 'teorama', 54),
(977, 'teruel', 41),
(978, 'tesalia', 41),
(979, 'tibacuy', 25),
(980, 'tibaná', 15),
(981, 'tibasosa', 15),
(982, 'tibirita', 25),
(983, 'tibú', 54),
(984, 'tierralta', 23),
(985, 'timaná', 41),
(986, 'timbiquí', 19),
(987, 'timbío', 19),
(988, 'tinjacá', 15),
(989, 'tipacoque', 15),
(990, 'tiquisio (puerto rico)', 13),
(991, 'titiribí', 5),
(992, 'toca', 15),
(993, 'tocaima', 25),
(994, 'tocancipá', 25),
(995, 'toguí', 15),
(996, 'toledo', 5),
(997, 'toledo', 54),
(998, 'tolú', 70),
(999, 'tolú viejo', 70),
(1000, 'tona', 68),
(1001, 'topagá', 15),
(1002, 'topaipí', 25),
(1003, 'toribío', 19),
(1004, 'toro', 76),
(1005, 'tota', 15),
(1006, 'totoró', 19),
(1007, 'trinidad', 85),
(1008, 'trujillo', 76),
(1009, 'tubará', 8),
(1010, 'tuchín', 23),
(1011, 'tulúa', 76),
(1012, 'tumaco', 52),
(1013, 'tunja', 15),
(1014, 'tunungua', 15),
(1015, 'turbaco', 13),
(1016, 'turbaná', 13),
(1017, 'turbo', 5),
(1018, 'turmequé', 15),
(1019, 'tuta', 15),
(1020, 'tutasá', 15),
(1021, 'támara', 85),
(1022, 'támesis', 5),
(1023, 'túquerres', 52),
(1024, 'ubalá', 25),
(1025, 'ubaque', 25),
(1026, 'ubaté', 25),
(1027, 'ulloa', 76),
(1028, 'une', 25),
(1029, 'unguía', 27),
(1030, 'unión panamericana (ánimas)', 27),
(1031, 'uramita', 5),
(1032, 'uribe', 50),
(1033, 'uribia', 44),
(1034, 'urrao', 5),
(1035, 'urumita', 44),
(1036, 'usiacuri', 8),
(1037, 'valdivia', 5),
(1038, 'valencia', 23),
(1039, 'valle de san josé', 68),
(1040, 'valle de san juan', 73),
(1041, 'valle del guamuez', 86),
(1042, 'valledupar', 20),
(1043, 'valparaiso', 5),
(1044, 'valparaiso', 18),
(1045, 'vegachí', 5),
(1046, 'venadillo', 73),
(1047, 'venecia', 5),
(1048, 'venecia (ospina pérez)', 25),
(1049, 'ventaquemada', 15),
(1050, 'vergara', 25),
(1051, 'versalles', 76),
(1052, 'vetas', 68),
(1053, 'viani', 25),
(1054, 'vigía del fuerte', 5),
(1055, 'vijes', 76),
(1056, 'villa caro', 54),
(1057, 'villa rica', 19),
(1058, 'villa de leiva', 15),
(1059, 'villa del rosario', 54),
(1060, 'villagarzón', 86),
(1061, 'villagómez', 25),
(1062, 'villahermosa', 73),
(1063, 'villamaría', 17),
(1064, 'villanueva', 13),
(1065, 'villanueva', 44),
(1066, 'villanueva', 68),
(1067, 'villanueva', 85),
(1068, 'villapinzón', 25),
(1069, 'villarrica', 73),
(1070, 'villavicencio', 50),
(1071, 'villavieja', 41),
(1072, 'villeta', 25),
(1073, 'viotá', 25),
(1074, 'viracachá', 15),
(1075, 'vista hermosa', 50),
(1076, 'viterbo', 17),
(1077, 'vélez', 68),
(1078, 'yacopí', 25),
(1079, 'yacuanquer', 52),
(1080, 'yaguará', 41),
(1081, 'yalí', 5),
(1082, 'yarumal', 5),
(1083, 'yolombó', 5),
(1084, 'yondó (casabe)', 5),
(1085, 'yopal', 85),
(1086, 'yotoco', 76),
(1087, 'yumbo', 76),
(1088, 'zambrano', 13),
(1089, 'zapatoca', 68),
(1090, 'zapayán (punta de piedras)', 47),
(1091, 'zaragoza', 5),
(1092, 'zarzal', 76),
(1093, 'zetaquirá', 15),
(1094, 'zipacón', 25),
(1095, 'zipaquirá', 25),
(1096, 'zona bananera (prado - sevilla)', 47),
(1097, 'ábrego', 54),
(1098, 'íquira', 41),
(1099, 'úmbita', 15),
(1100, 'útica', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `genero_idgenero` int(11) NOT NULL,
  `tipo_id_idtipo_id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) NOT NULL,
  `correo_contacto` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `genero_idgenero`, `tipo_id_idtipo_id`, `nombre`, `apellido1`, `apellido2`, `correo_contacto`, `fecha_nacimiento`) VALUES
(1, 1, 1, 'jhonatan', 'a', 'b', 'claudia@ufps.edu.co', '2020-05-13'),
(2, 1, 3, 'representante', 'representante', 'representante', 'correo@gmail.com', NULL),
(3, 1, 1, 'asd', 'asd', 'asd', NULL, NULL),
(5, 3, 1, 'representante', 'a', 'a', 'a', '2020-05-04'),
(9, 1, 1, 'arturito', 'garrafla', 'gandia', 'correo@ufps.edu.co', '2020-05-13'),
(12, 1, 1, 'felipe', 'seã±or', 'error', 'eduardojoasepc@ufps.edu.co', '2020-06-09'),
(155, 1, 1, 'jhonatan ', 'cazares', 'de la villa', 'jhonatanraulca@ufps.edu.co', '2020-06-02'),
(195, 1, 1, 'conejillo', 'de', 'indias', 'conejillo@ufps.edu.co', '1990-01-23'),
(664, 1, 1, 'profesor1', 'profesorape', 'profesorape', 'eduardojosepc@ufps.edu.co', '2020-05-13'),
(666, 2, 1, 'carmen', 'janeth', 'parada', 'correo', '2020-05-17'),
(667, 3, 1, 'milton', 'prueba', 'prueba', 'motilon@ufps.edu.co', '2020-05-19'),
(888, 2, 1, 'miguel', 'paez', 'avellaneda', 'migueleduardopa@ufps.edu.co', '2020-05-04'),
(989, 1, 1, 'arturito padre', 'castor', 'fire', 'arturito@ufps.edu.co', '2020-05-06'),
(98732, 3, 1, 'errro', 'errro', 'errro', 'eduardojosepc@ufps.edu.co', '2020-05-12'),
(1114532, 1, 1, 'nicolas ', 'lkjasd', 'asdasd', 'prueba@ufps.edu.co', '1992-06-09'),
(10909344, 1, 1, 'arturito junior', 'gargafa', 'gandia', 'arturito@ufps.edu.co', '2020-04-15'),
(123444444, 1, 1, 'asad', 'asdad', 'asdasd', 'claudia@ufps.edu.co', '2020-05-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `persona_id_persona` int(11) NOT NULL,
  `codigo_profesor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`persona_id_persona`, `codigo_profesor`) VALUES
(888, '1117'),
(667, '1181234'),
(664, '119'),
(195, '19881263'),
(1114532, '98779');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `idsemestre` int(11) NOT NULL,
  `periodo` varchar(45) DEFAULT NULL,
  `anio` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`idsemestre`, `periodo`, `anio`) VALUES
(1, 'i', '2020'),
(2, 'ii', '2020'),
(3, 'i', '2021'),
(4, 'ii', '2021'),
(5, 'i', '2022'),
(6, 'ii', '2022'),
(7, '1', '2020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc_apoyo`
--

CREATE TABLE `tipo_doc_apoyo` (
  `idtipo_doc_apoyo` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_doc_apoyo`
--

INSERT INTO `tipo_doc_apoyo` (`idtipo_doc_apoyo`, `nombre`, `descripcion`) VALUES
(0, 'documento de texto', 'archivos de texto de tipo .txt .docx .odt y similares'),
(1, 'hojas de calculo', 'archivos de hojas de calculo de excel o similares'),
(2, 'evidencias fotograficas', 'cualquier archivo de imagen de cualquier extensión y tipo que certifiquen aspectos necesarios de las visitas'),
(3, 'video', 'archivos de video y etc...'),
(4, 'plantillas de presentaciones', 'editar info aqui_'),
(5, 'archivos pdf', 'editar info aqui_');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_id`
--

CREATE TABLE `tipo_id` (
  `idtipo_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_id`
--

INSERT INTO `tipo_id` (`idtipo_id`, `nombre`) VALUES
(1, 'cedula de ciudadanía'),
(2, 'tarjeta de identidad'),
(3, 'cedula de extranjeria'),
(4, 'pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `idtipo_usuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`idtipo_usuario`, `nombre`) VALUES
(0, 'estudiante'),
(1, 'profesor'),
(2, 'empresa'),
(3, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `tipo_usuario_idtipo_usuario` int(11) NOT NULL,
  `correo_usuario` varchar(45) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `verificado` tinyint(4) DEFAULT 0,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`tipo_usuario_idtipo_usuario`, `correo_usuario`, `contrasena`, `verificado`, `id_usuario`) VALUES
(0, 'claaaaudia@ufps.edu.co', '87', 0, 1),
(0, 'eduardojoasepc@ufps.edu.co', '87', 0, 12),
(0, 'jhonatanraulca@ufps.edu.co', '87', 0, 155),
(1, 'conejillo@ufps.edu.co', '87', 0, 195),
(1, 'eduardojosepc@ufps.edu.co', '09', 0, 664),
(1, 'motilaaaon@ufps.edu.co', '87', 0, 667),
(1, 'migueleduardopa@ufps.edu.co', '87', 0, 888),
(0, 'eduardojosepc@ufps.edu.co', '87', 0, 98732),
(1, 'prueba@ufps.edu.co', '87', 0, 1114532),
(0, 'arturito@ufps.edu.co', '87', 0, 10909344),
(0, 'claudia@ufps.edu.co', '87', 0, 123444444);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `idvisita` int(11) NOT NULL,
  `fecha_visita_inicio` date DEFAULT NULL,
  `grupo_idgrupo` int(11) NOT NULL,
  `fecha_visita_salida` date DEFAULT NULL,
  `cupos_disponibles` int(11) DEFAULT 0,
  `municipio` int(6) UNSIGNED NOT NULL,
  `empresa_rut` int(11) NOT NULL,
  `fecha_insercion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `titulo` text NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`idvisita`, `fecha_visita_inicio`, `grupo_idgrupo`, `fecha_visita_salida`, `cupos_disponibles`, `municipio`, `empresa_rut`, `fecha_insercion`, `titulo`, `descripcion`) VALUES
(40, '2020-06-01', 13307031, '2020-06-18', 1, 107, 87012311, '2020-06-04 22:10:06', 'excursion insclusiva de medios digitales', 'descripcion bien bonita aqui');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`profesor_persona_id_persona`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`idasistencia`),
  ADD KEY `fk_asistencia_visita1_idx` (`visita_idvisita`),
  ADD KEY `fk_asistencia_estudiante1_idx` (`estudiante_persona_id_persona`) USING BTREE;

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `documento_apoyo`
--
ALTER TABLE `documento_apoyo`
  ADD PRIMARY KEY (`id_doc`),
  ADD KEY `fk_documento_apoyo_tipo_doc_apoyo1_idx` (`tipo_doc_apoyo_idtipo_doc_apoyo`),
  ADD KEY `fk_documento_apoyo_visita1_idx` (`visita_idvisita`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`rut`),
  ADD KEY `fk_empresa_persona1_idx` (`representante_legal`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`persona_id_persona`),
  ADD UNIQUE KEY `codigo_unique` (`codigo`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `eps` (`eps`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idgenero`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idgrupo`),
  ADD KEY `fk_grupo_materia1_idx` (`materia_idmateria`),
  ADD KEY `fk_grupo_profesor1_idx` (`profesor_persona_id_persona`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idmateria`),
  ADD KEY `fk_materia_semestre1_idx` (`semestre_idsemestre`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `departamento_id` (`departamento_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `fk_persona_genero1_idx` (`genero_idgenero`),
  ADD KEY `fk_persona_tipo_id1_idx` (`tipo_id_idtipo_id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`persona_id_persona`),
  ADD UNIQUE KEY `codigo_profesor_unique` (`codigo_profesor`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`idsemestre`);

--
-- Indices de la tabla `tipo_doc_apoyo`
--
ALTER TABLE `tipo_doc_apoyo`
  ADD PRIMARY KEY (`idtipo_doc_apoyo`);

--
-- Indices de la tabla `tipo_id`
--
ALTER TABLE `tipo_id`
  ADD PRIMARY KEY (`idtipo_id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`idtipo_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_tipo_usuario1_idx` (`tipo_usuario_idtipo_usuario`),
  ADD KEY `fk_usuario_persona1_idx` (`id_usuario`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`idvisita`),
  ADD KEY `fk_visita_grupo1_idx` (`grupo_idgrupo`),
  ADD KEY `m` (`municipio`),
  ADD KEY `empresa_rut` (`empresa_rut`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `idasistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_departamento` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `documento_apoyo`
--
ALTER TABLE `documento_apoyo`
  MODIFY `id_doc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `idgenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipio` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1101;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `idsemestre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_id`
--
ALTER TABLE `tipo_id`
  MODIFY `idtipo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `idvisita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_administrador_profesor1` FOREIGN KEY (`profesor_persona_id_persona`) REFERENCES `profesor` (`persona_id_persona`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `fk_asistencia_estudiante1` FOREIGN KEY (`estudiante_persona_id_persona`) REFERENCES `estudiante` (`persona_id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asistencia_visita1` FOREIGN KEY (`visita_idvisita`) REFERENCES `visita` (`idvisita`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `documento_apoyo`
--
ALTER TABLE `documento_apoyo`
  ADD CONSTRAINT `fk_documento_apoyo_tipo_doc_apoyo1` FOREIGN KEY (`tipo_doc_apoyo_idtipo_doc_apoyo`) REFERENCES `tipo_doc_apoyo` (`idtipo_doc_apoyo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_documento_apoyo_visita1` FOREIGN KEY (`visita_idvisita`) REFERENCES `visita` (`idvisita`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_persona1` FOREIGN KEY (`representante_legal`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `eps` FOREIGN KEY (`eps`) REFERENCES `eps` (`id`),
  ADD CONSTRAINT `fk_estudiante_persona1` FOREIGN KEY (`persona_id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_grupo_materia1` FOREIGN KEY (`materia_idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_profesor1` FOREIGN KEY (`profesor_persona_id_persona`) REFERENCES `profesor` (`persona_id_persona`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `fk_materia_semestre1` FOREIGN KEY (`semestre_idsemestre`) REFERENCES `semestre` (`idsemestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `departamento_fk` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id_departamento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_genero1` FOREIGN KEY (`genero_idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_tipo_id1` FOREIGN KEY (`tipo_id_idtipo_id`) REFERENCES `tipo_id` (`idtipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `fk_profesor_persona1` FOREIGN KEY (`persona_id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`id_usuario`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_tipo_usuario1` FOREIGN KEY (`tipo_usuario_idtipo_usuario`) REFERENCES `tipo_usuario` (`idtipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `empresa_rut` FOREIGN KEY (`empresa_rut`) REFERENCES `empresa` (`rut`),
  ADD CONSTRAINT `fk_visita_grupo1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `m` FOREIGN KEY (`municipio`) REFERENCES `municipios` (`id_municipio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
