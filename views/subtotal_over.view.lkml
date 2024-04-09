view: subtotal_over {
  sql_table_name: (select '' as row_type union select null as row_type) ;;

dimension: row_type_checker {
  hidden:yes
  sql: ${TABLE}.row_type ;;
}

  dimension: row_type_description {
    hidden:yes
    sql:coalesce(${TABLE}.row_type,'SUBTOTAL');;
  }

}
