view: ventas_lotes {

  derived_table: {
    sql:
      SELECT
      *
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.vw_ventas_lotes_9521`
      WHERE Fecha >= COALESCE(CAST({% date_start fecha_seleccion %} AS DATE), CURRENT_DATE()-180)
      AND Fecha <= COALESCE(DATE_ADD( CAST({% date_end fecha_seleccion %} AS DATE), INTERVAL -1 DAY), CURRENT_DATE()-1)
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

  dimension_group: dates {
    hidden: no
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: documento_factura {
    description: "Documento factura"
    type: string
    sql: ${TABLE}.Documento ;;
  }

  dimension: posicion_factura {
    description: "Posición factura"
    type: string
    sql: ${TABLE}.Posicion ;;
  }

  dimension: orden_documento {
    hidden: yes
    description: "Tomar el primer registro de documento y posición"
    type: number
    sql: ${TABLE}.Orden_documento ;;
  }

  dimension: Categoria {
    description: "Clasificación de categoria"
    type: string
    sql: ${TABLE}.Categoria ;;
  }

  dimension: Material {
    description: "Codigo material"
    type: string
    sql: ${TABLE}.Material ;;
  }

  dimension: documento_entrega {
    description: "Documento entrega"
    type: string
    sql: ${TABLE}.Documento_entrega ;;
  }

  dimension: posicion_entrega {
    description: "Posición entrega"
    type: string
    sql: ${TABLE}.Posicion_entrega ;;
  }

  dimension: lote {
    description: "Lote"
    type: string
    sql: ${TABLE}.Lote ;;
  }

  dimension: monto {
    hidden: yes
    type: number
    sql: COALESCE(${TABLE}.Monto / 1000,0) ;;
  }


  dimension: cantidad {
    hidden: yes
    type: number
    sql: COALESCE(${TABLE}.Cantidad / 1000,0) ;;
  }

  dimension: cantidad_entregada {
    hidden: yes
    type: number
    sql: COALESCE(${TABLE}.Cantidad_entregada / 1000,0) ;;
  }

  measure: monto_venta {
    label: "Monto Venta"
    type: sum
    sql: CASE WHEN ${orden_documento} =1 THEN ${monto} ELSE 0 END ;;
    value_format_name: "usd"
  }

  measure: cantidad_venta {
    label: "Cantidad Venta"
    type: sum
    sql: CASE WHEN ${orden_documento} =1 THEN ${cantidad} ELSE 0 END ;;
    value_format_name: "decimal_0"
  }

  measure: cantidad_entrega {
    label: "Cantidad Entregada"
    type: sum
    sql: ${cantidad_entregada} ;;
    value_format_name: "decimal_0"
  }

}
