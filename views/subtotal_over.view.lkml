view: subtotal_over {
  sql_table_name: (select '' as row_type union all select null as row_type) ;;

dimension: row_type_checker {
  hidden:yes
  sql: ${TABLE}.row_type ;;
}

  dimension: row_type_description {
    hidden:yes
    sql:coalesce(${TABLE}.row_type,'SUBTOTAL');;
  }

  dimension: subcategory_name {
    #order_by_field: subcategory_order
    # For subtotal rows: show 'SUBTOTAL'.  For nulls, show '∅' (supports intuitive sorting).  Otherwise use raw base table field's data. Note, concatenation with '${row_type_checker}' is used to concisely force subtotal rows to evaluate to null, which is then converted to 'SUBTOTAL'
    sql: coalesce(cast(coalesce(cast(${ventas.subcategoria1} as string),'∅')||${row_type_checker} as string),'SUBTOTAL');;
  }
  dimension: subcategory_order {
    hidden: yes
    #For order by fields, use a similar calculation, but use values that correctly put nulls at min and subtotals at max of sort order positioning
    sql: coalesce(cast(coalesce(cast(${ventas.subcategoria1} as string),'          ')||${row_type_checker} as string),'ZZZZZZZZZZ');;
  }

}
