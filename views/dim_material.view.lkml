view: material {

  sql_table_name: `envases-analytics-qa.RPT_ALG.Dim_Material` ;;


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_Fuente ;;
  }

  dimension: codigo_material {
    type: string
    sql: ${TABLE}.Material ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }

  dimension: grupo_materiales {
    type: string
    sql: ${TABLE}.Grupo_Mat ;;
  }

  dimension: dimension {
    type: string
    sql: ${TABLE}.Dimensiones ;;
  }

  dimension: jerarquia {
    type: string
    sql: ${TABLE}.Jerarquia ;;
  }

}
