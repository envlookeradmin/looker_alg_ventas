view: material {

  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Material` ;;


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

  dimension: codigo_grupo_materiales {
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
