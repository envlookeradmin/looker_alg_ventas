view: grupo_cliente {
  derived_table: {
    sql:
       SELECT
        ID_FUENTE,
        GRUPO_CLIENTES,
        DESCRIPCION
        FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_dim_grupo_clientes`
       ;;
  }


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_FUENTE;;
  }

  dimension: grupo_cliente {
    type: string
    sql: ${TABLE}.GRUPO_CLIENTES ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.DESCRIPCION ;;
  }

}
