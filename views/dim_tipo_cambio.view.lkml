view: tipo_cambio {

  sql_table_name: `envases-analytics-qa.RPT_ALG.Dim_Divisas` ;;


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
    type: number
    sql: CASE
           WHEN ${TABLE}.Presupuesto
           THEN 1
           ELSE 0
         END;;
  }

}
