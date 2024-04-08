view: planta {

  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Planta` ;;


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_Fuente;;
  }

  dimension: id_planta {
    type: string
    sql: ${TABLE}.ID_Planta ;;
  }

  dimension: nombre_planta {
    type: string
    sql: ${TABLE}.Nombre_Planta;;
  }

  dimension: ciudad {
    type: string
    sql: ${TABLE}.Ciudad ;;
  }

  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }

  dimension: cluster {
    label: "CLUSTER"
    type: string
    sql: ${TABLE}.Cluster ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

}
