/**
 * Utilidades para encriptación y comparación de contraseñas
 */

import bcrypt from "bcrypt";

const RONDAS_SALT = 10;

/**
 * Encriptar contraseña
 * @param {string} contraseña - Contraseña en texto plano
 * @returns {Promise<string>} Contraseña encriptada
 */
export const encriptarContraseña = async (contraseña) => {
  try {
    return await bcrypt.hash(contraseña, RONDAS_SALT);
  } catch (error) {
    throw new Error("Error al encriptar contraseña");
  }
};

/**
 * Comparar contraseña con su versión encriptada
 * @param {string} contraseña - Contraseña en texto plano
 * @param {string} contraseñaEncriptada - Contraseña encriptada
 * @returns {Promise<boolean>} true si coinciden, false si no
 */
export const compararContraseña = async (contraseña, contraseñaEncriptada) => {
  try {
    return await bcrypt.compare(contraseña, contraseñaEncriptada);
  } catch (error) {
    throw new Error("Error al comparar contraseña");
  }
};
