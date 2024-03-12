view: tipo_cambio {
  derived_table: {
    sql:
       SELECT
        ID_Fuente,
        Fecha,
        Moneda_Origen,
        Moneda_Conversion,
        Tipo_Cambio
        FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_dim_tipo_cambio`
       ;;
  }


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

}
