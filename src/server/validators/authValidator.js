/**
 * Validadores para autenticación y registro
 */

/**
 * Validar formato de email
 * @param {string} email - Email a validar
 * @returns {boolean}
 */
export const esEmailValido = (email) => {
  const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regexEmail.test(email);
};

/**
 * Validar fortaleza de contraseña
 * Requisitos: mínimo 8 caracteres, 1 mayúscula, 1 número
 * @param {string} contraseña - Contraseña a validar
 * @returns {boolean}
 */
export const esContraseñaValida = (contraseña) => {
  return (
    contrasena.length >= 8 &&
    /[A-Z]/.test(contraseña) &&
    /[0-9]/.test(contraseña)
  );
};

/**
 * Validar formato de nombre de usuario
 * Requisitos: 3-20 caracteres, solo alfanuméricos y guiones
 * @param {string} nombreUsuario - Nombre de usuario a validar
 * @returns {boolean}
 */
export const esNombreUsuarioValido = (nombreUsuario) => {
  const regexNombreUsuario = /^[a-zA-Z0-9_-]{3,20}$/;
  return regexNombreUsuario.test(nombreUsuario);
};

/**
 * Validar datos de registro
 * @param {object} datos - { email, nombreUsuario, contrasena, confirmacionContrasena }
 * @returns {object} Datos validados
 * @throws {Error} Si la validación falla
 */
export const validarDatosRegistro = (datos) => {
  const { email, nombreUsuario, contraseña, confirmacionContraseña } = datos;

  if (!email || !nombreUsuario || !contraseña) {
    throw new Error("Email, nombre de usuario y contraseña son obligatorios");
  }

  if (!esEmailValido(email)) {
    throw new Error("El formato del email no es válido");
  }

  if (!esNombreUsuarioValido(nombreUsuario)) {
    throw new Error(
      "El nombre de usuario debe tener 3-20 caracteres, solo alfanuméricos y guiones"
    );
  }

  if (!esContraseniaValida(contraseña)) {
    throw new Error(
      "La contraseña debe tener mínimo 8 caracteres, 1 mayúscula y 1 número"
    );
  }

  if (contrasena !== confirmacionContraseña) {
    throw new Error("Las contraseñas no coinciden");
  }

  return { email, nombreUsuario, contraseña };
};

/**
 * Validar datos de login
 * @param {object} datos - { email, contrasena }
 * @returns {object} Datos validados
 * @throws {Error} Si la validación falla
 */
export const validarDatosLogin = (datos) => {
  const { email, contraseña } = datos;

  if (!email || !contraseña) {
    throw new Error("Email y contraseña son obligatorios");
  }

  if (!esEmailValido(email)) {
    throw new Error("El formato del email no es válido");
  }

  return { email, contraseña };
};

/**
 * Sanitizar entrada de texto (remover espacios y limitar longitud)
 * @param {string} texto - Texto a sanitizar
 * @returns {string} Texto sanitizado
 */
export const sanitizarTexto = (texto) => {
  if (typeof texto !== "string") return "";
  return texto.trim().slice(0, 255);
};
