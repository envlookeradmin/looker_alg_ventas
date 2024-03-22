view: fecha {

  sql_table_name: `envases-analytics-qa.ENVASES_REPORTING.CALENDAR` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATE ;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.DATE ;;
  }

  dimension: calday {
    type: string
    sql: ${TABLE}.CALDAY ;;
  }

  dimension: anio {
    label: "Año"
    type: number
    sql: ${TABLE}.YEAR ;;
  }

  dimension: mes {
    type: number
    sql: ${TABLE}.MONTH ;;
  }

  dimension: dia {
    type: number
    sql: ${TABLE}.DAY ;;
  }

  dimension: trimestre {
    type: number
    sql: ${TABLE}.QUARTER ;;
  }

  dimension: trimestre_letra {
    type: string
    sql: concat("Q", ${TABLE}.QUARTER) ;;
  }

  measure: count {
    type: count
  }
}
