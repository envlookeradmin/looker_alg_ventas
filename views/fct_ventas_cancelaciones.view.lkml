view: ventas_cancelaciones {

  derived_table: {
    sql:
          SELECT
          v.Fecha,
          v.Organizacion_ventas,
          v.Categoria,
          v.Subcategoria,
          SUM(CASE WHEN v.Monto_Conversion_MXN < 0 THEN 0 ELSE v.Monto_Conversion_MXN END) AS Monto_venta,
          SUM(CASE WHEN v.Monto_Conversion_MXN < 0 THEN v.Monto_Conversion_MXN*-1 ELSE 0 END) AS Monto_devolucion,
          SUM(c.MontoMXN) AS Monto_cancelacion,
          SUM(CASE WHEN v.Monto_Conversion_MXN < 0 THEN 0 ELSE v.Cantidad END) AS Cantidad_venta,
          SUM(CASE WHEN v.Monto_Conversion_MXN < 0 THEN v.Cantidad*-1 ELSE 0 END) AS Cantidad_devolucion,
          SUM(c.Cantidad) AS Cantidad_cancelacion
          FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Fact_Ventas` v
          left join `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Fact_Cancelaciones` c on
          c.DocumentoCancelacion = v.Documento and c.PosicionCancelacion = v.Posicion
          where id_fuente="S4H_MEX" and tipo_transaccion="Venta"
          AND v.Fecha >= COALESCE(CAST({% date_start fecha_seleccion %} AS DATE), CURRENT_DATE()-180)
          AND v.Fecha <= COALESCE(DATE_ADD( CAST({% date_end fecha_seleccion %} AS DATE), INTERVAL -1 DAY), CURRENT_DATE()-1)
          group by 1,2,3,4
       ;;
  }

  filter: fecha_seleccion {
    type: date
  }

  dimension: fecha {
    description: "Fecha para filtrar información"
    type: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: organizacion_ventas {
    description: "Organización de ventas"
    type: string
    sql: ${TABLE}.Organizacion_Ventas ;;
  }

  dimension: Categoria {
    description: "Clasificación de categoria"
    type: string
    sql: ${TABLE}.Categoria ;;
  }

  dimension: Subcategoria {
    description: "Clasificación de subcategoria"
    type: string
    sql: ${TABLE}.Subcategoria ;;
  }

  dimension: monto {
    hidden: yes
    type: number
    sql: COALESCE(${TABLE}.Monto_venta / 1000,0) ;;
  }

  dimension: monto_devoluciones {
    hidden: yes
    type: number
    sql: COALESCE(${TABLE}.Monto_devolucion / 1000,0) ;;
  }

  dimension: monto_cancelaciones {
    hidden: yes
    type: number
    sql: COALESCE(${TABLE}.Monto_cancelacion / 1000,0) ;;
  }

  dimension: monto_neto {
    hidden: yes
    type: number
    sql: ${monto} - ${monto_devoluciones} - ${monto_cancelaciones} ;;
  }

  dimension: cantidad {
    hidden: yes
    type: number
    sql: COALESCE(${TABLE}.Cantidad_venta / 1000,0) ;;
  }

  dimension: cantidad_devoluciones {
    hidden: yes
    type: number
    sql: COALESCE(${TABLE}.Cantidad_devolucion / 1000,0) ;;
  }

  dimension: cantidad_cancelaciones {
    hidden: yes
    type: number
    sql: COALESCE(${TABLE}.Cantidad_cancelacion / 1000,0) ;;
  }

  dimension: cantidad_neto {
    hidden: yes
    type: number
    sql: ${cantidad} - ${cantidad_devoluciones} - ${cantidad_cancelaciones} ;;
  }

  measure: total_monto {
    label: "Monto Venta"
    type: sum
    sql: ${monto} ;;
    value_format: "$#,##0.00"
  }

  measure: total_monto_devoluciones {
    label: "Monto Devoluciones"
    type: sum
    sql: ${monto_devoluciones} ;;
    value_format: "$#,##0.00"
  }

  measure: total_monto_cancelaciones {
    label: "Monto Cancelaciónes"
    type: sum
    sql: ${monto_cancelaciones} ;;
    value_format: "$#,##0.00"
  }

  measure: total_monto_neto {
    label: "Monto Neto"
    type: sum
    sql: ${monto_neto}  ;;
    value_format: "$#,##0.00"
  }

  measure: total_cantidad {
    label: "Cantidad Venta"
    type: sum
    sql: ${cantidad} ;;
    value_format: "#,##0"
  }

  measure: total_cantidad_devoluciones {
    label: "Cantidad Devoluciones"
    type: sum
    sql: ${cantidad_devoluciones} ;;
    value_format: "#,##0"
  }

  measure: total_cantidad_cancelaciones {
    label: "Cantidad Cancelaciónes"
    type: sum
    sql: ${cantidad_cancelaciones} ;;
    value_format: "#,##0"
  }

  measure: total_cantidad_neto {
    label: "Cantidad Neto"
    type: sum
    sql: ${cantidad_neto}  ;;
    value_format: "#,##0"
  }
}
