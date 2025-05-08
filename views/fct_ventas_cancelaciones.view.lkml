view: ventas_cancelaciones {

  derived_table: {
    sql:
          WITH
          V_C AS (
          SELECT
          v.ID_Fuente,
          v.Fecha,
          v.Organizacion_ventas,
          v.Planta,
          v.Categoria,
          v.Subcategoria,
          v.Moneda_Transaccion,
          SUM(CASE WHEN v.Monto_Conversion_MXN < 0 THEN 0 ELSE v.Monto_Conversion_MXN END) AS Monto_venta,
          SUM(CASE WHEN v.Monto_Conversion_MXN < 0 THEN v.Monto_Conversion_MXN*-1 ELSE 0 END) AS Monto_devolucion,
          SUM(c.MontoMXN) AS Monto_cancelacion,
          SUM(CASE WHEN v.Monto_Conversion_MXN < 0 THEN 0 ELSE v.Cantidad END) AS Cantidad_venta,
          SUM(CASE WHEN v.Monto_Conversion_MXN < 0 THEN v.Cantidad*-1 ELSE 0 END) AS Cantidad_devolucion,
          SUM(c.Cantidad) AS Cantidad_cancelacion
          FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Fact_Ventas` v
          LEFT JOIN `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Fact_Cancelaciones` c ON
          c.DocumentoCancelacion = v.Documento AND c.PosicionCancelacion = v.Posicion
          WHERE v.ID_Fuente="S4H_MEX" AND tipo_transaccion="Venta"
          AND v.Fecha >= COALESCE(CAST({% date_start fecha_seleccion %} AS DATE), CURRENT_DATE()-180)
          AND v.Fecha <= COALESCE(DATE_ADD( CAST({% date_end fecha_seleccion %} AS DATE), INTERVAL -1 DAY), CURRENT_DATE()-1)
          group by 1,2,3,4,5,6,7 ),
          PLANTA AS (
          SELECT
          'S4H_MEX' AS ID_Fuente
          ,ID_Planta
          ,Nombre_Planta
          ,Ciudad
          ,CASE WHEN ID_Planta = '9521' THEN 'MX' ELSE Pais END AS Pais
          ,CASE WHEN ID_Planta = '9521' THEN 'Mexico' ELSE Cluster END AS Cluster
          ,'Americas' AS Region
          FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Planta`
          WHERE ID_Fuente = 'S4H_MEX' OR
          (ID_Fuente = 'ECC_USA' AND ID_Planta = '9521') ),
          D_MC AS (
          SELECT
          'MXN' AS Moneda_Conversion
          UNION ALL
          SELECT
          'USD'
          UNION ALL
          SELECT
          'EUR'
          UNION ALL
          SELECT
          'DKK' ),
          D_D AS (
          SELECT
          Fecha,
          Moneda_Origen,
          Moneda_Conversion,
          Tipo_Cambio
          FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Divisas`
          WHERE Presupuesto = FALSE)

      SELECT
      V_C.*,
      plnt.Nombre_Planta,
      D_MC.Moneda_Conversion,
      D_D.Tipo_Cambio
      FROM V_C LEFT JOIN PLANTA plnt ON V_C.ID_Fuente = plnt.ID_Fuente AND V_C.Planta = plnt.ID_Planta
      CROSS JOIN D_MC
      LEFT JOIN D_D ON V_C.Moneda_Transaccion = D_D.Moneda_Origen
      AND D_MC.Moneda_Conversion = D_D.Moneda_Conversion
      AND V_C.Fecha = D_D.Fecha
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

  dimension: nombre_planta {
    description: "nombre de planta"
    label: "Planta"
    type: string
    sql: ${TABLE}.Nombre_Planta ;;
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

  dimension: moneda_conversion {
    description: "Moneda a convertir"
    label: "Moneda"
    type: string
    sql: ${TABLE}.Moneda_Conversion ;;
  }

  dimension: tipo_cambio {
    description: "valor de tipo de cambio"
    type: number
    sql: ${TABLE}.Tipo_Cambio ;;
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
    sql: ${monto} * ${tipo_cambio} ;;
    value_format: "$#,##0.00"
  }

  measure: total_monto_devoluciones {
    label: "Monto Devoluciones"
    type: sum
    sql: ${monto_devoluciones} * ${tipo_cambio};;
    value_format: "$#,##0.00"
  }

  measure: total_monto_cancelaciones {
    label: "Monto Cancelaciónes"
    type: sum
    sql: ${monto_cancelaciones} * ${tipo_cambio};;
    value_format: "$#,##0.00"
  }

  measure: total_monto_neto {
    label: "Monto Neto"
    type: sum
    sql: ${monto_neto} * ${tipo_cambio} ;;
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
