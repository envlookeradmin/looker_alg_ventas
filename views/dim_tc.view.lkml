view: d_tc {

  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Divisas` ;;


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_Fuente;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.Fecha;;
  }

  dimension: moneda_origen {
    type: string
    sql: ${TABLE}.Moneda_Origen;;
  }

  dimension: moneda_conversion {
    type: string
    sql: ${TABLE}.Moneda_Conversion;;
  }

  dimension: tipo_cambio {
    type: number
    sql: CASE
          WHEN ${TABLE}.Tipo_Cambio < 0
          THEN (${TABLE}.Tipo_Cambio * -1)
          ELSE ${TABLE}.Tipo_Cambio
         END ;;
  }

  dimension: presupuesto {
    type: number
    sql: CASE
           WHEN ${TABLE}.Presupuesto
           THEN 1
           ELSE 0
         END;;
  }

  filter: date_filter {
    label: "Date"
    type: date
  }

  #DAY
  filter: filtro_dia {
    hidden: yes
    type: yesno
    sql: ${fecha} = DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -0 DAY);;
  }

  #MTD

  dimension: filtro_mtd{
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;
  }

  dimension: filtro_mtd_ly{
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)  ;;
  }

  #YTD
  dimension: filtro_ytd {
    hidden: yes
    type: yesno
    sql: ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      and  ${fecha} <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)   ;;
  }

  dimension: filtro_ytd_ly {
    hidden: yes
    type: yesno
    sql: ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      and  ${fecha} <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)   ;;
  }

  dimension: filtro_real {
    hidden: yes
    type: yesno
    sql: ${presupuesto} = 0 ;;
  }

  dimension: filtro_presupuesto {
    hidden: yes
    type: yesno
    sql: ${presupuesto} = 1 ;;
  }

  ###################metricas_tipo_cambio

  measure: tc_diario {
    type: max
    sql: ${tipo_cambio} ;;

    filters: {
      field: filtro_real
      value: "yes"
    }

    filters: {
      field: filtro_dia
      value: "yes"
    }

    value_format: "#,##0.00"
  }

  measure: tc_mtd {
    type: average
    sql: ${tipo_cambio} ;;

    filters: {
      field: filtro_real
      value: "yes"
    }

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    value_format: "#,##0.00"
  }

  measure: tc_mtd_ly {
    type: average
    sql: ${tipo_cambio} ;;

    filters: {
      field: filtro_real
      value: "yes"
    }

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    value_format: "#,##0.00"
  }

  measure: tc_ytd {
    type: average
    sql: ${tipo_cambio} ;;

    filters: {
      field: filtro_real
      value: "yes"
    }

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    value_format: "#,##0.00"
  }

  measure: tc_ytd_ly {
    type: average
    sql: ${tipo_cambio} ;;

    filters: {
      field: filtro_real
      value: "yes"
    }

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    value_format: "#,##0.00"
  }

  measure: tc_bud_mtd {
    type: average
    sql: ${tipo_cambio} ;;

    filters: {
      field: filtro_presupuesto
      value: "yes"
    }

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    value_format: "#,##0.00"
  }

}
