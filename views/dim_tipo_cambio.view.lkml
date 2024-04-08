view: tipo_cambio {

  #sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Divisas` ;;

  derived_table: {
    sql:
      WITH dim_divisas as (
      SELECT
      Fecha,
      Moneda_Origen,
      Moneda_Conversion,
      CASE
           WHEN Presupuesto
           THEN 'Presupuesto'
           ELSE 'Venta'
         END AS Presupuesto,
      Tipo_Cambio,
      avg(Tipo_Cambio)
      over(partition by extract(year from Fecha), extract(month from Fecha), Moneda_Origen, Moneda_Conversion, Presupuesto
      order by Fecha, Moneda_Origen, Moneda_Conversion) Tipo_Cambio_AVG_mensual,
      avg(Tipo_Cambio)
      over(partition by extract(year from Fecha), Moneda_Origen, Moneda_Conversion, Presupuesto
      order by Fecha, Moneda_Origen, Moneda_Conversion) Tipo_Cambio_AVG_anual
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Divisas`
      )

      select
      Moneda_Origen,
      Moneda_Conversion,
      Presupuesto,
      MAX( CASE
      WHEN Fecha = CAST( REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE)
      THEN Tipo_Cambio
      END ) AS Tipo_Cambio,
      MAX( CASE
      WHEN Fecha = CAST( REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE)
      THEN Tipo_Cambio_AVG_mensual
      END ) AS Tipo_Cambio_AVG_mensual,
      MAX( CASE
      WHEN Fecha = CAST( REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE)
      THEN Tipo_Cambio_AVG_anual END ) AS Tipo_Cambio_AVG_anual,
      MAX( CASE
      WHEN Fecha = DATE_ADD( CAST( REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE),INTERVAL -1 year)
      THEN Tipo_Cambio_AVG_mensual END ) AS Tipo_Cambio_AVG_mensual_LY,
      MAX( CASE
      WHEN Fecha = DATE_ADD( CAST( REPLACE( {{ _filters['ventas.date_filter'] | sql_quote }} ,'/','-') AS DATE),INTERVAL -1 year)
      THEN Tipo_Cambio_AVG_anual END ) AS Tipo_Cambio_AVG_anual_LY
      from dim_divisas
      GROUP BY 1,2,3
      ;;
  }

  dimension: moneda_origen {
    type: string
    sql: ${TABLE}.Moneda_Origen;;
  }

  dimension: moneda_conversion {
    type: string
    sql: ${TABLE}.Moneda_Conversion;;
  }

  dimension: presupuesto {
    type: string
    sql: ${TABLE}.Presupuesto ;;
  }

  dimension: tipo_cambio {
    type: number
    sql: CASE
          WHEN ${TABLE}.Tipo_Cambio < 0
          THEN (${TABLE}.Tipo_Cambio * -1)
          ELSE ${TABLE}.Tipo_Cambio
         END ;;
  }

  dimension: tipo_cambio_mtd {
    type: number
    sql: CASE
          WHEN ${TABLE}.Tipo_Cambio_AVG_mensual < 0
          THEN (${TABLE}.Tipo_Cambio_AVG_mensual * -1)
          ELSE ${TABLE}.Tipo_Cambio_AVG_mensual
         END ;;
  }

  dimension: tipo_cambio_ytd {
    type: number
    sql: CASE
          WHEN ${TABLE}.Tipo_Cambio_AVG_anual < 0
          THEN (${TABLE}.Tipo_Cambio_AVG_anual * -1)
          ELSE ${TABLE}.Tipo_Cambio_AVG_anual
         END ;;
  }

  dimension: tipo_cambio_mtd_ly {
    type: number
    sql: CASE
          WHEN ${TABLE}.Tipo_Cambio_AVG_mensual_LY < 0
          THEN (${TABLE}.Tipo_Cambio_AVG_mensual_LY * -1)
          ELSE ${TABLE}.Tipo_Cambio_AVG_mensual_LY
         END ;;
  }

  dimension: tipo_cambio_ytd_ly {
    type: number
    sql: CASE
          WHEN ${TABLE}.Tipo_Cambio_AVG_anual_LY < 0
          THEN (${TABLE}.Tipo_Cambio_AVG_anual_LY * -1)
          ELSE ${TABLE}.Tipo_Cambio_AVG_anual_LY
         END ;;
  }


}
