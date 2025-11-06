CREATE TABLE `usuarios` (
  `id_usuario` integer PRIMARY KEY AUTO_INCREMENT,
  `correo` varchar(255) UNIQUE NOT NULL,
  `contrasena_hash` varchar(255) NOT NULL,
  `tipo_usuario` varchar(50) NOT NULL COMMENT 'candidato, admin, empresa, universidad',
  `fecha_aceptacion_terminos` timestamp,
  `fecha_creacion` timestamp DEFAULT (now()),
  `activo` boolean DEFAULT true,
  `oauth_provider` varchar(50) COMMENT 'google, linkedin, local',
  `oauth_id` varchar(255) UNIQUE COMMENT 'ID único del proveedor de OAuth'
);

CREATE TABLE `candidatos` (
  `id_candidato` integer PRIMARY KEY AUTO_INCREMENT,
  `id_usuario` integer UNIQUE NOT NULL,
  `nombre` varchar(100),
  `apellido_paterno` varchar(100),
  `apellido_materno` varchar(100),
  `telefono` varchar(20),
  `lugar_residencia` varchar(255),
  `fecha_nacimiento` date,
  `preferencia_jornada` varchar(50) COMMENT 'Tiempo completo, Medio tiempo, Por proyecto',
  `preferencia_modalidad` varchar(50) COMMENT 'Presencial, Híbrido, Remoto',
  `puesto_deseado` varchar(255)
);

CREATE TABLE `administrativos` (
  `id_admin` integer PRIMARY KEY AUTO_INCREMENT,
  `id_usuario` integer UNIQUE NOT NULL,
  `id_rol` integer NOT NULL,
  `nombre_completo` varchar(255),
  `telefono` varchar(20)
);

CREATE TABLE `empresas` (
  `id_empresa` integer PRIMARY KEY AUTO_INCREMENT,
  `id_sector` integer,
  `id_tamano` integer,
  `nombre_empresa` varchar(255),
  `telefono` varchar(20),
  `rfc` varchar(13) UNIQUE,
  `descripcion` text,
  `sitio_web` varchar(255),
  `nombre_responsable` varchar(255),
  `puesto_responsable` varchar(150),
  `validada_manualmente` boolean DEFAULT false
);

CREATE TABLE `empresa_usuarios` (
  `id_empresa` integer NOT NULL,
  `id_usuario` integer NOT NULL,
  `rol` varchar(50) NOT NULL COMMENT 'Admin, Reclutador, Editor'
);

CREATE TABLE `universidades` (
  `id_universidad` integer PRIMARY KEY AUTO_INCREMENT,
  `id_escuela` integer UNIQUE NOT NULL COMMENT 'Vincula al catálogo de escuelas para datos básicos',
  `nombre_responsable` varchar(255),
  `puesto_responsable` varchar(150),
  `telefono_responsable` varchar(20),
  `numero_matricula` integer,
  `servicios_vinculacion` text COMMENT 'Almacena los servicios que ofrecen',
  `validada_manualmente` boolean DEFAULT false,
  `fecha_validacion` timestamp
);

CREATE TABLE `universidad_usuarios` (
  `id_universidad` integer NOT NULL,
  `id_usuario` integer NOT NULL,
  `rol` varchar(50) NOT NULL COMMENT 'Admin, Vinculación, Académico'
);

CREATE TABLE `experiencia_laboral` (
  `id_experiencia` integer PRIMARY KEY AUTO_INCREMENT,
  `id_candidato` integer NOT NULL,
  `puesto` varchar(255),
  `nombre_empresa` varchar(255),
  `descripcion` text,
  `fecha_inicio` date,
  `fecha_fin` date COMMENT 'Nulo si es el trabajo actual'
);

CREATE TABLE `formacion_academica` (
  `id_formacion` integer PRIMARY KEY AUTO_INCREMENT,
  `id_candidato` integer NOT NULL,
  `id_escuela` integer NOT NULL,
  `id_carrera` integer NOT NULL,
  `nivel_estudio` varchar(100) COMMENT 'Licenciatura, Maestría, etc.',
  `fecha_inicio` date,
  `fecha_fin` date
);

CREATE TABLE `documentos` (
  `id_documento` integer PRIMARY KEY AUTO_INCREMENT,
  `id_candidato` integer NOT NULL,
  `id_tipo` integer NOT NULL,
  `formato` varchar(10),
  `url_archivo` text,
  `fecha_subida` timestamp DEFAULT (now())
);

