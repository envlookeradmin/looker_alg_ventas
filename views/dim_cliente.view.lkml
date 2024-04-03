view: cliente {

  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Cliente` ;;

  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_Fuente;;
  }

  dimension: codigo_cliente {
    type: string
    sql: ${TABLE}.Codigo_Cliente ;;
  }

  dimension: organizacion_ventas {
    type: string
    sql: ${TABLE}.Organizacion_Ventas ;;
  }

  dimension: codigo_canal_distribucion {
    type: string
    sql: ${TABLE}.Canal_Distribucion ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.Division ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }

  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }

  dimension: ciudad {
    type: string
    sql: ${TABLE}.Ciudad ;;
  }

  dimension: codigo_grupo_clientes {
    type: string
    sql: ${TABLE}.Grupo_Clientes ;;
  }

}
