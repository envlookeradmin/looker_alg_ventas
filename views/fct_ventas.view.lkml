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

      Tipo_Cambio_MXN,
      Monto_Conversion_MXN,
      '' AS FCURR,
      0 AS UKURS,
      0 AS UKURS_MTD,
      0 AS UKURS_MTD_LY,
      0 AS UKURS_YTD,
      0 AS UKURS_YTD_LY
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

      0 Tipo_Cambio_MXN,
      0 Monto_Conversion_MXN,
      '' AS FCURR,
      0 AS UKURS,
      0 AS UKURS_MTD,
      0 AS UKURS_MTD_LY,
      0 AS UKURS_YTD,
      0 AS UKURS_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Fact_Ventas` v
      WHERE v.Organizacion_Ventas IN ("MXF1", "MXFC")
      AND v.Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND v.Fecha <= CAST({% date_start date_filter %} AS DATE)
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,23,24,25,26,27,28,29,30
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

      0 Tipo_Cambio_MXN,
      0 Monto_Conversion_MXN,
      t.Moneda_Origen AS FCURR,
      t.UKURS,
      t.UKURS_MTD,
      t.UKURS_MTD_LY,
      t.UKURS_YTD,
      t.UKURS_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Fact_Ventas` v left join (

      SELECT
      --ID_Fuente,
      CAST({% date_start date_filter %} AS DATE) as Fecha,
      Moneda_Origen,
      Moneda_Conversion,

      MAX(CASE
      WHEN Fecha >= CAST({% date_start date_filter %} AS DATE)
      AND Fecha <= CAST({% date_start date_filter %} AS DATE)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS,

      AVG(CASE
      WHEN Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD,

      AVG(CASE
      WHEN Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD_LY,

      AVG(CASE
      WHEN Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      and  Fecha <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD,

      AVG(CASE
      WHEN Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      and  Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Dim_Divisas`
      where Moneda_Origen IN ('USD', 'EUR', 'DKK', 'GTQ', 'CAD')
      AND Moneda_Conversion IN ('MXN')
      GROUP BY 1,2,3
      ) t on v.Fecha = t.Fecha and v.Moneda_Transaccion = t.Moneda_Origen
      WHERE v.Organizacion_Ventas NOT IN ("MXF1", "MXFC")
      AND v.Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND v.Fecha <= CAST({% date_start date_filter %} AS DATE)
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,23,24,25,26,27,28,29,30

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

      0 Tipo_Cambio_MXN,
      0 Monto_Conversion_MXN,
      '' AS FCURR,
      0 AS UKURS,
      0 AS UKURS_MTD,
      0 AS UKURS_MTD_LY,
      0 AS UKURS_YTD,
      0 AS UKURS_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Fact_Ventas` v left join (

      SELECT
      --ID_Fuente,
      CAST({% date_start date_filter %} AS DATE) as Fecha,
      Moneda_Origen,
      Moneda_Conversion,

      MAX(CASE
      WHEN Fecha >= CAST({% date_start date_filter %} AS DATE)
      AND Fecha <= CAST({% date_start date_filter %} AS DATE)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS,

      AVG(CASE
      WHEN Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD,

      AVG(CASE
      WHEN Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD_LY,

      AVG(CASE
      WHEN Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      and  Fecha <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD,

      AVG(CASE
      WHEN Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      and  Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Dim_Divisas`
      where Moneda_Origen IN ('MXN', 'EUR', 'DKK', 'GTQ', 'CAD')
      AND Moneda_Conversion IN ('USD')
      GROUP BY 1,2,3
      ) t on v.Fecha = t.Fecha and v.Moneda_Transaccion = t.Moneda_Origen
      WHERE v.Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND v.Fecha <= CAST({% date_start date_filter %} AS DATE)
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,23,24,25,26,27,28,29,30
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

      0 Tipo_Cambio_MXN,
      0 Monto_Conversion_MXN,
      '' AS FCURR,
      0 AS UKURS,
      0 AS UKURS_MTD,
      0 AS UKURS_MTD_LY,
      0 AS UKURS_YTD,
      0 AS UKURS_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Fact_Ventas` v left join (

      SELECT
      --ID_Fuente,
      CAST({% date_start date_filter %} AS DATE) as Fecha,
      Moneda_Origen,
      Moneda_Conversion,

      MAX(CASE
      WHEN Fecha >= CAST({% date_start date_filter %} AS DATE)
      AND Fecha <= CAST({% date_start date_filter %} AS DATE)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS,

      AVG(CASE
      WHEN Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD,

      AVG(CASE
      WHEN Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_MTD_LY,

      AVG(CASE
      WHEN Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      and  Fecha <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD,

      AVG(CASE
      WHEN Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      and  Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as UKURS_YTD_LY
      FROM `envases-analytics-qa.RPT_ALG.Dim_Divisas`
      where Moneda_Origen IN ('MXN', 'USD', 'DKK', 'GTQ', 'CAD')
      AND Moneda_Conversion IN ('EUR')
      GROUP BY 1,2,3
      ) t on v.Fecha = t.Fecha and v.Moneda_Transaccion = t.Moneda_Origen
      WHERE v.Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      AND v.Fecha <= CAST({% date_start date_filter %} AS DATE)
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,23,24,25,26,27,28,29,30
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

  dimension: canal_distribucion {
    type: string
    sql: ${TABLE}.Canal_Distribucion ;;
  }

  dimension: material {
    hidden: yes
    type: string
    sql: ${TABLE}.Material ;;
  }

  dimension: planta {
    hidden: yes
    type: string
    sql: ${TABLE}.Planta ;;
  }

  dimension: cliente {
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
    type: number
    sql: CASE
         WHEN ${TABLE}.Categoria NOT IN ('TOTAL USD', 'TOTAL EUR', 'TOTAL MXN')
         THEN 10
         ELSE 200
         END ;;
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

  dimension: tipo_cambio {
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

  #DAY
  filter: filtro_dia {
    hidden: yes
    type: yesno
    sql: ${fecha} = DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -0 DAY);;
  }


  #MTD
  dimension: is_previous_period{
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)  ;;
  }

  dimension: is_current_period{
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;
  }

  #YTD
  dimension: is_current_year {
    hidden: yes
    type: yesno
    sql: ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      and  ${fecha} <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)   ;;
  }

  dimension: is_previous_year {
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

  measure: s_tipo_cambio {
    group_label: "Daily"
    label: "EXCHANGE RATE"
    type: max
    sql:  CASE
           WHEN ${fecha} >= CAST({% date_start date_filter %} AS DATE)
           AND ${fecha} <= CAST({% date_start date_filter %} AS DATE)
           THEN ${TABLE}.UKURS
           ELSE 0
           END  ;;

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

    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,daily_sales]

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

    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,daily_sales]

    value_format: "#,##0"
  }


  #MONTHLY-MONEY-MTD

  measure: s_tipo_cambio_mtd {
    group_label: "Monthly"
    label: "EXCHANGE RATE MTD"
    type: max
    sql:  CASE
           WHEN ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${fecha} <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
           THEN ${TABLE}.UKURS_MTD
           ELSE 0
           END  ;;

    value_format: "#,##0.00"
  }


  measure: s_tipo_cambio_mtd_ly {
    group_label: "Monthly"
    label: "EXCHANGE RATE MTD LY"
    type: max
    sql:  CASE
           WHEN ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${fecha} <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
           THEN ${TABLE}.UKURS_MTD_LY
           ELSE 0
           END  ;;

    value_format: "#,##0.00"
  }

  measure: s_tipo_cambio_bud_mtd {
    group_label: "Monthly"
    label: "EXCHANGE RATE BUD MTD"
    type: max
    sql:  CASE
           WHEN ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${fecha} <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)
           THEN ${TABLE}.UKURS_MTD*1.2
           ELSE 0
           END  ;;

    value_format: "#,##0.00"
  }

  measure: s_tipo_cambio_bud_mtd_ly {
    group_label: "Monthly"
    label: "EXCHANGE RATE BUD MTD LY"
    type: max
    sql:  CASE
           WHEN ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
           AND ${fecha} <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
           THEN ${TABLE}.UKURS_MTD_LY*1.2
           ELSE 0
           END  ;;

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
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [cliente,nombre_cliente,national_amount_mtd]

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

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: is_current_period
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente,export_amount_mtd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_mtd {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD"
    type: number
    sql: ${national_amount_mtd} + ${export_amount_mtd} ;;

    drill_fields: [ cliente,nombre_cliente,total_amount_mtd]

    value_format: "$#,##0.00"
  }

  measure: total_amount_ {
    group_label: "Monthly"
    label: "TOTAL AMOUNT BY MONTH"
    type:  number
    sql: SUM( CASE WHEN ${canal_distribucion} = "NACIONAL" THEN ${monto_transaccion} END ) +
      SUM( CASE WHEN ${canal_distribucion} = "EXPORTACION" THEN ${monto_transaccion} END ) ;;
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
      field: is_previous_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,national_amount_mtd_ly]

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
      field: is_previous_period
      value: "yes"
    }

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,export_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_mtd_ly {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD LY"
    type: number
    sql: ${national_amount_mtd_ly} + ${export_amount_mtd_ly} ;;

    drill_fields: [ cliente,nombre_cliente, total_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL AMOUNT MTD LY"
    type: number
    sql: CASE WHEN ${total_amount_mtd} > 0 AND ${total_amount_mtd_ly} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente, vs_total_amount_mtd_ly, total_amount_mtd, total_amount_mtd_ly]
  }

  measure: z_national_amount_bud_mtd{
    group_label: "Monthly"
    label: "Z NATIONAL AMOUNT BUD MTD"
    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_mtd} * 1.2
         ELSE ${monto_transaccion} END ;;

    filters: {
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "PRESUPUESTO"]

    drill_fields: [ cliente,nombre_cliente, z_national_amount_bud_mtd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_mtd {
    group_label: "Monthly"
    label: "Z EXPORT AMOUNT BUD MTD"

    type: sum
    sql: CASE
         WHEN ${categoria} LIKE '%TOTAL%'
         THEN ${monto_transaccion_mtd} * 1.2
         ELSE ${monto_transaccion} END ;;
    filters: {
      field: is_current_period
      value: "yes"
    }
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "PRESUPUESTO"]

    drill_fields: [ cliente,nombre_cliente, z_export_amount_bud_mtd]
    #value_format: "#,##0.00"
    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_mtd{
    group_label: "Monthly"
    label: "TOTAL AMOUNT BUD MTD"
    type: number
    sql: ${z_national_amount_bud_mtd} + ${z_export_amount_bud_mtd} ;;

    drill_fields: [ cliente,nombre_cliente, total_amount_bud_mtd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL BUD MTD"
    type: number
    sql: CASE WHEN ${total_amount_mtd} > 0 AND ${total_amount_bud_mtd} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente,vs_total_bud_mtd,total_amount_mtd,total_amount_bud_mtd]

  }

  #MONTHLY-QUANTITY-MTD

  measure: national_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente, national_qty_mtd]

    value_format: "#,##0"
  }

  measure: export_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente, export_qty_mtd]
    value_format: "#,##0"
  }

  measure: total_qty_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY MTD"
    type: number
    sql: ${national_qty_mtd} + ${export_qty_mtd} ;;
    drill_fields: [ cliente,nombre_cliente, total_qty_mtd]
    value_format: "#,##0"
  }

  measure: national_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: is_previous_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]
    drill_fields: [ cliente,nombre_cliente, national_qty_mtd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD LY"
    type: sum
    sql: ${cantidad};;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]
    filters: {
      field: is_previous_period
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente, export_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "TOTAL QTY MTD LY"
    type: number
    sql: ${national_qty_mtd_ly} + ${export_qty_mtd_ly} ;;

    drill_fields: [ cliente,nombre_cliente, total_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL QTY MTD LY"
    type: number
    sql: CASE WHEN ${total_qty_mtd} > 0 AND ${total_qty_mtd_ly} = 0 THEN 1
              WHEN ${total_qty_mtd} = 0 AND ${total_qty_mtd_ly} > 0 THEN -1
              WHEN (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1  = 0 THEN 0
              ELSE (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1   END *100;;

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

    drill_fields: [ cliente,nombre_cliente, vs_total_qty_mtd_ly,total_qty_mtd,total_qty_mtd_ly]

  }

  measure: national_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "PRESUPUESTO"]
    drill_fields: [ cliente,nombre_cliente, national_qty_bud_mtd]
  }

  measure: export_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "PRESUPUESTO"]
    filters: {
      field: is_current_period
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente, export_qty_bud_mtd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY BUD MTD"
    type: number
    sql: ${national_qty_bud_mtd} + ${export_qty_bud_mtd} ;;

    drill_fields: [ cliente,nombre_cliente, total_qty_bud_mtd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL QTY BUD MTD"
    type: number
    sql: CASE WHEN ${total_qty_mtd} > 0 AND ${total_qty_bud_mtd} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente, vs_total_qty_bud_mtd,total_qty_mtd,total_qty_bud_mtd]

  }


  #ANNUAL-MONEY-YTD


  measure: s_tipo_cambio_ytd {
    group_label: "Annual"
    label: "EXCHANGE RATE YTD"
    type: max
    sql:  CASE
           WHEN ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
           and  ${fecha} <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
           THEN ${TABLE}.UKURS_YTD
           ELSE 0
           END  ;;

    value_format: "#,##0.00"
  }

  measure: s_tipo_cambio_ytd_ly {
    group_label: "Annual"
    label: "EXCHANGE RATE YTD LY"
    type: max
    sql:  CASE
           WHEN ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
    and  ${fecha} <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
           THEN ${TABLE}.UKURS_YTD_LY
           ELSE 0
           END  ;;

    value_format: "#,##0.00"
  }

  measure: s_tipo_cambio_bud_ytd {
    group_label: "Annual"
    label: "EXCHANGE RATE BUD YTD"
    type: max
    sql:  CASE
           WHEN ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
           and  ${fecha} <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)
           THEN ${TABLE}.UKURS_YTD*1.2
           ELSE 0
           END  ;;

    value_format: "#,##0.00"
  }

  measure: s_tipo_cambio_bud_ytd_ly {
    group_label: "Annual"
    label: "EXCHANGE RATE BUD YTD LY"
    type: max
    sql:  CASE
           WHEN ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
    and  ${fecha} <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
           THEN ${TABLE}.UKURS_YTD_LY*1.2
           ELSE 0
           END  ;;

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
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [cliente,nombre_cliente,national_amount_ytd]

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

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]
    filters: {
      field: is_current_year
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente,export_amount_ytd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_ytd {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD"
    type: number
    sql: ${national_amount_ytd} + ${export_amount_ytd} ;;

    drill_fields: [ cliente,nombre_cliente,total_amount_ytd]

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
      field: is_previous_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,national_amount_ytd_ly]

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
      field: is_previous_year
      value: "yes"
    }

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,export_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_ytd_ly {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD LY"
    type: number
    sql: ${national_amount_ytd_ly} + ${export_amount_ytd_ly} ;;

    drill_fields: [ cliente,nombre_cliente, total_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL AMOUNT YTD LY"
    type: number
    sql: CASE WHEN ${total_amount_ytd} > 0 AND ${total_amount_ytd_ly} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente, vs_total_amount_ytd_ly, total_amount_ytd, total_amount_ytd_ly]
  }

  measure: z_national_amount_bud_ytd{
    group_label: "Annual"
    label: "Z NATIONAL AMOUNT BUD YTD"
    type: sum
    sql: CASE
             WHEN ${categoria} LIKE '%TOTAL%'
             THEN ${monto_transaccion_ytd} * 1.2
             ELSE ${monto_transaccion} END ;;

    filters: {
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "PRESUPUESTO"]

    drill_fields: [ cliente,nombre_cliente, z_national_amount_bud_ytd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_ytd {
    group_label: "Annual"
    label: "Z EXPORT AMOUNT BUD YTD"

    type: sum
    sql: CASE
             WHEN ${categoria} LIKE '%TOTAL%'
             THEN ${monto_transaccion_ytd} * 1.2
             ELSE ${monto_transaccion} END ;;

    filters: {
      field: is_current_year
      value: "yes"
    }
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "PRESUPUESTO"]

    drill_fields: [ cliente,nombre_cliente, z_export_amount_bud_ytd]
    #value_format: "#,##0.00"
    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_ytd{
    group_label: "Annual"
    label: "TOTAL AMOUNT BUD YTD"
    type: number
    sql: ${z_national_amount_bud_ytd} + ${z_export_amount_bud_ytd} ;;

    drill_fields: [ cliente,nombre_cliente, total_amount_bud_ytd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL BUD YTD"
    type: number
    sql: CASE WHEN ${total_amount_ytd} > 0 AND ${total_amount_bud_ytd} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente,vs_total_bud_ytd,total_amount_ytd,total_amount_bud_ytd]

  }




  #ANNUAL-QUANTITY-YTD

  measure: national_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente, national_qty_ytd]

    value_format: "#,##0"
  }

  measure: export_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente, export_qty_ytd]
    value_format: "#,##0"
  }

  measure: total_qty_ytd {
    group_label: "Annual"
    label: "TOTAL QTY YTD"
    type: number
    sql: ${national_qty_ytd} + ${export_qty_ytd} ;;
    drill_fields: [ cliente,nombre_cliente, total_qty_ytd]
    value_format: "#,##0"
  }

  measure: national_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: is_previous_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]
    drill_fields: [ cliente,nombre_cliente, national_qty_ytd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD LY"
    type: sum
    sql: ${cantidad};;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]
    filters: {
      field: is_previous_year
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente, export_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "TOTAL QTY YTD LY"
    type: number
    sql: ${national_qty_ytd_ly} + ${export_qty_ytd_ly} ;;

    drill_fields: [ cliente,nombre_cliente, total_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL QTY YTD LY"
    type: number
    sql: CASE WHEN ${total_qty_ytd} > 0 AND ${total_qty_ytd_ly} = 0 THEN 1
              WHEN ${total_qty_ytd} = 0 AND ${total_qty_ytd_ly} > 0 THEN -1
              WHEN (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1  = 0 THEN 0
              ELSE (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1   END *100;;

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

    drill_fields: [ cliente,nombre_cliente, vs_total_qty_ytd_ly,total_qty_ytd,total_qty_ytd_ly]

  }

  measure: national_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "PRESUPUESTO"]
    drill_fields: [ cliente,nombre_cliente, national_qty_bud_ytd]
  }

  measure: export_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "PRESUPUESTO"]
    filters: {
      field: is_current_year
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente, export_qty_bud_ytd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_ytd {
    group_label: "Annual"
    label: "TOTAL QTY BUD YTD"
    type: number
    sql: ${national_qty_bud_ytd} + ${export_qty_bud_ytd} ;;

    drill_fields: [ cliente,nombre_cliente, total_qty_bud_ytd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL QTY BUD YTD"
    type: number
    sql: CASE WHEN ${total_qty_ytd} > 0 AND ${total_qty_bud_ytd} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente, vs_total_qty_bud_ytd,total_qty_ytd,total_qty_bud_ytd]

  }


}