CREATE TABLE `habilidades` (
  `id_habilidad` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre_habilidad` varchar(100) UNIQUE NOT NULL,
  `tipo_habilidad` varchar(50) COMMENT 'hard, soft'
);

CREATE TABLE `candidato_habilidades` (
  `id_candidato` integer NOT NULL,
  `id_habilidad` integer NOT NULL,
  `nivel` varchar(50) COMMENT 'Básico, Intermedio, Avanzado'
);

CREATE TABLE `idiomas` (
  `id_idioma` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre_idioma` varchar(100) UNIQUE NOT NULL
);

CREATE TABLE `candidato_idiomas` (
  `id_candidato` integer NOT NULL,
  `id_idioma` integer NOT NULL,
  `nivel` varchar(50) NOT NULL COMMENT 'Nativo, Básico (A1), Intermedio (B1), Avanzado (C1), etc.'
);

CREATE TABLE `roles_admin` (
  `id_rol` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre_rol` varchar(100) UNIQUE NOT NULL
);

CREATE TABLE `sectores_empresa` (
  `id_sector` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre_sector` varchar(150) UNIQUE NOT NULL
);

CREATE TABLE `tamanos_empresa` (
  `id_tamano` integer PRIMARY KEY AUTO_INCREMENT,
  `rango_empleados` varchar(50) UNIQUE NOT NULL COMMENT 'ej: 1-10, 11-50'
);

CREATE TABLE `tipos_documento` (
  `id_tipo` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(100) UNIQUE NOT NULL COMMENT 'CV, INE, etc.'
);

CREATE TABLE `estatus_vacante` (
  `id_estatus` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50) UNIQUE NOT NULL COMMENT 'Activa, Cerrada, Pausada'
);

CREATE TABLE `estatus_postulacion` (
  `id_estatus_postulacion` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50) UNIQUE NOT NULL COMMENT 'En revisión, Entrevista, Contratado, Rechazado'
);

CREATE TABLE `tipos_etapa` (
  `id_tipo_etapa` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre_etapa` varchar(100) UNIQUE NOT NULL COMMENT 'Preselección, Entrevista RH, Entrevista Técnica'
);

CREATE TABLE `estatus_etapa` (
  `id_estatus_etapa` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre_estatus` varchar(50) UNIQUE NOT NULL COMMENT 'Pendiente, Completada, Cancelada'
);

CREATE TABLE `escuelas` (
  `id_escuela` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `pagina_web_oficial` varchar(255),
  `direccion_completa` text,
  `ciudad_estado` varchar(150),
  `nombre_campus` varchar(150)
);

CREATE TABLE `carreras_escuela` (
  `id_carrera` integer PRIMARY KEY AUTO_INCREMENT,
  `id_escuela` integer NOT NULL,
  `nombre` varchar(255)
);

