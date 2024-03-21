view: planta {

 sql_table_name: `envases-analytics-qa.RPT_ALG.Dim_Planta` ;;


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
    sql: ${TABLE}.CLUSTER ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.REGION ;;
  }

}
