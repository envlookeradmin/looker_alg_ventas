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
    sql: ${TABLE}.Tipo_Cambio;;
  }

  dimension: presupuesto {
    type: number
    sql: ${TABLE}.Presupuesto;;
  }

}