CREATE TABLE `empresa_escuela` (
  `id_empresa` integer NOT NULL,
  `id_escuela` integer NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `cat_niveles_educativos` (
  `id_nivel` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(100) UNIQUE NOT NULL COMMENT 'Licenciatura, Posgrado, Técnico Superior'
);

CREATE TABLE `cat_areas_estudio` (
  `id_area` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(150) UNIQUE NOT NULL COMMENT 'Ingeniería y Tecnología, Ciencias Sociales, etc.'
);

CREATE TABLE `cat_modalidades_estudio` (
  `id_modalidad` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(100) UNIQUE NOT NULL COMMENT 'Presencial, Híbrido, Online'
);

CREATE TABLE `universidad_niveles` (
  `id_universidad` integer NOT NULL,
  `id_nivel` integer NOT NULL
);

CREATE TABLE `universidad_areas` (
  `id_universidad` integer NOT NULL,
  `id_area` integer NOT NULL
);

CREATE TABLE `universidad_modalidades` (
  `id_universidad` integer NOT NULL,
  `id_modalidad` integer NOT NULL
);

CREATE TABLE `documentos_institucionales` (
  `id_documento` integer PRIMARY KEY AUTO_INCREMENT,
  `id_universidad` integer COMMENT 'Puede ser nulo si es de una empresa',
  `id_empresa` integer COMMENT 'Puede ser nulo si es de una universidad',
  `tipo_documento` varchar(100) COMMENT 'Logo, Carta Colaboración, etc.',
  `formato` varchar(10),
  `url_archivo` text,
  `fecha_subida` timestamp DEFAULT (now())
);

CREATE TABLE `vacantes` (
  `id_vacante` integer PRIMARY KEY AUTO_INCREMENT,
  `id_empresa` integer NOT NULL,
  `id_estatus` integer NOT NULL,
  `id_usuario_creador` integer NOT NULL,
  `titulo` varchar(255),
  `descripcion` text,
  `ubicacion` varchar(255),
  `sueldo_minimo` decimal(10,2),
  `sueldo_maximo` decimal(10,2),
  `moneda` varchar(3) COMMENT 'MXN, USD, etc.',
  `periodo` varchar(50) COMMENT 'Mensual, Anual',
  `es_destacada` boolean DEFAULT false,
  `fecha_publicacion` timestamp DEFAULT (now()),
  `estatus_moderacion` varchar(50) NOT NULL DEFAULT 'pendiente' COMMENT 'pendiente, aprobada, rechazada',
  `Modalidad` varchar(50) COMMENT 'Presencial, Home office, híbrido',
  `Jornada` varchar(50) COMMENT 'Tiempo completo, medio tiempo, fin de semana, practicas profesionales, temporal'
);

CREATE TABLE `postulaciones` (
  `id_postulacion` integer PRIMARY KEY AUTO_INCREMENT,
  `id_candidato` integer NOT NULL,
  `id_vacante` integer NOT NULL,
  `id_estatus_postulacion` integer NOT NULL,
  `created_by_admin` integer COMMENT 'Admin que registró la postulación, si aplica',
  `fecha_postulacion` timestamp DEFAULT (now()),
  `notas_reclutador` text
);

CREATE TABLE `etapas_proceso` (
  `id_etapa` integer PRIMARY KEY AUTO_INCREMENT,
  `id_postulacion` integer NOT NULL,
  `id_tipo_etapa` integer NOT NULL,
  `id_estatus_etapa` integer NOT NULL,
  `fecha_inicio` timestamp,
  `fecha_fin` timestamp,
  `observaciones` text
);

CREATE TABLE `seguimientos_postulacion` (
  `id_seguimiento` integer PRIMARY KEY AUTO_INCREMENT,
  `id_postulacion` integer NOT NULL,
  `id_usuario` integer NOT NULL,
  `tipo` varchar(50) COMMENT 'llamada, correo, reunión',
  `comentario` text,
  `proximo_paso` varchar(255),
  `fecha_seguimiento` timestamp DEFAULT (now())
);

CREATE TABLE `ingresos` (
  `id_postulacion` integer,
  `id_estatus_etapa` integer AUTO_INCREMENT,
  `nombre_estatus` varchar(50) UNIQUE NOT NULL COMMENT 'Pendiente, Completada, Cancelada',
  `id_estatus_postulacion` integer AUTO_INCREMENT,
  `nombre` varchar(50) UNIQUE NOT NULL COMMENT 'En revisión, Entrevista, Contratado, Rechazado',
  `id_ingresos` integer,
  `id_empresa` integer NOT NULL,
  `id_usuario_creador` integer NOT NULL,
  `id_departamento` varchar(50) UNIQUE NOT NULL COMMENT 'Implant, Atraccion de talento',
  PRIMARY KEY (`id_estatus_etapa`, `id_estatus_postulacion`)
);

CREATE TABLE `mensajes` (
  `id_mensajes` integer PRIMARY KEY,
  `id_remitente` integer,
  `id_destinatario` integer,
  `contenido` text,
  `fecha_envio` datetime,
  `fecha_leido` datetime,
  `estado` enum(enviado,leido,eliminado)
);

CREATE TABLE `cat_modalidades_laborales` (
  `id_modalidad_laboral` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50) UNIQUE NOT NULL
);

CREATE TABLE `cat_jornadas_laborales` (
  `id_jornada` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50) UNIQUE NOT NULL
);

CREATE TABLE `vacante_modalidades` (
  `id_vacante` integer NOT NULL,
  `id_modalidad_laboral` integer NOT NULL
);

CREATE TABLE `vacante_jornadas` (
  `id_vacante` integer NOT NULL,
  `id_jornada` integer NOT NULL
);

