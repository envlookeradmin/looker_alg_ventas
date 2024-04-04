view: tipo_cambio {

  derived_table: {
    sql:
      SELECT
      --ID_Fuente,
      --Fecha,
      Moneda_Origen,
      Moneda_Conversion,
      CASE
           WHEN Presupuesto
           THEN 'Presupuesto'
           ELSE 'Venta'
         END AS Presupuesto,
      MAX(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST( REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE)
      AND Fecha <= CAST( REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as Tipo_Cambio,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as Tipo_Cambio_MTD,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as Tipo_Cambio_MTD_LY,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE (REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-'))) AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_TRUNC(CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE), DAY)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as Tipo_Cambio_YTD,

      AVG(CASE
      WHEN Presupuesto = false
      AND Fecha >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE (REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-'))) -1 AS STRING),"-01-01")  AS DATE)
      AND Fecha <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as Tipo_Cambio_YTD_LY,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD((CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE)),INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as Tipo_Cambio_Bud_MTD,

      AVG(CASE
      WHEN Presupuesto = true
      AND Fecha >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND Fecha <= DATE_ADD(   DATE_ADD( CAST(REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)
      THEN CAST(
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END
      AS NUMERIC) END ) as Tipo_Cambio_Bud_MTD_LY

      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Divisas`
      GROUP BY 1,2,3--,4,5
      ;;
  }

  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_Fuente ;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: moneda_origen {
    type: string
    sql: ${TABLE}.Moneda_Origen ;;
  }

  dimension: moneda_conversion {
    type: string
    sql: ${TABLE}.Moneda_Conversion ;;
  }

  dimension: tc {
    type: number
    sql: ${TABLE}.Tipo_Cambio ;;

    #value_format: "#,##0.00"
  }

  dimension: tc_mtd {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_MTD ;;
  }

  dimension: tc_mtd_ly {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_MTD_LY ;;
  }

  dimension: tc_ytd {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_YTD ;;
  }

  dimension: tc_ytd_ly {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_YTD_LY ;;
  }

  dimension: tc_bud_mtd {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_Bud_MTD ;;
  }

  dimension: tc_bud_mtd_ly {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_Bud_MTD_LY ;;
  }

  dimension: presupuesto {
    #hidden: yes
    type: string
    sql: ${TABLE}.Presupuesto ;;
  }


}
