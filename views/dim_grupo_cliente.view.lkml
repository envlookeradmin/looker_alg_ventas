view: grupo_cliente {

  sql_table_name: `envases-analytics-qa.RPT_ALG.Dim_GrupoClientes`;;


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_Fuente;;
  }

  dimension: codigo_grupo_clientes {
    type: string
    sql: ${TABLE}.Codigo_Grupo ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }

}
