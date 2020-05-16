-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-05-2020 a las 19:46:36
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
-- Creación: 15-05-2020 a las 14:35:11
--

CREATE TABLE `administrador` (
  `fecha_entrada` date DEFAULT NULL,
  `fecha_salida` varchar(45) DEFAULT NULL,
  `Profesor_Persona_id_Persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--
-- Creación: 15-05-2020 a las 14:35:12
--

CREATE TABLE `asistencia` (
  `idAsistencia` int(11) NOT NULL,
  `aprobado` tinyint(4) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `Visita_idVisita` int(11) NOT NULL,
  `Estudiante_Persona_id_Persona` int(11) NOT NULL,
  `Estudiante_Persona_Tipo_id_idTipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_apoyo`
--
-- Creación: 16-05-2020 a las 02:29:47
--

CREATE TABLE `documento_apoyo` (
  `Tipo_doc_Apoyo_idTipo_doc_Apoyo` int(11) NOT NULL,
  `id_doc` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion_url` varchar(300) DEFAULT NULL,
  `fecha_creacion` varchar(45) DEFAULT NULL,
  `Visita_idVisita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--
-- Creación: 15-05-2020 a las 14:35:12
--

CREATE TABLE `empresa` (
  `rut` int(11) NOT NULL,
  `nombre_razon_social` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `representante_legal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--
-- Creación: 16-05-2020 a las 13:56:11
-- Última actualización: 16-05-2020 a las 16:45:21
--

CREATE TABLE `estudiante` (
  `Persona_id_Persona` int(11) NOT NULL,
  `codigo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`Persona_id_Persona`, `codigo`) VALUES
(9172389, '123441'),
(1, '666');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--
-- Creación: 15-05-2020 a las 14:35:10
--

CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`idGenero`, `Nombre`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Otro'),
(9, 'prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--
-- Creación: 15-05-2020 a las 14:35:11
--

CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL,
  `Materia_idMateria` int(11) NOT NULL,
  `Profesor_Persona_id_Persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--
-- Creación: 15-05-2020 a las 14:35:10
--

CREATE TABLE `materia` (
  `idMateria` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Semestre_idSemestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--
-- Creación: 15-05-2020 a las 14:35:10
-- Última actualización: 16-05-2020 a las 16:45:20
--

CREATE TABLE `persona` (
  `id_Persona` int(11) NOT NULL,
  `Genero_idGenero` int(11) NOT NULL,
  `Tipo_id_idTipo_id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) NOT NULL,
  `correo_contacto` varchar(45) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_Persona`, `Genero_idGenero`, `Tipo_id_idTipo_id`, `nombre`, `apellido1`, `apellido2`, `correo_contacto`, `fecha_nacimiento`) VALUES
(1, 1, 1, 'Juan', 'Pedro', 'Liz', 'sa', '2020-04-28'),
(9172389, 1, 1, 'asdf', 'asdasd', 'asdasd', 'asd', '2020-05-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--
-- Creación: 15-05-2020 a las 14:35:11
--

CREATE TABLE `profesor` (
  `Persona_id_Persona` int(11) NOT NULL,
  `codigo_profesor` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--
-- Creación: 15-05-2020 a las 14:35:09
--

CREATE TABLE `semestre` (
  `idSemestre` int(11) NOT NULL,
  `periodo` varchar(45) DEFAULT NULL,
  `anio` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc_apoyo`
--
-- Creación: 15-05-2020 a las 14:35:13
--

CREATE TABLE `tipo_doc_apoyo` (
  `idTipo_doc_Apoyo` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_doc_apoyo`
--

INSERT INTO `tipo_doc_apoyo` (`idTipo_doc_Apoyo`, `nombre`, `descripcion`) VALUES
(0, 'Documento De texto', 'Archivos de texto de tipo .txt .docx .odt y similares'),
(1, 'Hojas de Calculo', 'Archivos de Hojas de calculo de Excel o similares'),
(2, 'Evidencias Fotograficas', 'Cualquier archivo de imagen de cualquier extensión y tipo que certifiquen aspectos necesarios de las visitas'),
(3, 'Video', 'Archivos de video y etc...'),
(4, 'plantillas de presentaciones', 'editar info aqui_'),
(5, 'Archivos Pdf', 'editar info aqui_');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_id`
--
-- Creación: 15-05-2020 a las 14:35:09
--

CREATE TABLE `tipo_id` (
  `idTipo_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_id`
--

INSERT INTO `tipo_id` (`idTipo_id`, `nombre`) VALUES
(1, 'Cedula de Ciudadanía'),
(2, 'Tarjeta De Identidad'),
(3, 'Cedula de Extranjeria'),
(4, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--
-- Creación: 15-05-2020 a las 14:35:13
--

CREATE TABLE `tipo_usuario` (
  `idTipo_usuario` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`idTipo_usuario`, `Nombre`) VALUES
(0, 'Estudiante'),
(1, 'Profesor'),
(2, 'Empresa'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--
-- Creación: 16-05-2020 a las 03:03:02
-- Última actualización: 16-05-2020 a las 16:45:20
--

CREATE TABLE `usuario` (
  `Tipo_usuario_idTipo_usuario` int(11) NOT NULL,
  `correo_usuario` varchar(45) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `verificado` tinyint(4) DEFAULT 0,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Tipo_usuario_idTipo_usuario`, `correo_usuario`, `contrasena`, `verificado`, `id_usuario`) VALUES
(0, 'sa', '87', 0, 1),
(0, 'asd', '1234', 0, 9172389);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--
-- Creación: 15-05-2020 a las 14:35:11
--

CREATE TABLE `visita` (
  `idVisita` int(11) NOT NULL,
  `fecha_visita_inicio` date DEFAULT NULL,
  `grupo_id` varchar(45) DEFAULT NULL,
  `Grupo_idGrupo` int(11) NOT NULL,
  `Administrador_Profesor_Persona_id_Persona` int(11) NOT NULL,
  `fecha_visita_salida` date DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `cupos_disponibles` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Profesor_Persona_id_Persona`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`idAsistencia`),
  ADD KEY `fk_Asistencia_Visita1_idx` (`Visita_idVisita`),
  ADD KEY `fk_Asistencia_Estudiante1_idx` (`Estudiante_Persona_id_Persona`,`Estudiante_Persona_Tipo_id_idTipo_id`);

--
-- Indices de la tabla `documento_apoyo`
--
ALTER TABLE `documento_apoyo`
  ADD PRIMARY KEY (`id_doc`),
  ADD KEY `fk_Documento_Apoyo_Tipo_doc_Apoyo1_idx` (`Tipo_doc_Apoyo_idTipo_doc_Apoyo`),
  ADD KEY `fk_Documento_Apoyo_Visita1_idx` (`Visita_idVisita`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`rut`),
  ADD KEY `fk_Empresa_Persona1_idx` (`representante_legal`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`Persona_id_Persona`),
  ADD UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`),
  ADD KEY `fk_Grupo_Materia1_idx` (`Materia_idMateria`),
  ADD KEY `fk_Grupo_Profesor1_idx` (`Profesor_Persona_id_Persona`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idMateria`),
  ADD KEY `fk_Materia_Semestre1_idx` (`Semestre_idSemestre`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_Persona`),
  ADD KEY `fk_Persona_Genero1_idx` (`Genero_idGenero`),
  ADD KEY `fk_Persona_Tipo_id1_idx` (`Tipo_id_idTipo_id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`Persona_id_Persona`),
  ADD UNIQUE KEY `codigo_profesor_UNIQUE` (`codigo_profesor`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`idSemestre`);

--
-- Indices de la tabla `tipo_doc_apoyo`
--
ALTER TABLE `tipo_doc_apoyo`
  ADD PRIMARY KEY (`idTipo_doc_Apoyo`);

--
-- Indices de la tabla `tipo_id`
--
ALTER TABLE `tipo_id`
  ADD PRIMARY KEY (`idTipo_id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`idTipo_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_Usuario_Tipo_usuario1_idx` (`Tipo_usuario_idTipo_usuario`),
  ADD KEY `fk_usuario_persona1_idx` (`id_usuario`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`idVisita`),
  ADD KEY `fk_Visita_Grupo1_idx` (`Grupo_idGrupo`),
  ADD KEY `fk_Visita_Administrador1_idx` (`Administrador_Profesor_Persona_id_Persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `idAsistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documento_apoyo`
--
ALTER TABLE `documento_apoyo`
  MODIFY `id_doc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `idSemestre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_id`
--
ALTER TABLE `tipo_id`
  MODIFY `idTipo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `idVisita` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_Administrador_Profesor1` FOREIGN KEY (`Profesor_Persona_id_Persona`) REFERENCES `profesor` (`Persona_id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `fk_Asistencia_Estudiante1` FOREIGN KEY (`Estudiante_Persona_id_Persona`) REFERENCES `estudiante` (`Persona_id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Asistencia_Visita1` FOREIGN KEY (`Visita_idVisita`) REFERENCES `visita` (`idVisita`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `documento_apoyo`
--
ALTER TABLE `documento_apoyo`
  ADD CONSTRAINT `fk_Documento_Apoyo_Tipo_doc_Apoyo1` FOREIGN KEY (`Tipo_doc_Apoyo_idTipo_doc_Apoyo`) REFERENCES `tipo_doc_apoyo` (`idTipo_doc_Apoyo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Documento_Apoyo_Visita1` FOREIGN KEY (`Visita_idVisita`) REFERENCES `visita` (`idVisita`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_Empresa_Persona1` FOREIGN KEY (`representante_legal`) REFERENCES `persona` (`id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `fk_Estudiante_Persona1` FOREIGN KEY (`Persona_id_Persona`) REFERENCES `persona` (`id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_Grupo_Materia1` FOREIGN KEY (`Materia_idMateria`) REFERENCES `materia` (`idMateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Grupo_Profesor1` FOREIGN KEY (`Profesor_Persona_id_Persona`) REFERENCES `profesor` (`Persona_id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `fk_Materia_Semestre1` FOREIGN KEY (`Semestre_idSemestre`) REFERENCES `semestre` (`idSemestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_Persona_Genero1` FOREIGN KEY (`Genero_idGenero`) REFERENCES `genero` (`idGenero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Persona_Tipo_id1` FOREIGN KEY (`Tipo_id_idTipo_id`) REFERENCES `tipo_id` (`idTipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `fk_Profesor_Persona1` FOREIGN KEY (`Persona_id_Persona`) REFERENCES `persona` (`id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Tipo_usuario1` FOREIGN KEY (`Tipo_usuario_idTipo_usuario`) REFERENCES `tipo_usuario` (`idTipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`id_usuario`) REFERENCES `persona` (`id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `fk_Visita_Administrador1` FOREIGN KEY (`Administrador_Profesor_Persona_id_Persona`) REFERENCES `administrador` (`Profesor_Persona_id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Visita_Grupo1` FOREIGN KEY (`Grupo_idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
