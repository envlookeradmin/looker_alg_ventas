view: planta {
  derived_table: {
    sql:
       SELECT
        ID_FUENTE,
        CODIGO_PLANTA,
        NOMBRE,
        CIUDAD,
        PAIS,
        CLUSTER,
        REGION
       FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_dim_planta`
       ;;
  }


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_FUENTE;;
  }

  dimension: codigo_planta {
    type: string
    sql: ${TABLE}.CODIGO_PLANTA ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.NOMBRE ;;
  }

  dimension: ciudad {
    type: string
    sql: ${TABLE}.CIUDAD ;;
  }

  dimension: pais {
    type: string
    sql: ${TABLE}.PAIS ;;
  }

  dimension: cluster {
    label: "CLUSTER"
    type: string
    sql: ${TABLE}.CLUSTER ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.REGION ;;
  }

}
