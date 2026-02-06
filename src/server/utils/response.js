/**
 * response.js
 * Respuestas HTTP estandarizadas para toda la API
 */

import { NextResponse } from "next/server";
import { ESTADO_HTTP } from "@/server/constants/errores.js";

/**
 * Respuesta exitosa estandarizada
 * @param {any} data - Datos a devolver
 * @param {string} mensaje - Mensaje opcional
 * @param {number} estado - Código HTTP (default: 200)
 */
export const respuestaExitosa = (data, mensaje = null, estado = ESTADO_HTTP.OK) => {
  return NextResponse.json(
    {
      exito: true,
      datos: data,
      ...(mensaje && { mensaje }),
    },
    { status: estado }
  );
};

/**
 * Respuesta de error estandarizada
 * @param {string|Error} error - Mensaje de error
 * @param {number} estado - Código HTTP (default: 500)
 */
export const respuestaError = (error, estado = ESTADO_HTTP.ERROR_SERVIDOR) => {
  return NextResponse.json(
    {
      exito: false,
      error: typeof error === "string" ? error : error.message,
    },
    { status: estado }
  );
};

/**
 * Respuesta paginada estandarizada
 * @param {array} datos - Array de datos
 * @param {object} paginacion - Objeto con información de paginación
 */
export const respuestaPaginada = (datos, paginacion) => {
  return NextResponse.json(
    {
      exito: true,
      datos,
      paginacion,
    },
    { status: ESTADO_HTTP.OK }
  );
};

/**
 * Respuesta de recurso creado
 * @param {any} datos - Datos del recurso creado
 * @param {string} mensaje - Mensaje de éxito
 */
export const respuestaCreado = (datos, mensaje = "Creado exitosamente") => {
  return respuestaExitosa(datos, mensaje, ESTADO_HTTP.CREADO);
};
