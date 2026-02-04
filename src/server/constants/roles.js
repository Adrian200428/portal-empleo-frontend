/**
 * Constantes de roles de usuario, Controla quién tiene permiso para hacer qué por Seguridad.
 */

export const USER_ROLES = {
  POSTULANTE: "POSTULANTE",
  EMPRESA: "EMPRESA",
  UNIVERSIDAD: "UNIVERSIDAD",
  ADMIN: "ADMIN",
};

export const VALID_ROLES = Object.values(USER_ROLES);

export const ROLE_NAMES = {
  POSTULANTE: "Postulante",
  EMPRESA: "Empresa",
  UNIVERSIDAD: "Universidad",
  ADMIN: "Administrador",
};

export const ROLE_DESCRIPTIONS = {
  POSTULANTE: "Candidato buscando empleo",
  EMPRESA: "Empleador publicando ofertas",
  UNIVERSIDAD: "Institución educativa",
  ADMIN: "Administrador del sistema",
};