CREATE TABLE `eventos` (
  `id_evento` integer PRIMARY KEY AUTO_INCREMENT,
  `nombre_evento` varchar(255) NOT NULL,
  `descripcion` text,
  `tipo_evento` varchar(100) COMMENT 'Feria de empleo, Taller, Webinar',
  `fecha_inicio` timestamp,
  `fecha_fin` timestamp,
  `modalidad` varchar(50) COMMENT 'Presencial, Virtual, Híbrido',
  `url_evento` varchar(255),
  `id_admin_creador` integer COMMENT 'Nulo si es creado por una universidad',
  `id_usuario_universidad_creador` integer COMMENT 'Nulo si es creado por un admin. Es un id de la tabla usuarios',
  `estatus` varchar(50) COMMENT 'Planeado, Activo, Finalizado, Cancelado'
);

CREATE TABLE `banners_promocionales` (
  `id_banner` integer PRIMARY KEY AUTO_INCREMENT,
  `titulo` varchar(255),
  `url_imagen` varchar(255) NOT NULL,
  `url_destino` varchar(255),
  `ubicacion` varchar(100) COMMENT 'home_principal, dashboard_candidato, etc.',
  `activo` boolean DEFAULT true,
  `fecha_inicio` timestamp,
  `fecha_fin` timestamp
);

CREATE TABLE `notificaciones_globales` (
  `id_notificacion` integer PRIMARY KEY AUTO_INCREMENT,
  `mensaje` text NOT NULL,
  `tipo` varchar(50) COMMENT 'Informativa, Alerta, Mantenimiento',
  `fecha_expiracion` timestamp,
  `activo` boolean DEFAULT true
);

CREATE TABLE `audit_log_admin` (
  `id_log` integer PRIMARY KEY AUTO_INCREMENT,
  `id_admin` integer NOT NULL,
  `accion` varchar(255) NOT NULL COMMENT 'Ej: suspendió_usuario, eliminó_vacante',
  `entidad_afectada` varchar(100) COMMENT 'usuarios, vacantes',
  `id_entidad` integer,
  `detalles` json,
  `fecha` timestamp DEFAULT (now())
);

CREATE UNIQUE INDEX `empresa_usuarios_index_0` ON `empresa_usuarios` (`id_empresa`, `id_usuario`);

CREATE UNIQUE INDEX `universidad_usuarios_index_1` ON `universidad_usuarios` (`id_universidad`, `id_usuario`);

CREATE UNIQUE INDEX `candidato_habilidades_index_2` ON `candidato_habilidades` (`id_candidato`, `id_habilidad`);

CREATE UNIQUE INDEX `candidato_idiomas_index_3` ON `candidato_idiomas` (`id_candidato`, `id_idioma`);

CREATE UNIQUE INDEX `empresa_escuela_index_4` ON `empresa_escuela` (`id_empresa`, `id_escuela`);

CREATE UNIQUE INDEX `universidad_niveles_index_5` ON `universidad_niveles` (`id_universidad`, `id_nivel`);

CREATE UNIQUE INDEX `universidad_areas_index_6` ON `universidad_areas` (`id_universidad`, `id_area`);

CREATE UNIQUE INDEX `universidad_modalidades_index_7` ON `universidad_modalidades` (`id_universidad`, `id_modalidad`);

CREATE UNIQUE INDEX `vacante_modalidades_index_8` ON `vacante_modalidades` (`id_vacante`, `id_modalidad_laboral`);

CREATE UNIQUE INDEX `vacante_jornadas_index_9` ON `vacante_jornadas` (`id_vacante`, `id_jornada`);

ALTER TABLE `universidad_niveles` ADD FOREIGN KEY (`id_universidad`) REFERENCES `universidades` (`id_universidad`);

ALTER TABLE `universidad_niveles` ADD FOREIGN KEY (`id_nivel`) REFERENCES `cat_niveles_educativos` (`id_nivel`);

ALTER TABLE `universidad_areas` ADD FOREIGN KEY (`id_universidad`) REFERENCES `universidades` (`id_universidad`);

ALTER TABLE `universidad_areas` ADD FOREIGN KEY (`id_area`) REFERENCES `cat_areas_estudio` (`id_area`);

ALTER TABLE `universidad_modalidades` ADD FOREIGN KEY (`id_universidad`) REFERENCES `universidades` (`id_universidad`);

ALTER TABLE `universidad_modalidades` ADD FOREIGN KEY (`id_modalidad`) REFERENCES `cat_modalidades_estudio` (`id_modalidad`);

ALTER TABLE `documentos_institucionales` ADD FOREIGN KEY (`id_universidad`) REFERENCES `universidades` (`id_universidad`);

