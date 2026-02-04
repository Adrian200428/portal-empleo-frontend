/**
 * 
 * Constantes de errores y códigos HTTP, Su 
 * propósito principal es organizar y 
 * estandarizar la forma en que tu aplicación maneja las respuestas y los errores.
 */

export const ERRORES_API = {
  CREDENCIALES_INVALIDAS: "Email o contraseña incorrectos",
  EMAIL_EXISTENTE: "El correo electrónico ya está registrado",
  USUARIO_EXISTENTE: "El nombre de usuario ya está en uso",
  USUARIO_NO_ENCONTRADO: "Usuario no encontrado",
  NO_AUTORIZADO: "Acceso no autorizado",
  PROHIBIDO: "Acceso prohibido",
  ERROR_VALIDACION: "Error de validación",
  ERROR_SERVIDOR: "Error interno del servidor",
  JSON_INVALIDO: "JSON no válido",
  CAMPOS_FALTANTES: "Faltan campos obligatorios",
};

export const ESTADO_HTTP = {
  OK: 200,
  CREADO: 201,
  SOLICITUD_INCORRECTA: 400,
  NO_AUTORIZADO: 401,
  PROHIBIDO: 403,
  NO_ENCONTRADO: 404,
  CONFLICTO: 409,
  ERROR_SERVIDOR: 500,
};