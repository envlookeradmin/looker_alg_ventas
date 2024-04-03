view: tipo_cambio1 {

  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Divisas` ;;

  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_Fuente;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.Fecha;;
  }

  dimension: moneda_origen {
    type: string
    sql: ${TABLE}.Moneda_Origen;;
  }

  dimension: moneda_conversion {
    type: string
    sql: ${TABLE}.Moneda_Conversion;;
  }

  dimension: tipo_cambio {
    type: number
    sql: CASE
          WHEN ${TABLE}.Tipo_Cambio < 0
          THEN (${TABLE}.Tipo_Cambio * -1)
          ELSE ${TABLE}.Tipo_Cambio
         END ;;
  }

  dimension: presupuesto {
    type: string
    sql: CASE
           WHEN ${TABLE}.Presupuesto
           THEN 'Presupuesto'
           ELSE 'Venta'
         END;;
  }


}
