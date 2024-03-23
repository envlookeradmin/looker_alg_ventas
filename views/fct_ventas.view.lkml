view: ventas {

  derived_table: {
    sql:
      SELECT
      ID_Fuente,
      Documento,
      Posicion,
      Tipo_Transaccion,
      Tipo_Documento,
      Fecha,
      Canal_Distribucion,
      Material,
      Planta,
      Cliente,
      Destinatario,
      Organizacion_Ventas,
      Division,
      Unidad_Base,

      Categoria,
      SubCategoria,
      Moneda_Transaccion,
      Cantidad,
      Monto AS Monto_Transaccion,
      0 AS Monto_Transaccion_MTD,
      0 AS Monto_Transaccion_MTD_LY,
      0 AS Monto_Transaccion_YTD,
      0 AS Monto_Transaccion_YTD_LY,
      0 AS Monto_Transaccion_Bud_MTD,
      0 AS Monto_Transaccion_Bud_MTD_LY,
      0 AS Monto_Transaccion_Bud_YTD,
      0 AS Monto_Transaccion_Bud_YTD_LY,

      Tipo_Cambio_MXN,
      Monto_Conversion_MXN,
      '' AS FCURR,
      0 AS UKURS,
      0 AS UKURS_MTD,
      0 AS UKURS_MTD_LY,
      0 AS UKURS_YTD,
      0 AS UKURS_YTD_LY,
      0 AS UKURS_BUD_MTD,
      0 AS UKURS_BUD_MTD_LY,
      0 AS UKURS_BUD_YTD,
      0 AS UKURS_BUD_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Fact_Ventas`
      WHERE Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND Fecha <= CAST({% date_start date_filter %} AS DATE)
      UNION ALL

      --CARGA TOTAL MXN México
      SELECT
      v.ID_Fuente,
      '' AS Documento,
      '' AS Posicion,
      v.Tipo_Transaccion,
      '' AS Tipo_Documento,
      v.Fecha,
      v.Canal_Distribucion,
      '' AS Material,
      v.Planta,
      '' AS Cliente,
      '' AS Destinatario,
      '' AS Organizacion_Ventas,
      '' AS Division,
      '' AS Unidad_Base,
      'TOTAL MXN' AS Categoria,
      '' AS SubCategoria,
      '' AS Moneda_Transaccion,
      0 AS Cantidad,
      SUM(v.Monto) AS Monto_Transaccion,
      SUM(v.Monto) AS Monto_Transaccion_MTD,
      SUM(v.Monto) AS Monto_Transaccion_MTD_LY,
      SUM(v.Monto) AS Monto_Transaccion_YTD,
      SUM(v.Monto) AS Monto_Transaccion_YTD_LY,
      SUM(v.Monto) AS Monto_Transaccion_Bud_MTD,
      SUM(v.Monto) AS Monto_Transaccion_Bud_MTD_LY,
      SUM(v.Monto) AS Monto_Transaccion_Bud_YTD,
      SUM(v.Monto) AS Monto_Transaccion_Bud_YTD_LY,

      0 Tipo_Cambio_MXN,
      0 Monto_Conversion_MXN,
      '' AS FCURR,
      0 AS UKURS,
      0 AS UKURS_MTD,
      0 AS UKURS_MTD_LY,
      0 AS UKURS_YTD,
      0 AS UKURS_YTD_LY,
      0 AS UKURS_BUD_MTD,
      0 AS UKURS_BUD_MTD_LY,
      0 AS UKURS_BUD_YTD,
      0 AS UKURS_BUD_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Fact_Ventas` v
      WHERE v.Organizacion_Ventas IN ("MXF1", "MXFC")
      AND v.Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND v.Fecha <= CAST({% date_start date_filter %} AS DATE)
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,28,29,30,31,32,33,34,35,36,37,38,39
      UNION ALL

      --CARGA TOTAL MXN que no es México
      SELECT
      v.ID_Fuente,
      '' AS Documento,
      '' AS Posicion,
      v.Tipo_Transaccion,
      '' AS Tipo_Documento,
      v.Fecha,
      v.Canal_Distribucion,
      '' AS Material,
      v.Planta,
      '' AS Cliente,
      '' AS Destinatario,
      '' AS Organizacion_Ventas,
      '' AS Division,
      '' AS Unidad_Base,
      'TOTAL MXN' AS Categoria,
      '' AS SubCategoria,
      '' AS Moneda_Transaccion,
      0 AS Cantidad,
      SUM( CASE
      WHEN t.UKURS IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS
      END ) AS Monto_Transaccion,

      SUM( CASE
      WHEN t.UKURS_MTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_MTD
      END ) AS Monto_Transaccion_MTD,

      SUM( CASE
      WHEN t.UKURS_MTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_MTD_LY
      END ) AS Monto_Transaccion_MTD_LY,

      SUM( CASE
      WHEN t.UKURS_YTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_YTD
      END ) AS Monto_Transaccion_YTD,

      SUM( CASE
      WHEN t.UKURS_YTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_YTD_LY
      END ) AS Monto_Transaccion_YTD_LY,

      SUM( CASE
      WHEN t.UKURS_BUD_MTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_MTD
      END ) AS Monto_Transaccion_Bud_MTD,

      SUM( CASE
      WHEN t.UKURS_BUD_MTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_MTD_LY
      END ) AS Monto_Transaccion_Bud_MTD_LY,

      SUM( CASE
      WHEN t.UKURS_BUD_YTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_YTD
      END ) AS Monto_Transaccion_Bud_YTD,

      SUM( CASE
      WHEN t.UKURS_BUD_YTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_YTD_LY
      END ) AS Monto_Transaccion_Bud_YTD_LY,

      0 Tipo_Cambio_MXN,
      0 Monto_Conversion_MXN,
      t.Moneda_Origen AS FCURR,
      t.UKURS,
      t.UKURS_MTD,
      t.UKURS_MTD_LY,
      t.UKURS_YTD,
      t.UKURS_YTD_LY,
      t.UKURS_BUD_MTD,
      t.UKURS_BUD_MTD_LY,
      t.UKURS_BUD_YTD,
      t.UKURS_BUD_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Fact_Ventas` v left join (

      SELECT
      --ID_Fuente,
      CAST({% date_start date_filter %} AS DATE) as Fecha,
      Moneda_Origen,
      Moneda_Conversion,

      MAX(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST({% date_start date_filter %} AS DATE)
      AND Fecha <= CAST({% date_start date_filter %} AS DATE)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD_LY,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD_LY,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_MTD,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_MTD_LY,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_YTD,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_YTD_LY

      FROM `envases-analytics-qa.RPT_ALG.Dim_Divisas`
      where Moneda_Origen IN ('USD', 'EUR', 'DKK', 'GTQ', 'CAD')
      AND Moneda_Conversion IN ('MXN')
      GROUP BY 1,2,3
      ) t on v.Fecha = t.Fecha and v.Moneda_Transaccion = t.Moneda_Origen
      WHERE v.Organizacion_Ventas NOT IN ("MXF1", "MXFC")
      AND v.Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND v.Fecha <= CAST({% date_start date_filter %} AS DATE)
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,28,29,30,31,32,33,34,35,36,37,38,39

      --CARGA TOTAL USD
      UNION ALL
      SELECT
      v.ID_Fuente,
      '' AS Documento,
      '' AS Posicion,
      v.Tipo_Transaccion,
      '' AS Tipo_Documento,
      v.Fecha,
      v.Canal_Distribucion,
      '' AS Material,
      v.Planta,
      '' AS Cliente,
      '' AS Destinatario,
      '' AS Organizacion_Ventas,
      '' AS Division,
      '' AS Unidad_Base,
      'TOTAL USD' AS Categoria,
      '' AS SubCategoria,
      '' AS Moneda_Transaccion,
      0 AS Cantidad,
      SUM( CASE
      WHEN t.UKURS IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS
      END ) AS Monto_Transaccion,

      SUM( CASE
      WHEN t.UKURS_MTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_MTD
      END ) AS Monto_Transaccion_MTD,

      SUM( CASE
      WHEN t.UKURS_MTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_MTD_LY
      END ) AS Monto_Transaccion_MTD_LY,

      SUM( CASE
      WHEN t.UKURS_YTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_YTD
      END ) AS Monto_Transaccion_YTD,

      SUM( CASE
      WHEN t.UKURS_YTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_YTD_LY
      END ) AS Monto_Transaccion_YTD_LY,

      SUM( CASE
      WHEN t.UKURS_BUD_MTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_MTD
      END ) AS Monto_Transaccion_Bud_MTD,

      SUM( CASE
      WHEN t.UKURS_BUD_MTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_MTD_LY
      END ) AS Monto_Transaccion_Bud_MTD_LY,

      SUM( CASE
      WHEN t.UKURS_BUD_YTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_YTD
      END ) AS Monto_Transaccion_Bud_YTD,

      SUM( CASE
      WHEN t.UKURS_BUD_YTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_YTD_LY
      END ) AS Monto_Transaccion_Bud_YTD_LY,

      0 Tipo_Cambio_MXN,
      0 Monto_Conversion_MXN,
      '' AS FCURR,
      0 AS UKURS,
      0 AS UKURS_MTD,
      0 AS UKURS_MTD_LY,
      0 AS UKURS_YTD,
      0 AS UKURS_YTD_LY,
      0 AS UKURS_BUD_MTD,
      0 AS UKURS_BUD_MTD_LY,
      0 AS UKURS_BUD_YTD,
      0 AS UKURS_BUD_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Fact_Ventas` v left join (

      SELECT
      --ID_Fuente,
      CAST({% date_start date_filter %} AS DATE) as Fecha,
      Moneda_Origen,
      Moneda_Conversion,

      MAX(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST({% date_start date_filter %} AS DATE)
      AND Fecha <= CAST({% date_start date_filter %} AS DATE)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD_LY,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD_LY,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_MTD,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_MTD_LY,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_YTD,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_YTD_LY

      FROM `envases-analytics-qa.RPT_ALG.Dim_Divisas`
      where Moneda_Origen IN ('MXN', 'EUR', 'DKK', 'GTQ', 'CAD')
      AND Moneda_Conversion IN ('USD')
      GROUP BY 1,2,3
      ) t on v.Fecha = t.Fecha and v.Moneda_Transaccion = t.Moneda_Origen
      WHERE v.Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND v.Fecha <= CAST({% date_start date_filter %} AS DATE)
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,28,29,30,31,32,33,34,35,36,37,38,39
      UNION ALL

      --CARGA TOTAL EUR
      SELECT
      v.ID_Fuente,
      '' AS Documento,
      '' AS Posicion,
      v.Tipo_Transaccion,
      '' AS Tipo_Documento,
      v.Fecha,
      v.Canal_Distribucion,
      '' AS Material,
      v.Planta,
      '' AS Cliente,
      '' AS Destinatario,
      '' AS Organizacion_Ventas,
      '' AS Division,
      '' AS Unidad_Base,
      'TOTAL EUR' AS Categoria,
      '' AS SubCategoria,
      '' AS Moneda_Transaccion,
      0 AS Cantidad,
      SUM( CASE
      WHEN t.UKURS IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS
      END ) AS Monto_Transaccion,

      SUM( CASE
      WHEN t.UKURS_MTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_MTD
      END ) AS Monto_Transaccion_MTD,

      SUM( CASE
      WHEN t.UKURS_MTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_MTD_LY
      END ) AS Monto_Transaccion_MTD_LY,

      SUM( CASE
      WHEN t.UKURS_YTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_YTD
      END ) AS Monto_Transaccion_YTD,

      SUM( CASE
      WHEN t.UKURS_YTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_YTD_LY
      END ) AS Monto_Transaccion_YTD_LY,

      SUM( CASE
      WHEN t.UKURS_BUD_MTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_MTD
      END ) AS Monto_Transaccion_Bud_MTD,

      SUM( CASE
      WHEN t.UKURS_BUD_MTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_MTD_LY
      END ) AS Monto_Transaccion_Bud_MTD_LY,

      SUM( CASE
      WHEN t.UKURS_BUD_YTD IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_YTD
      END ) AS Monto_Transaccion_Bud_YTD,

      SUM( CASE
      WHEN t.UKURS_BUD_YTD_LY IS NULL
      THEN v.Monto
      ELSE v.Monto * t.UKURS_BUD_YTD_LY
      END ) AS Monto_Transaccion_Bud_YTD_LY,

      0 Tipo_Cambio_MXN,
      0 Monto_Conversion_MXN,
      '' AS FCURR,
      0 AS UKURS,
      0 AS UKURS_MTD,
      0 AS UKURS_MTD_LY,
      0 AS UKURS_YTD,
      0 AS UKURS_YTD_LY,
      0 AS UKURS_BUD_MTD,
      0 AS UKURS_BUD_MTD_LY,
      0 AS UKURS_BUD_YTD,
      0 AS UKURS_BUD_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Fact_Ventas` v left join (

      SELECT
      --ID_Fuente,
      CAST({% date_start date_filter %} AS DATE) as Fecha,
      Moneda_Origen,
      Moneda_Conversion,

      MAX(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST({% date_start date_filter %} AS DATE)
      AND Fecha <= CAST({% date_start date_filter %} AS DATE)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD_LY,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD_LY,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_MTD,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_MTD_LY,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_YTD,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_BUD_YTD_LY

      FROM `envases-analytics-qa.RPT_ALG.Dim_Divisas`
      where Moneda_Origen IN ('MXN', 'USD', 'DKK', 'GTQ', 'CAD')
      AND Moneda_Conversion IN ('EUR')
      GROUP BY 1,2,3
      ) t on v.Fecha = t.Fecha and v.Moneda_Transaccion = t.Moneda_Origen
      WHERE v.Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND v.Fecha <= CAST({% date_start date_filter %} AS DATE)
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,28,29,30,31,32,33,34,35,36,37,38,39
      ;;
  }

  dimension: id_fuente {
    hidden: yes
    type: string
    sql: ${TABLE}.ID_Fuente ;;
  }

  dimension: documento {
    hidden: yes
    type: string
    sql: ${TABLE}.Documento ;;
  }

  dimension: posicion {
    hidden: yes
    type: string
    sql: ${TABLE}.Posicion ;;
  }

  dimension: tipo_transaccion {
    type: string
    sql: ${TABLE}.Tipo_Transaccion ;;
  }

  dimension: tipo_documento {
    hidden: yes
    type: string
    sql: ${TABLE}.Tipo_Documento ;;
  }

  dimension: fecha {
    hidden: yes
    type: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: codigo_canal_distribucion {
    hidden: yes
    type: string
    sql: ${TABLE}.Canal_Distribucion ;;
  }

  dimension: canal_distribucion {
    type: string
    sql: CASE
          WHEN ${TABLE}.Canal_Distribucion IN ('00','10','50') THEN 'Nacional'
          ELSE 'Exportacion'
          END ;;
  }

  dimension: codigo_material {
    hidden: yes
    type: string
    sql: ${TABLE}.Material ;;
  }

  dimension: id_planta {
    hidden: yes
    type: string
    sql: ${TABLE}.Planta ;;
  }

  dimension: codigo_cliente {
    hidden: yes
    type: string
    sql: ${TABLE}.Cliente ;;
  }

  dimension: destinatario {
    hidden: yes
    type: string
    sql: ${TABLE}.Destinatario ;;
  }

  dimension: organizacion_ventas {
    type: string
    sql: ${TABLE}.Organizacion_Ventas ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.Division ;;
  }

  dimension: unidad_base {
    type: string
    sql: ${TABLE}.Unidad_Base ;;
  }

  dimension: categoria {
    label: "CATEGORY"
    type: string
    sql: ${TABLE}.Categoria ;;

    html: {% if value == 'TOTAL LOCAL CURRENCY USD' or
          value == 'TOTAL LOCAL CURRENCY DKK' or
          value == 'TOTAL LOCAL CURRENCY EUR' or
          value == 'TOTAL LOCAL CURRENCY GTQ' or
          value == 'TOTAL LOCAL CURRENCY CAD' or
          value == 'TOTAL MXN' or
          value == 'TOTAL USD' or
          value == 'TOTAL EUR'
          %}
        <p style="color: white; background-color: #5e2129; font-size:100%; text-align:left">{{ rendered_value }}</p>

      {% elsif
      value != 'CP 19L' and
      value != 'CP 15L' and
      value != 'CP 10L' and
      value != 'CP 08L' and
      value != 'CP 04L' and

      value != 'Club (Alu)' and
      value != 'Club (Steel)' and
      value != 'Hansa' and
      value != 'Dingley' and
      value != 'Round Fish' and
      value != 'Fish - Other' and
      value != 'Draught Kegs' and
      value != 'Gravity Kegs' and
      value != 'Beverage Miscellaneous' and
      value != 'Tin Cans' and
      value != 'Vacuum Ink' and
      value != 'Pails' and
      value != 'Hobbocks' and
      value != 'Square' and
      value != 'Miscellaneous' and
      value != 'Plastic' and
      value != 'Industrial - Others' and

      value != 'Fish - 1/2 Oval' and
      value != 'Fish - 1/4 Oval' and
      value != 'Fish - 127' and
      value != 'Fish - 150' and
      value != 'Fish - 153' and
      value != 'Fish - 65' and
      value != 'Fish - 73' and
      value != 'Fish - 83' and
      value != 'Fish - 99' and
      value != 'Fish - Anchoas' and
      value != 'Fish - Club' and
      value != 'Fish - Goods for Resale' and
      value != 'Fish - Others' and
      value != 'Fish - Pails' and
      value != 'Fish - RR90' and

      value != 'Vegetables - 153' and
      value != 'Vegetables - 65' and
      value != 'Vegetables - 73' and
      value != 'Vegetables - 83' and
      value != 'Vegetables - 99' and
      value != 'Vegetables - Club' and
      value != 'Vegetables - Goods for Resale' and
      value != 'Vegetables - Others' and

      value != 'Industrial - 73' and
      value != 'Industrial - 99' and
      value != 'Industrial - General Line' and
      value != 'Industrial - Goods for Resale' and
      value != 'Industrial - Others' and
      value != 'Industrial - Pails' and

      value != 'Print and Coating Services - Goods for Resale' and
      value != 'Print and Coating Services - Others' and
      value != 'Print and Coating Services - Pails'

      %}
      <p style="color: black; font-weight: bold; font-size:100%; text-align:left">{{ rendered_value }}</p>

      {% else %}
      <p style="">{{ rendered_value }}</p>
      {% endif %} ;;

    order_by_field: orden_categoria
  }

  dimension: orden_categoria {
    type: string
    sql:
    case
      when ${planta.cluster} = 'Mexico' then
        case
          when ${TABLE}.Categoria="CP 10L" then "A03"
          when ${TABLE}.Categoria="CP 15L" then "A02"
          when ${TABLE}.Categoria="CP 08L" then "A04"
          when ${TABLE}.Categoria="CP 19L" then "A01"
          when ${TABLE}.Categoria="CP 04L" then "A05"
          when ${TABLE}.Categoria="Cubeta de Plastico" then "A06"
          when ${TABLE}.Categoria="Porron de Plastico" then "A07"
          when ${TABLE}.Categoria="Tambores de Plastico" then "A08"
          when ${TABLE}.Categoria="Bote Bocan" then "A09"
          when ${TABLE}.Categoria="Tambores" then "A10"
          when ${TABLE}.Categoria="Tambores Conicos" then "A11"
          when ${TABLE}.Categoria="Cubeta de Lamina" then "A12"
          when ${TABLE}.Categoria="Alcoholero" then "A13"
          when ${TABLE}.Categoria="Bote de Pintura" then "A14"
          when ${TABLE}.Categoria="Bote de Aerosol" then "A15"
          when ${TABLE}.Categoria="Línea General" then "A16"
          when ${TABLE}.Categoria="Bote Sanitario" then "A17"
          when ${TABLE}.Categoria="Bote Atun" then "A18"
          when ${TABLE}.Categoria="Bote Oval" then "A19"
          when ${TABLE}.Categoria="Tapa Easy Open" then "A20"
          when ${TABLE}.Categoria="Fondo Charola y Bafle" then "A21"
          when ${TABLE}.Categoria="Tapa Twiss Off" then "A22"
          when ${TABLE}.Categoria="Varios" then "A23"
          when ${TABLE}.Categoria="Fish." then "A24"
          when ${TABLE}.Categoria="PeelOff" then "A25"

          when ${TABLE}.Categoria="Coating and Printing Services" then "A26"
          when ${TABLE}.Categoria="Miscelaneous" then "A27"
          when ${TABLE}.Categoria="Pails and lids for pails" then "A28"
          when ${TABLE}.Categoria="Tinplate and lids for tinplate" then "A29"

          when ${TABLE}.Categoria="Beverage Draught" then "A30"
          when ${TABLE}.Categoria="Beverage Gravity" then "A31"
          when ${TABLE}.Categoria="Industrial" then "A32"
          when ${TABLE}.Categoria="SC Print" then "A33"

          when ${TABLE}.Categoria="Bote de Aerosol GT" then "A34"
          when ${TABLE}.Categoria="Bote de Pintura GT" then "A35"
          when ${TABLE}.Categoria="Bote Sanitario GT" then "A36"
          when ${TABLE}.Categoria="Varios GT" then "A37"
          when ${TABLE}.Categoria="Cubeta de Lamina GT" then "A38"

          when ${TABLE}.Categoria="Bote Pint. Envases Ohio" then "A39"
          when ${TABLE}.Categoria="Cub.Lam. Envases Ohio" then "A40"
          when ${TABLE}.Categoria="F-style" then "A43"
          when ${TABLE}.Categoria="Varios." then "A44"

          when ${TABLE}.Categoria="Bote Sanitario CA" then "A41"
          when ${TABLE}.Categoria="Tapa Easy Open CA" then "A42"

          when ${TABLE}.Categoria="Food" then "B01"
          when ${TABLE}.Categoria="Fish" then "B02"
          when ${TABLE}.Categoria="Print and Coating Services" then "B03"


          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL MXN" then "Z02"
          else "Z03"
          end

         when ${planta.cluster} = 'USA' then
        case
          when ${TABLE}.Categoria="Bote Pint. Envases Ohio" then "A01"
          when ${TABLE}.Categoria="Cub.Lam. Envases Ohio" then "A02"
          when ${TABLE}.Categoria="F-style" then "A03"
          when ${TABLE}.Categoria="Varios." then "A04"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL USD" then "Z02"
          else "Z03"
        end

        when ${planta.cluster} = 'ECN - North' then

        case
          when ${TABLE}.Categoria="Mediapack" then "a01"
          when ${TABLE}.Categoria="Catering" then "a02"

          when ${TABLE}.Categoria="Club (Alu)" then "a03"
          when ${TABLE}.Categoria="Club (Steel)" then "a04"
          when ${TABLE}.Categoria="Hansa" then "a05"
          when ${TABLE}.Categoria="Dingley" then "a06"
          when ${TABLE}.Categoria="Round Fish" then "a07"
          when ${TABLE}.Categoria="Fish - Other" then "a08"
          when ${TABLE}.Categoria="Fish" then "a09"

          when ${TABLE}.Categoria="Ham" then "a10"
          when ${TABLE}.Categoria="Luncheon" then "a11"
          when ${TABLE}.Categoria="Pullman" then "a12"
          when ${TABLE}.Categoria="Roundfood" then "a13"
          when ${TABLE}.Categoria="Beverage" then "a14"
          when ${TABLE}.Categoria="Cookie" then "a15"
          when ${TABLE}.Categoria="Feta" then "a16"
          when ${TABLE}.Categoria="Milkpowder" then "a17"
          when ${TABLE}.Categoria="PockIt" then "a18"
          when ${TABLE}.Categoria="PeelOff" then "a19"
          when ${TABLE}.Categoria="Super" then "a20"
          when ${TABLE}.Categoria="Cookie" then "a21"
          when ${TABLE}.Categoria="Other" then "a22"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z02"
          else "Z03"
        end

        when ${planta.cluster} = 'ECC - Central' then

        case

          when ${TABLE}.Categoria="Draught Kegs" then "a01"
          when ${TABLE}.Categoria="Gravity Kegs" then "a02"
          when ${TABLE}.Categoria="Beverage Miscellaneous" then "a03"
          when ${TABLE}.Categoria="Beverage" then "a04"

          when ${TABLE}.Categoria="Tin Cans" then "a05"
          when ${TABLE}.Categoria="Vacuum Ink" then "a06"
          when ${TABLE}.Categoria="Pails" then "a07"
          when ${TABLE}.Categoria="Hobbocks" then "a08"
          when ${TABLE}.Categoria="Square" then "a09"
          when ${TABLE}.Categoria="Miscellaneous" then "a10"
          when ${TABLE}.Categoria="Plastic" then "a11"
          when ${TABLE}.Categoria="Industrial - Others" then "a12"
          when ${TABLE}.Categoria="Industrial" then "a13"
          when ${TABLE}.Categoria="SC Print" then "a14"

          when ${TABLE}.Categoria="Draught - Cans" then "a01"
          when ${TABLE}.Categoria="Draught - Miscellaneous" then "a02"
          when ${TABLE}.Categoria="Beverage Draught" then "a03"
          when ${TABLE}.Categoria="Gravity - Cans" then "a04"
          when ${TABLE}.Categoria="Gravity - Miscellaneous" then "a05"
          when ${TABLE}.Categoria="Beverage Gravity" then "a06"
          when ${TABLE}.Categoria="Tin Cans" then "a07"
          when ${TABLE}.Categoria="Cans" then "a08"
          when ${TABLE}.Categoria="Vacuum Ink" then "a09"
          when ${TABLE}.Categoria="Pails" then "a10"
          when ${TABLE}.Categoria="Hobbocks" then "a11"
          when ${TABLE}.Categoria="Square" then "a12"
          when ${TABLE}.Categoria="Miscellaneous" then "a13"
          when ${TABLE}.Categoria="Plastic" then "a14"
          when ${TABLE}.Categoria="Industrial - Others" then "a15"
          when ${TABLE}.Categoria="Industrial" then "a16"
          when ${TABLE}.Categoria="SC Print" then "a17"


          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z02"
          else "Z03"
        end

        when ${planta.cluster} = "ECS - South" then

        case
          when ${TABLE}.Categoria="Fish - 1/2 Oval" then "a01"
          when ${TABLE}.Categoria="Fish - 1/4 Oval" then "a02"
          when ${TABLE}.Categoria="Fish - 127" then "a03"
          when ${TABLE}.Categoria="Fish - 150" then "a04"
          when ${TABLE}.Categoria="Fish - 153" then "a05"
          when ${TABLE}.Categoria="Fish - 65" then "a06"
          when ${TABLE}.Categoria="Fish - 73" then "a07"
          when ${TABLE}.Categoria="Fish - 83" then "a08"
          when ${TABLE}.Categoria="Fish - 99" then "a09"
          when ${TABLE}.Categoria="Fish - Anchoas" then "a10"
          when ${TABLE}.Categoria="Fish - Club" then "a11"
          when ${TABLE}.Categoria="Fish - Goods for Resale" then "a12"
          when ${TABLE}.Categoria="Fish - Others" then "a13"
          when ${TABLE}.Categoria="Fish - Pails" then "a14"
          when ${TABLE}.Categoria="Fish - RR90" then "a15"
          when ${TABLE}.Categoria="Fish" then "a16"

          when ${TABLE}.Categoria="Vegetables - 153" then "a17"
          when ${TABLE}.Categoria="Vegetables - 65" then "a18"
          when ${TABLE}.Categoria="Vegetables - 73" then "a19"
          when ${TABLE}.Categoria="Vegetables - 83" then "a20"
          when ${TABLE}.Categoria="Vegetables - 99" then "a21"
          when ${TABLE}.Categoria="Vegetables - Club" then "a22"
          when ${TABLE}.Categoria="Vegetables - Goods for Resale" then "a23"
          when ${TABLE}.Categoria="Vegetables - Others" then "a24"
          when ${TABLE}.Categoria="Vegetables" then "a25"

          when ${TABLE}.Categoria="Industrial - 73" then "a26"
          when ${TABLE}.Categoria="Industrial - 99" then "a27"
          when ${TABLE}.Categoria="Industrial - General Line" then "a28"
          when ${TABLE}.Categoria="Industrial - Goods for Resale" then "a29"
          when ${TABLE}.Categoria="Industrial - Others" then "a30"
          when ${TABLE}.Categoria="Industrial - Pails" then "a31"
          when ${TABLE}.Categoria="Industrial" then "a32"

          when ${TABLE}.Categoria="Print and Coating Services - Goods for Resale" then "a33"
          when ${TABLE}.Categoria="Print and Coating Services - Others" then "a34"
          when ${TABLE}.Categoria="Print and Coating Services - Pails" then "a35"
          when ${TABLE}.Categoria="Print and Coating Services" then "a36"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z02"
          else "Z03"
        end

        when ${planta.cluster} = "ECW - West" then

        case
          when ${TABLE}.Categoria="Coating and Printing Services" then "a01"
          when ${TABLE}.Categoria="Tin cans and closures for tin cans" then "a02"
          when ${TABLE}.Categoria="Vegetables" then "a03"
          when ${TABLE}.Categoria="Industrial" then "a04"
          when ${TABLE}.Categoria="Miscelaneous" then "a05"
          when ${TABLE}.Categoria="Pails and lids for pails" then "a06"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z02"
          else "Z03"
        end

      when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
      when ${TABLE}.Categoria="TOTAL MXN" then "Z02"
      when ${TABLE}.Categoria="TOTAL USD" then "Z03"
      when ${TABLE}.Categoria="TOTAL EUR" then "Z04"

    end
    ;;
  }

  dimension: subcategoria {
    label: "SUBCATEGORY"
    type: string
    sql: ${TABLE}.SubCategoria ;;
  }

  dimension: moneda_transaccion {
    type: string
    sql: ${TABLE}.Moneda_Transaccion ;;
  }

  #dimension: UKURS {
  #  type: number
  #  sql: ${TABLE}.UKURS ;;
  #  value_format: "#,##0.00"
  #}

  dimension: FCURR {
    label: "CURRENCY TYPE"
    type: string
    sql: ${TABLE}.FCURR ;;
  }

  dimension: cantidad {
    hidden: yes
    type: number
    sql: ${TABLE}.Cantidad /1000 ;;
  }

  dimension: monto_transaccion {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion /1000 ;;
  }

  dimension: monto_transaccion_mtd {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion_MTD /1000 ;;
  }

  dimension: monto_transaccion_mtd_ly {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion_MTD_LY /1000 ;;
  }

  dimension: monto_transaccion_ytd {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion_YTD /1000 ;;
  }

  dimension: monto_transaccion_ytd_ly {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion_YTD_LY /1000 ;;
  }


  dimension: monto_transaccion_bud_mtd {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion_Bud_MTD /1000 ;;
  }

  dimension: monto_transaccion_bud_mtd_ly {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion_Bud_MTD_LY /1000 ;;
  }

  dimension: monto_transaccion_bud_ytd {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion_Bud_YTD /1000 ;;
  }

  dimension: monto_transaccion_bud_ytd_ly {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion_Bud_YTD_LY /1000 ;;
  }


  dimension: tipo_cambio_mxn {
    type: number
    sql: ${TABLE}.Tipo_Cambio_MXN ;;
  }

  dimension: monto_mxn {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Conversion_MXN /1000 ;;
  }

  dimension: fecha_seleccionada {
    label: "Date filter"
    type: string
    sql: CAST({% date_start date_filter %} AS DATE) ;;
  }

  #Atributos de dimensiones

  dimension: nombre_cliente {
    hidden: yes
    type: string
    label: "CLIENT"
    sql: ${cliente.nombre} ;;
  }

  filter: date_filter {
    label: "Date"
    type: date
  }

  filter: tipo_transaccion_vta_nac {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Venta')
         and ${canal_distribucion} in ('Nacional') ;;
  }

  filter: tipo_transaccion_vta_exp {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Venta')
         and ${canal_distribucion} in ('Exportacion') ;;
  }

  filter: tipo_transaccion_pre_nac {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Presupuesto')
         and ${canal_distribucion} in ('Nacional') ;;
  }

  filter: tipo_transaccion_pre_exp {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Presupuesto')
         and ${canal_distribucion} in ('Exportacion') ;;
  }

  #DAY
  filter: filtro_dia {
    hidden: yes
    type: yesno
    sql: ${fecha} = DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -0 DAY);;
  }


  #MTD

  dimension: filtro_mtd{
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;
  }

  dimension: filtro_mtd_ly{
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)  ;;
  }

  #YTD
  dimension: filtro_ytd {
    hidden: yes
    type: yesno
    sql: ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      and  ${fecha} <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)   ;;
  }

  dimension: filtro_ytd_ly {
    hidden: yes
    type: yesno
    sql: ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      and  ${fecha} <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)   ;;
  }

  #metricas

  measure: empty_value1 {
    label: "Empty value 1"
    type: string
    sql: '';;
  }

  measure: empty_value2 {
    label: "Empty value 2"
    type: string
    sql: '';;
  }

  measure: ultima_actualizacion {
    type: date
    label: "Update date"
    sql: MAX(${fecha});;
    convert_tz: no
  }

  measure: tipo_cambio {
    group_label: "Daily"
    label: "EXCHANGE RATE"
    type: max
    sql: ${TABLE}.UKURS;;

    value_format: "#,##0.00"
  }

  measure: daily_sales {
    group_label: "Daily"
    label: "DAILY SALES"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: filtro_dia
      value: "yes"
    }

    filters: [tipo_transaccion: "Venta"]

    drill_fields: [ codigo_cliente,nombre_cliente,daily_sales]

    value_format: "$#,##0.00"
  }

  measure: daily_sales_qty {
    group_label: "Daily"
    label: "DAILY SALES (QTY)"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_dia
      value: "yes"
    }

    filters: [tipo_transaccion: "Venta"]

    drill_fields: [ codigo_cliente,nombre_cliente,daily_sales]

    value_format: "#,##0"
  }


  #MONTHLY-MONEY-MTD

  measure: tipo_cambio_mtd {
    group_label: "Monthly"
    label: "EXCHANGE RATE MTD"
    type: max
    sql: ${TABLE}.UKURS_MTD ;;

    value_format: "#,##0.00"
  }


  measure: tipo_cambio_mtd_ly {
    group_label: "Monthly"
    label: "EXCHANGE RATE MTD LY"
    type: max
    sql: ${TABLE}.UKURS_MTD_LY ;;

    value_format: "#,##0.00"
  }

  measure: tipo_cambio_bud_mtd {
    group_label: "Monthly"
    label: "EXCHANGE RATE BUD MTD"
    type: max
    sql: ${TABLE}.UKURS_BUD_MTD ;;

    value_format: "#,##0.00"
  }

  measure: tipo_cambio_bud_mtd_ly {
    group_label: "Monthly"
    label: "EXCHANGE RATE BUD MTD LY"
    type: max
    sql: ${TABLE}.UKURS_BUD_MTD_LY;;

    value_format: "#,##0.00"
  }

  measure: national_amount_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL AMOUNT MTD"
    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_mtd}
         ELSE ${monto_transaccion} END ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente,national_amount_mtd]

    value_format: "$#,##0.00"
  }

  measure: export_amount_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT AMOUNT MTD"
    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_mtd}
         ELSE ${monto_transaccion} END  ;;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente,export_amount_mtd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_mtd {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD"
    type: number
    sql: ${national_amount_mtd} + ${export_amount_mtd} ;;

    drill_fields: [ codigo_cliente,nombre_cliente,total_amount_mtd]

    value_format: "$#,##0.00"
  }

  measure: total_amount_ {
    group_label: "Monthly"
    label: "TOTAL AMOUNT BY MONTH"
    type:  number
    sql: SUM( CASE WHEN ${canal_distribucion} = "Nacional" THEN ${monto_transaccion} END ) +
      SUM( CASE WHEN ${canal_distribucion} = "Exportacion" THEN ${monto_transaccion} END ) ;;
  }

  measure: national_amount_mtd_ly{
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL AMOUNT MTD LY"
    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_mtd_ly}
         ELSE ${monto_transaccion} END  ;;

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente,national_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure: export_amount_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT AMOUNT MTD LY"

    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_mtd_ly}
         ELSE ${monto_transaccion} END ;;

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente,export_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_mtd_ly {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD LY"
    type: number
    sql: ${national_amount_mtd_ly} + ${export_amount_mtd_ly} ;;

    drill_fields: [ codigo_cliente,nombre_cliente, total_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL AMOUNT MTD LY"
    type: number
    sql: CASE
          WHEN ${total_amount_mtd} > 0 AND ${total_amount_mtd_ly} = 0 THEN 1
          WHEN ${total_amount_mtd} = 0 AND ${total_amount_mtd_ly} > 0 THEN -1
          WHEN (${total_amount_mtd} /  NULLIF (${total_amount_mtd_ly},0))-1 = 0 THEN 0
          ELSE (${total_amount_mtd} /  NULLIF (${total_amount_mtd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ codigo_cliente,nombre_cliente, vs_total_amount_mtd_ly, total_amount_mtd, total_amount_mtd_ly]
  }

  measure: z_national_amount_bud_mtd{
    group_label: "Monthly"
    label: "Z NATIONAL AMOUNT BUD MTD"
    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_bud_mtd}
         ELSE ${monto_transaccion} END ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, z_national_amount_bud_mtd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_mtd {
    group_label: "Monthly"
    label: "Z EXPORT AMOUNT BUD MTD"

    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_bud_mtd}
         ELSE ${monto_transaccion} END ;;
    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, z_export_amount_bud_mtd]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_mtd{
    group_label: "Monthly"
    label: "TOTAL AMOUNT BUD MTD"
    type: number
    sql: ${z_national_amount_bud_mtd} + ${z_export_amount_bud_mtd} ;;

    drill_fields: [ codigo_cliente,nombre_cliente, total_amount_bud_mtd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL BUD MTD"
    type: number
    sql: CASE
          WHEN ${total_amount_mtd} > 0 AND ${total_amount_bud_mtd} = 0 THEN 1
          WHEN ${total_amount_mtd} = 0 AND ${total_amount_bud_mtd} > 0 THEN -1
          WHEN (${total_amount_mtd} /  NULLIF (${total_amount_bud_mtd},0))-1=-1 THEN 0
          ELSE (${total_amount_mtd} /  NULLIF (${total_amount_bud_mtd},0))-1
         END * 100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ codigo_cliente,nombre_cliente,vs_total_bud_mtd,total_amount_mtd,total_amount_bud_mtd]

  }

  #MONTHLY-QUANTITY-MTD

  measure: national_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, national_qty_mtd]

    value_format: "#,##0"
  }

  measure: export_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, export_qty_mtd]
    value_format: "#,##0"
  }

  measure: total_qty_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY MTD"
    type: number
    sql: ${national_qty_mtd} + ${export_qty_mtd} ;;
    drill_fields: [ codigo_cliente,nombre_cliente, total_qty_mtd]
    value_format: "#,##0"
  }

  measure: national_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, national_qty_mtd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD LY"
    type: sum
    sql: ${cantidad};;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, export_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "TOTAL QTY MTD LY"
    type: number
    sql: ${national_qty_mtd_ly} + ${export_qty_mtd_ly} ;;

    drill_fields: [ codigo_cliente,nombre_cliente, total_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL QTY MTD LY"
    type: number
    sql: CASE
          WHEN ${total_qty_mtd} > 0 AND ${total_qty_mtd_ly} = 0 THEN 1
          WHEN ${total_qty_mtd} = 0 AND ${total_qty_mtd_ly} > 0 THEN -1
          WHEN (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1  = 0 THEN 0
          ELSE (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ codigo_cliente,nombre_cliente, vs_total_qty_mtd_ly,total_qty_mtd,total_qty_mtd_ly]

  }

  measure: national_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, national_qty_bud_mtd]
  }

  measure: export_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, export_qty_bud_mtd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY BUD MTD"
    type: number
    sql: ${national_qty_bud_mtd} + ${export_qty_bud_mtd} ;;

    drill_fields: [ codigo_cliente,nombre_cliente, total_qty_bud_mtd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL QTY BUD MTD"
    type: number
    sql: CASE
          WHEN ${total_qty_mtd} > 0 AND ${total_qty_bud_mtd} = 0 THEN 1
          WHEN ${total_qty_mtd} = 0 AND ${total_qty_bud_mtd} > 0 THEN -1
          WHEN (${total_qty_mtd} /  NULLIF (${total_qty_bud_mtd},0))-1= 0 THEN 0
          ELSE (${total_qty_mtd} /  NULLIF (${total_qty_bud_mtd},0))-1
         END *100 ;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ codigo_cliente,nombre_cliente, vs_total_qty_bud_mtd,total_qty_mtd,total_qty_bud_mtd]

  }


  #ANNUAL-MONEY-YTD


  measure: tipo_cambio_ytd {
    group_label: "Annual"
    label: "EXCHANGE RATE YTD"
    type: max
    sql: ${TABLE}.UKURS_YTD ;;

    value_format: "#,##0.00"
  }

  measure: tipo_cambio_ytd_ly {
    group_label: "Annual"
    label: "EXCHANGE RATE YTD LY"
    type: max
    sql: ${TABLE}.UKURS_YTD_LY ;;

    value_format: "#,##0.00"
  }

  measure: tipo_cambio_bud_ytd {
    group_label: "Annual"
    label: "EXCHANGE RATE BUD YTD"
    type: max
    sql: ${TABLE}.UKURS_BUD_YTD ;;

    value_format: "#,##0.00"
  }

  measure: tipo_cambio_bud_ytd_ly {
    group_label: "Annual"
    label: "EXCHANGE RATE BUD YTD LY"
    type: max
    sql: ${TABLE}.UKURS_BUD_YTD_LY ;;

    value_format: "#,##0.00"
  }

  measure: national_amount_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL AMOUNT YTD"
    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_ytd}
         ELSE ${monto_transaccion} END ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente,national_amount_ytd]

    value_format: "$#,##0.00"
  }

  measure: export_amount_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT AMOUNT YTD"
    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_ytd}
         ELSE ${monto_transaccion} END ;;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente,export_amount_ytd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_ytd {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD"
    type: number
    sql: ${national_amount_ytd} + ${export_amount_ytd} ;;

    drill_fields: [ codigo_cliente,nombre_cliente,total_amount_ytd]

    value_format: "$#,##0.00"
  }

  measure: national_amount_ytd_ly{
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL AMOUNT YTD LY"
    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_ytd_ly}
         ELSE ${monto_transaccion} END ;;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente,national_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure: export_amount_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT AMOUNT YTD LY"

    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_ytd_ly}
         ELSE ${monto_transaccion} END ;;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente,export_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_ytd_ly {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD LY"
    type: number
    sql: ${national_amount_ytd_ly} + ${export_amount_ytd_ly} ;;

    drill_fields: [ codigo_cliente,nombre_cliente, total_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL AMOUNT YTD LY"
    type: number
    sql: CASE
          WHEN ${total_amount_ytd} > 0 AND ${total_amount_ytd_ly} = 0 THEN 1
          WHEN ${total_amount_ytd} = 0 AND ${total_amount_ytd_ly} > 0 THEN -1
          WHEN (${total_amount_ytd} /  NULLIF (${total_amount_ytd_ly},0))-1 = 0 THEN 0
          ELSE (${total_amount_ytd} /  NULLIF (${total_amount_ytd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ codigo_cliente,nombre_cliente, vs_total_amount_ytd_ly, total_amount_ytd, total_amount_ytd_ly]
  }

  measure: z_national_amount_bud_ytd{
    group_label: "Annual"
    label: "Z NATIONAL AMOUNT BUD YTD"
    type: sum
    sql: CASE
             WHEN ${categoria} LIKE '%TOTAL%'
             THEN ${monto_transaccion_bud_ytd}
             ELSE ${monto_transaccion} END ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, z_national_amount_bud_ytd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_ytd {
    group_label: "Annual"
    label: "Z EXPORT AMOUNT BUD YTD"

    type: sum
    sql: CASE
             WHEN ${categoria} LIKE '%TOTAL%'
             THEN ${monto_transaccion_bud_ytd}
             ELSE ${monto_transaccion} END ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, z_export_amount_bud_ytd]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_ytd{
    group_label: "Annual"
    label: "TOTAL AMOUNT BUD YTD"
    type: number
    sql: ${z_national_amount_bud_ytd} + ${z_export_amount_bud_ytd} ;;

    drill_fields: [ codigo_cliente,nombre_cliente, total_amount_bud_ytd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL BUD YTD"
    type: number
    sql: CASE
          WHEN ${total_amount_ytd} > 0 AND ${total_amount_bud_ytd} = 0 THEN 1
          WHEN ${total_amount_ytd} = 0 AND ${total_amount_bud_ytd} > 0 THEN -1
          WHEN (${total_amount_ytd} /  NULLIF (${total_amount_bud_ytd},0))-1=-1 THEN 0
          ELSE (${total_amount_ytd} /  NULLIF (${total_amount_bud_ytd},0))-1
         END * 100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ codigo_cliente,nombre_cliente,vs_total_bud_ytd,total_amount_ytd,total_amount_bud_ytd]

  }




  #ANNUAL-QUANTITY-YTD

  measure: national_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, national_qty_ytd]

    value_format: "#,##0"
  }

  measure: export_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, export_qty_ytd]
    value_format: "#,##0"
  }

  measure: total_qty_ytd {
    group_label: "Annual"
    label: "TOTAL QTY YTD"
    type: number
    sql: ${national_qty_ytd} + ${export_qty_ytd} ;;
    drill_fields: [ codigo_cliente,nombre_cliente, total_qty_ytd]
    value_format: "#,##0"
  }

  measure: national_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, national_qty_ytd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD LY"
    type: sum
    sql: ${cantidad};;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, export_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "TOTAL QTY YTD LY"
    type: number
    sql: ${national_qty_ytd_ly} + ${export_qty_ytd_ly} ;;

    drill_fields: [ codigo_cliente,nombre_cliente, total_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL QTY YTD LY"
    type: number
    sql: CASE
          WHEN ${total_qty_ytd} > 0 AND ${total_qty_ytd_ly} = 0 THEN 1
          WHEN ${total_qty_ytd} = 0 AND ${total_qty_ytd_ly} > 0 THEN -1
          WHEN (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1 = 0 THEN 0
          ELSE (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ codigo_cliente,nombre_cliente, vs_total_qty_ytd_ly,total_qty_ytd,total_qty_ytd_ly]

  }

  measure: national_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, national_qty_bud_ytd]
  }

  measure: export_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ codigo_cliente,nombre_cliente, export_qty_bud_ytd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_ytd {
    group_label: "Annual"
    label: "TOTAL QTY BUD YTD"
    type: number
    sql: ${national_qty_bud_ytd} + ${export_qty_bud_ytd} ;;

    drill_fields: [ codigo_cliente,nombre_cliente, total_qty_bud_ytd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL QTY BUD YTD"
    type: number
    sql: CASE
          WHEN ${total_qty_ytd} > 0 AND ${total_qty_bud_ytd} = 0 THEN 1
          WHEN ${total_qty_ytd} = 0 AND ${total_qty_bud_ytd} > 0 THEN -1
          WHEN (${total_qty_ytd} /  NULLIF (${total_qty_bud_ytd},0))-1= 0 THEN 0
          ELSE (${total_qty_ytd} /  NULLIF (${total_qty_bud_ytd},0))-1
         END *100 ;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ codigo_cliente,nombre_cliente, vs_total_qty_bud_ytd,total_qty_ytd,total_qty_bud_ytd]

  }


}
