view: bitacora {
  derived_table: {
    sql: select
          case
          when time_zone = 'CST' THEN 'MEXICO (CST)'
          when time_zone = 'CET' THEN 'EUROPE (CET)'
          when time_zone = 'EST' THEN 'USA - CANADA (EST)'
          end as time_zone,
          max(format_datetime('%F %R', date_time) ) as date_time
          from `ENVASES_REPORTING.bitacora_074`
         group by 1
      ;;
  }

  dimension: time_zone {
    label: "REGION / TIME ZONE"
    type: string
    sql: ${TABLE}.TIME_ZONE ;;
  }

  dimension: date_time {
    label: "DATE TIME"
    type: string
    sql: ${TABLE}.DATE_TIME ;;
  }


}