ALTER TABLE `documentos_institucionales` ADD FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`);

ALTER TABLE `vacante_modalidades` ADD FOREIGN KEY (`id_vacante`) REFERENCES `vacantes` (`id_vacante`);

ALTER TABLE `vacante_modalidades` ADD FOREIGN KEY (`id_modalidad_laboral`) REFERENCES `cat_modalidades_laborales` (`id_modalidad_laboral`);

ALTER TABLE `vacante_jornadas` ADD FOREIGN KEY (`id_vacante`) REFERENCES `vacantes` (`id_vacante`);

ALTER TABLE `vacante_jornadas` ADD FOREIGN KEY (`id_jornada`) REFERENCES `cat_jornadas_laborales` (`id_jornada`);

ALTER TABLE `candidatos` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `administrativos` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `universidades` ADD FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`);

ALTER TABLE `empresa_usuarios` ADD FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`);

ALTER TABLE `empresa_usuarios` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `universidad_usuarios` ADD FOREIGN KEY (`id_universidad`) REFERENCES `universidades` (`id_universidad`);

ALTER TABLE `universidad_usuarios` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `administrativos` ADD FOREIGN KEY (`id_rol`) REFERENCES `roles_admin` (`id_rol`);

ALTER TABLE `empresas` ADD FOREIGN KEY (`id_sector`) REFERENCES `sectores_empresa` (`id_sector`);

ALTER TABLE `empresas` ADD FOREIGN KEY (`id_tamano`) REFERENCES `tamanos_empresa` (`id_tamano`);

ALTER TABLE `experiencia_laboral` ADD FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`);

ALTER TABLE `formacion_academica` ADD FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`);

ALTER TABLE `documentos` ADD FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`);

ALTER TABLE `formacion_academica` ADD FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`);

ALTER TABLE `formacion_academica` ADD FOREIGN KEY (`id_carrera`) REFERENCES `carreras_escuela` (`id_carrera`);

ALTER TABLE `carreras_escuela` ADD FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`);

ALTER TABLE `documentos` ADD FOREIGN KEY (`id_tipo`) REFERENCES `tipos_documento` (`id_tipo`);

ALTER TABLE `candidato_habilidades` ADD FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`);

ALTER TABLE `candidato_habilidades` ADD FOREIGN KEY (`id_habilidad`) REFERENCES `habilidades` (`id_habilidad`);

ALTER TABLE `candidato_idiomas` ADD FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`);

ALTER TABLE `candidato_idiomas` ADD FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id_idioma`);

ALTER TABLE `empresa_escuela` ADD FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`);

ALTER TABLE `empresa_escuela` ADD FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id_escuela`);

ALTER TABLE `eventos` ADD FOREIGN KEY (`id_admin_creador`) REFERENCES `administrativos` (`id_admin`);

ALTER TABLE `eventos` ADD FOREIGN KEY (`id_usuario_universidad_creador`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `audit_log_admin` ADD FOREIGN KEY (`id_admin`) REFERENCES `administrativos` (`id_admin`);

ALTER TABLE `vacantes` ADD FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`);

ALTER TABLE `vacantes` ADD FOREIGN KEY (`id_estatus`) REFERENCES `estatus_vacante` (`id_estatus`);

ALTER TABLE `vacantes` ADD FOREIGN KEY (`id_usuario_creador`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `postulaciones` ADD FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`);

ALTER TABLE `postulaciones` ADD FOREIGN KEY (`id_vacante`) REFERENCES `vacantes` (`id_vacante`);

ALTER TABLE `postulaciones` ADD FOREIGN KEY (`id_estatus_postulacion`) REFERENCES `estatus_postulacion` (`id_estatus_postulacion`);

ALTER TABLE `etapas_proceso` ADD FOREIGN KEY (`id_postulacion`) REFERENCES `postulaciones` (`id_postulacion`);

ALTER TABLE `etapas_proceso` ADD FOREIGN KEY (`id_tipo_etapa`) REFERENCES `tipos_etapa` (`id_tipo_etapa`);

ALTER TABLE `etapas_proceso` ADD FOREIGN KEY (`id_estatus_etapa`) REFERENCES `estatus_etapa` (`id_estatus_etapa`);

ALTER TABLE `seguimientos_postulacion` ADD FOREIGN KEY (`id_postulacion`) REFERENCES `postulaciones` (`id_postulacion`);

ALTER TABLE `seguimientos_postulacion` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `candidatos` ADD FOREIGN KEY (`id_candidato`) REFERENCES `mensajes` (`id_remitente`);
