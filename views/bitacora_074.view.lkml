view: bitacora {
  derived_table: {
    sql: select
          region,
          time_zone,
          max(format_datetime('%F %R', datetime) ) as date_time
          from `@{GCP_PROJECT}.@{REPORTING_DATASET1}.bitacora`
         group by 1,2
      ;;
  }

  dimension: time_zone {
    label: "REGION / TIME ZONE"
    type: string
    sql: ${TABLE}.region || ' (' || ${TABLE}.time_zone || ')';;
  }

  dimension: date_time {
    label: "DATE TIME"
    type: string
    sql: ${TABLE}.date_time ;;
  }


}
