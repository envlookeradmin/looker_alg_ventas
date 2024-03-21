view: grupo_material {

  sql_table_name:`envases-analytics-qa.RPT_ALG.Dim_GrupoMateriales` ;;


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_Fuente ;;
  }

  dimension: codigo_grupo {
    type: string
    sql: ${TABLE}.Codigo_Grupo ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }

}
