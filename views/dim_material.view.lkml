view: material {
  derived_table: {
    sql:
       SELECT
      ID_FUENTE,
      CODIGO_MATERIAL,
      DESCRIPCION,
      GRUPO_MATERIALES,
      DIMENSION,
      JERARQUIA
      FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_dim_materiales`
       ;;
  }


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_FUENTE;;
  }

  dimension: codigo_material {
    type: string
    sql: ${TABLE}.CODIGO_MATERIAL ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.DESCRIPCION ;;
  }

  dimension: grupo_materiales {
    type: string
    sql: ${TABLE}.GRUPO_MATERIALES ;;
  }

  dimension: dimension {
    type: string
    sql: ${TABLE}.DIMENSION ;;
  }

  dimension: jerarquia {
    type: string
    sql: ${TABLE}.JERARQUIA ;;
  }

}
