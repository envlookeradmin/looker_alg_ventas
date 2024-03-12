view: grupo_material {
  derived_table: {
    sql:
       SELECT
        ID_FUENTE,
        GRUPO_MATERIALES,
        DESCRIPCION
        FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_dim_grupo_materiales`
       ;;
  }


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_FUENTE;;
  }

  dimension: grupo_material {
    type: string
    sql: ${TABLE}.GRUPO_MATERIALES ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.DESCRIPCION ;;
  }

}
