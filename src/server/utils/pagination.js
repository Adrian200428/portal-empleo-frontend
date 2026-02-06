/**
 * Utilidades para paginación eficiente
 */

/**
 * Calcular parámetros de paginación
 * @param {number} pagina - Número de página solicitada
 * @param {number} limite - Registros por página
 * @param {number} limiteMax - Límite máximo de registros (default: 50)
 * @returns {object} { pagina, limite, offset }
 */
export const obtenerParametrosPaginacion = (pagina = 1, limite = 10, limiteMax = 50) => {
  const paginaNum = Math.max(1, parseInt(pagina) || 1);
  const limiteNum = Math.min(limiteMax, Math.max(1, parseInt(limite) || 10));
  const offset = (paginaNum - 1) * limiteNum;

  return {
    pagina: paginaNum,
    limite: limiteNum,
    offset,
  };
};

/**
 * Construir metadatos de paginación
 * @param {number} total - Total de registros
 * @param {number} pagina - Página actual
 * @param {number} limite - Registros por página
 * @returns {object} Metadatos de paginación
 */
export const construirMetadatosPaginacion = (total, pagina, limite) => {
  const paginas = Math.ceil(total / limite);
  return {
    total,
    pagina,
    limite,
    paginas,
    tieneSiguiente: pagina < paginas,
    tieneAnterior: pagina > 1,
  };
};
