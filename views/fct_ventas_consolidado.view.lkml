view: ventas_consolidado {

  derived_table: {
    sql:
      WITH
    VTS as (
      SELECT
      ID_Fuente,
      Tipo_Transaccion,
      Fecha,
      Canal_Distribucion,
      Material,
      Descripcion_Material,
      Grupo_Material,
      Descripcion_Grupo_Material,
      Jerarquia,
      Dimensiones,
      Planta,
      Nombre_Planta,
      Ciudad,
      Pais,
      Cluster,
      Region,
      Cliente,
      Nombre_Cliente,
      Pais_Cliente,
      Ciudad_Cliente,
      Grupo_Cliente,
      Corporativo,
      Destinatario,
      Nombre_Destinatario,
      Pais_Destinatario,
      Ciudad_Destinatario,
      Organizacion_Ventas,
      Division,
      Sector,
      Unidad_Base,
      Categoria_Global,
      Categoria,
      SubCategoria,
      Moneda_Transaccion,
      Cantidad,
      Monto_MXN,
      Monto AS Monto_Transaccion
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Fact_Ventas_Columnar`),
      D_MC as (
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
      D_D as (
      SELECT
      Fecha,
      Moneda_Origen,
      Moneda_Conversion,
      CASE
      WHEN Presupuesto
      THEN 'Presupuesto'
      ELSE 'Venta'
      END AS Presupuesto,
      CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END AS Tipo_Cambio,
      avg(CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END)
      over(partition by extract(year from Fecha), extract(month from Fecha), Moneda_Origen, Moneda_Conversion, Presupuesto
      order by Fecha, Moneda_Origen, Moneda_Conversion) as Tipo_Cambio_AVG_mensual,
      avg(CASE
      WHEN Tipo_Cambio < 0
      THEN (Tipo_Cambio * -1)
      ELSE Tipo_Cambio
      END)
      over(partition by extract(year from Fecha), Moneda_Origen, Moneda_Conversion, Presupuesto
      order by Fecha, Moneda_Origen, Moneda_Conversion) as Tipo_Cambio_AVG_anual
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Divisas`),
      D_TC as (
      select
      Moneda_Origen,
      Moneda_Conversion,
      Presupuesto,
      MAX( CASE
      WHEN Fecha = CAST( {% date_start date_filter %} AS DATE)
      THEN Tipo_Cambio
      END ) AS Tipo_Cambio,
      MAX( CASE
      WHEN Fecha = CAST( {% date_start date_filter %} AS DATE)
      THEN Tipo_Cambio_AVG_mensual
      END ) AS Tipo_Cambio_AVG_mensual,
      MAX( CASE
      WHEN Fecha = CAST( {% date_start date_filter %} AS DATE)
      THEN Tipo_Cambio_AVG_anual
      END ) AS Tipo_Cambio_AVG_anual,
      MAX( CASE
      WHEN Fecha = DATE_ADD( CAST( {% date_start date_filter %} AS DATE),INTERVAL -1 year)
      THEN Tipo_Cambio_AVG_mensual
      END ) AS Tipo_Cambio_AVG_mensual_LY,
      MAX( CASE
      WHEN Fecha = DATE_ADD( CAST( {% date_start date_filter %} AS DATE),INTERVAL -1 year)
      THEN Tipo_Cambio_AVG_anual
      END ) AS Tipo_Cambio_AVG_anual_LY
      from D_D
      GROUP BY 1,2,3)

      SELECT
      ID_Fuente,
      Tipo_Transaccion,
      VTS.Fecha,
      Canal_Distribucion,
      Material,
      Descripcion_Material,
      Grupo_Material,
      Descripcion_Grupo_Material,
      Jerarquia,
      Dimensiones,
      Planta,
      Nombre_Planta,
      Ciudad,
      Pais,
      Cluster,
      Region,
      Cliente,
      Nombre_Cliente,
      Pais_Cliente,
      Ciudad_Cliente,
      Grupo_Cliente,
      Corporativo,
      Destinatario,
      Nombre_Destinatario,
      Pais_Destinatario,
      Ciudad_Destinatario,
      Organizacion_Ventas,
      Division,
      Sector,
      Unidad_Base,
      Categoria_Global,
      Categoria,
      SubCategoria,
      VTS.Moneda_Transaccion,
      D_MC.Moneda_Conversion,
      Cantidad,
      Monto_MXN,
      Monto_Transaccion,
      D_TC.Tipo_Cambio,
      D_TC.Tipo_Cambio_AVG_mensual,
      D_TC.Tipo_Cambio_AVG_anual,
      D_TC.Tipo_Cambio_AVG_mensual_LY,
      D_TC.Tipo_Cambio_AVG_anual_LY,
      D_D.Tipo_Cambio as Tipo_Cambio_SA
      FROM VTS cross join D_MC
      left join D_TC ON VTS.Moneda_Transaccion = D_TC.Moneda_Origen
      and D_MC.Moneda_Conversion = D_TC.Moneda_Conversion
      and VTS.Tipo_Transaccion = D_TC.Presupuesto
      left join D_D ON VTS.Moneda_Transaccion = D_D.Moneda_Origen
      and D_MC.Moneda_Conversion = D_D.Moneda_Conversion
      and VTS.Tipo_Transaccion = D_D.Presupuesto
      and VTS.Fecha = D_D.Fecha
      ;;
  }

  dimension: id_fuente {
    hidden: no
    label: "Fuente"
    type: string
    sql: ${TABLE}.ID_Fuente ;;
  }

  dimension: tipo_transaccion {
    type: string
    sql: ${TABLE}.Tipo_Transaccion ;;
  }

  dimension: fecha {
    #hidden: yes
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

  dimension: codigo_canal_distribucion {
    hidden: yes
    type: string
    sql: ${TABLE}.Canal_Distribucion ;;
  }

  dimension: canal_distribucion {
    type: string
    sql: CASE
          WHEN ${TABLE}.Canal_Distribucion IN ('00','10','50','80') THEN 'Nacional'
          ELSE 'Exportacion'
          END ;;
  }

  dimension: codigo_material {
    group_label: "Material"
    #hidden: yes
    type: string
    sql: ${TABLE}.Material ;;
  }

  dimension: descripcion_material {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Descripcion_Material ;;
  }

  dimension: grupo_material {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Grupo_Material ;;
  }

  dimension: descripcion_grupo_material {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Descripcion_Grupo_Material ;;
  }

  dimension: jerarquia {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Jerarquia ;;
  }

  dimension: dimensiones {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Dimensiones ;;
  }

  dimension: id_planta {
    group_label: "Planta"
    label: "Planta"
    hidden: no
    type: string
    sql: ${TABLE}.Planta ;;
  }

  dimension: nombre_planta {
    group_label: "Planta"
    type: string
    sql: ${TABLE}.Nombre_Planta ;;
  }

  dimension: ciudad {
    group_label: "Planta"
    type: string
    sql: ${TABLE}.Ciudad ;;
  }

  dimension: pais {
    group_label: "Planta"
    type: string
    sql: ${TABLE}.Pais ;;
  }

  dimension: cluster {
    group_label: "Planta"
    label: "CLUSTER"
    type: string
    sql: ${TABLE}.Cluster ;;
  }

  dimension: region {
    group_label: "Planta"
    type: string
    sql: ${TABLE}.Region ;;
  }


  dimension: codigo_cliente {
    group_label: "Cliente"
    hidden: yes
    type: string
    sql: ${TABLE}.Cliente ;;
  }

  dimension: nombre_cliente {
    group_label: "Cliente"
    type: string
    label: "CLIENT"
    sql: ${TABLE}.Nombre_Cliente ;;
  }

  dimension: pais_cliente {
    group_label: "Cliente"
    type: string
    sql: ${TABLE}.Pais_Cliente ;;
  }

  dimension: ciudad_cliente {
    group_label: "Cliente"
    type: string
    sql: ${TABLE}.Ciudad_Cliente ;;
  }

  dimension: grupo_cliente {
    group_label: "Cliente"
    type: string
    sql: ${TABLE}.Grupo_Cliente ;;
  }

  dimension: corporativo {
    group_label: "Cliente"
    label: "Corporate"
    type: string
    sql: ${TABLE}.Corporativo ;;
  }

  dimension: destinatario {
    group_label: "Destinatario"
    hidden: yes
    type: string
    sql: ${TABLE}.Destinatario ;;
  }

  dimension: nombre_destinatario {
    group_label: "Destinatario"
    type: string
    sql: ${TABLE}.Nombre_Destinatario ;;
  }

  dimension: pais_destinatario {
    group_label: "Destinatario"
    type: string
    sql: ${TABLE}.Pais_Destinatario ;;
  }

  dimension: pais_destinatario_ {
    group_label: "Destinatario"
    label: "Addressee Country"
    type: string
    sql: CASE
           WHEN ${TABLE}.Pais_Destinatario IS NULL THEN 'Undefined'
           WHEN ${TABLE}.Pais_Destinatario = '' THEN 'Undefined'
           ELSE ${TABLE}.Pais_Destinatario
         END ;;
  }

  dimension: ciudad_destinatario {
    group_label: "Destinatario"
    type: string
    sql: ${TABLE}.Ciudad_Destinatario ;;
  }

  dimension: organizacion_ventas {
    type: string
    sql: ${TABLE}.Organizacion_Ventas ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.Division ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.Sector ;;
  }

  dimension: unidad_base {
    type: string
    sql: ${TABLE}.Unidad_Base ;;
  }

  dimension: categoria_global {
    label: "GLOBAL CATEGORY"
    type: string
    sql: ${TABLE}.Categoria_Global ;;
  }

  dimension: categoria {
    label: "CATEGORY"
    type: string
    sql: ${TABLE}.Categoria ;;
  }

  dimension: subcategoria {
    label: "SUBCATEGORY"
    type: string
    sql: ${TABLE}.SubCategoria ;;

  }

  dimension: moneda_transaccion {
    type: string
    sql: ${TABLE}.Moneda_Transaccion ;;
  }

  dimension: moneda_conversion {
    type: string
    sql: ${TABLE}.Moneda_Conversion ;;
  }

  dimension: FCURR {
    label: "CURRENCY TYPE"
    type: string
    sql: ${moneda_transaccion} ;;
  }

  dimension: cantidad {
    hidden: yes
    type: number
    sql: ${TABLE}.Cantidad /1000 ;;
  }

  dimension: monto_transaccion {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion / 1000
      ;;
  }

  dimension: monto_mxn {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Conversion_MXN /1000 ;;
  }

  dimension: fecha_seleccionada {
    #hidden: yes
    label: "Data of the day"
    type: string
    sql: CAST({% date_start date_filter %} AS DATE) ;;
  }

  #Filtros y parametros

  filter: date_filter {
    label: "Date"
    type: date
  }

  filter: tipo_transaccion_vta_nac {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Venta')
      and ${canal_distribucion} in ('Nacional') ;;
  }

  filter: tipo_transaccion_vta_exp {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Venta')
      and ${canal_distribucion} in ('Exportacion') ;;
  }

  filter: tipo_transaccion_pre_nac {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Presupuesto')
      and ${canal_distribucion} in ('Nacional') ;;
  }

  filter: tipo_transaccion_pre_exp {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Presupuesto')
      and ${canal_distribucion} in ('Exportacion') ;;
  }

  #DAY
  dimension: filtro_dia {
    hidden: yes
    type: yesno
    sql: ${fecha} = CAST({% date_start date_filter %} AS DATE) ;;
  }

  #MTD
  dimension: filtro_mtd {
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;
  }

  dimension: filtro_mtd_ly {
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

  #Filtro personalizado

  dimension: filtro_desde_hasta{
    description: "Filtro para acotar la información de acuerdo a la fecha seleccionada en el reporte, Sales by month"
    type: number
    sql: CASE
            --WHEN DATE_TRUNC(CAST(${dates_date} AS DATE),DAY) >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %}))-2 AS STRING),"-01-01")  AS DATE)
            WHEN DATE_TRUNC(CAST(${dates_date} AS DATE),DAY) >= CAST({% date_start date_filter %} AS DATE)
            AND DATE_TRUNC(CAST(${dates_date} AS DATE),DAY) <= CAST({% date_end date_filter %} AS DATE) THEN 1
            ELSE 0
           END ;;
  }


################### dimensiones_tipo_cambio


  dimension: tc_diario {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio ;;

    value_format: "#,##0.00"
  }

  dimension: tc_diario_sa {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_SA ;;

    value_format: "#,##0.00"
  }

  dimension: tc_mtd {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_AVG_mensual ;;

    value_format: "#,##0.00"
  }

  dimension: tc_mtd_ly {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_AVG_mensual_LY ;;

    value_format: "#,##0.00"
  }

  dimension: tc_ytd {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_AVG_anual ;;

    value_format: "#,##0.00"
  }

  dimension: tc_ytd_ly {
    hidden: yes
    type: number
    sql: ${TABLE}.Tipo_Cambio_AVG_anual_LY ;;

    value_format: "#,##0.00"
  }


################### termina dimensiones_tipo_cambio


####### metricas_tipo_cambio

  measure: m_tc_diario {
    group_label: "ER"
    label: "ER"
    type: max
    sql: ${tc_diario} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_mtd {
    group_label: "ER"
    label: "ER MTH"
    type: max
    sql: ${tc_mtd} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_mtd_ly {
    group_label: "ER"
    label: "ER MTH LYR"
    type: max
    sql: ${tc_mtd_ly} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_ytd {
    group_label: "ER"
    label: "ER YR"
    type: max
    sql: ${tc_ytd} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_ytd_ly {
    group_label: "ER"
    label: "ER LYR"
    type: max
    sql: ${tc_ytd_ly} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_bud_mtd {
    group_label: "ER"
    label: "ER BUD"
    type: max
    sql: ${tc_mtd} ;;

    filters: [tipo_transaccion: "Presupuesto"]

    value_format: "#,##0.00"
  }

  measure: m_tc_bud_ytd {
    group_label: "ER"
    hidden: yes
    label: "ER BUD YR"
    type: max
    sql: ${tc_ytd} ;;

    filters: [tipo_transaccion: "Presupuesto"]

    value_format: "#,##0.00"
  }

####### termina metricas_tipo_cambio

################### metricas



  measure: ultima_actualizacion {
    hidden: yes
    group_label: "Others"
    label: "Update date"
    type: date
    sql: MAX(${fecha});;
    convert_tz: no
  }

  measure: daily_sales {
    #hidden: yes
    group_label: "Daily"
    label: "DAILY SALES"
    type: sum
    sql: ${monto_transaccion} * ${tc_diario} ;;

    filters: {
      field: filtro_dia
      value: "yes"
    }

    filters: [tipo_transaccion: "Venta"]

    drill_fields: [ nombre_cliente,daily_sales]

    value_format: "$#,##0.00"
  }


  measure: daily_sales_qty {
    group_label: "Daily"
    label: "DAILY SALES (QTY)"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_dia
      value: "yes"
    }

    filters: [tipo_transaccion: "Venta"]

    drill_fields: [ nombre_cliente,daily_sales_qty]

    value_format: "#,##0"
  }

  measure: daily_bud_sales {
    hidden: yes
    group_label: "Daily"
    label: "DAILY BUD SALES"
    type: sum
    sql: ${monto_transaccion} * ${tc_diario} ;;

    filters: {
      field: filtro_dia
      value: "yes"
    }

    filters: [tipo_transaccion: "Presupuesto"]

    drill_fields: [ nombre_cliente,daily_bud_sales]

    value_format: "$#,##0.00"
  }

  measure: daily_amount {
    group_label: "Non-accumulated"
    type: sum
    sql: ${monto_transaccion} * ${tc_diario_sa}  ;;

    filters: [tipo_transaccion: "Venta"]

    drill_fields: [ nombre_cliente,daily_amount]

    value_format: "$#,##0.00"

  }

  measure: month_amount {
    group_label: "Non-accumulated"
    label: "Sales"
    type: sum
    sql: ${monto_transaccion} * ${tc_diario_sa}  ;;

    filters: [tipo_transaccion: "Venta"]

    link: {
      label: "Plant Country - Addressee Country"
      url: "https://envasesdirectoaddon.cloud.looker.com/dashboards/129?Date={{ _filters['ventas_consolidado.date_filter'] | url_encode }}&Region={{ _filters['ventas_consolidado.region'] | url_encode }}&Cluster={{ _filters['ventas_consolidado.cluster'] | url_encode }}&Country={{ _filters['ventas_consolidado.pais'] | url_encode }}&Sales+Org={{ _filters['ventas_consolidado.organizacion_ventas'] | url_encode }}&Plant={{ _filters['ventas_consolidado.nombre_planta'] | url_encode }}&Client={{ _filters['ventas_consolidado.nombre_cliente'] | url_encode }}&Category={{ _filters['ventas_consolidado.categoria'] | url_encode }}&Global+Category={{ _filters['ventas_consolidado.categoria_global'] | url_encode }}&Addressee+Country={{ ventas_consolidado.pais_destinatario_._value | url_encode }}&Currency={{ _filters['ventas_consolidado.moneda_conversion'] | url_encode }}"

    }

    link: {
      label: "Cluster - Addressee Country"
      url: "https://envasesdirectoaddon.cloud.looker.com/dashboards/128?Date={{ _filters['ventas_consolidado.date_filter'] | url_encode }}&Region={{ _filters['ventas_consolidado.region'] | url_encode }}&Cluster={{ _filters['ventas_consolidado.cluster'] | url_encode }}&Country={{ _filters['ventas_consolidado.pais'] | url_encode }}&Sales+Org={{ _filters['ventas_consolidado.organizacion_ventas'] | url_encode }}&Plant={{ _filters['ventas_consolidado.nombre_planta'] | url_encode }}&Client={{ _filters['ventas_consolidado.nombre_cliente'] | url_encode }}&Category={{ _filters['ventas_consolidado.categoria'] | url_encode }}&Global+Category={{ _filters['ventas_consolidado.categoria_global'] | url_encode }}&Addressee+Country={{ ventas_consolidado.pais_destinatario_._value | url_encode }}&Currency={{ _filters['ventas_consolidado.moneda_conversion'] | url_encode }}"
    }

    #drill_fields: [ nombre_cliente,month_amount]

    value_format: "$#,##0.00"

  }

  measure: daily_quantity {
    group_label: "Non-accumulated"
    type: sum
    sql: ${cantidad};;

    filters: [tipo_transaccion: "Venta"]

    drill_fields: [ nombre_cliente,daily_quantity]

    value_format: "#,##0"
  }

  measure: daily_bud_amount {
    group_label: "Non-accumulated"
    type: sum
    sql: ${monto_transaccion} * ${tc_diario_sa} ;;

    filters: [tipo_transaccion: "Presupuesto"]

    drill_fields: [ nombre_cliente,daily_bud_amount]

    value_format: "$#,##0.00"

  }

  measure: daily_bud_quantity {
    group_label: "Non-accumulated"
    type: sum
    sql: ${cantidad};;

    filters: [tipo_transaccion: "Presupuesto"]

    drill_fields: [ nombre_cliente,daily_bud_quantity]

    value_format: "#,##0"
  }


  #MONTHLY-MONEY-MTD

  measure: national_amount_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL AMOUNT MTD"
    type: sum
    sql: ${monto_transaccion} * ${tc_mtd} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente,national_amount_mtd]

    value_format: "$#,##0.00"
  }

  measure: export_amount_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT AMOUNT MTD"
    type: sum
    sql: ${monto_transaccion} * ${tc_mtd} ;;


    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    drill_fields: [ nombre_cliente,export_amount_mtd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_mtd {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD"
    type: number
    sql: ${national_amount_mtd} + ${export_amount_mtd} ;;

    drill_fields: [ nombre_cliente,total_amount_mtd, total_amount_bud_mtd, vs_total_bud_mtd ]

    value_format: "$#,##0.00"
  }

  measure: total_amount_mtd_by_client {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD_"
    type: number
    sql: ${total_amount_mtd} ;;

    drill_fields: [ categoria, total_amount_mtd, total_amount_bud_mtd, vs_total_bud_mtd ]

    value_format: "$#,##0.00"
  }

  measure: national_amount_mtd_ly{
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL AMOUNT MTD LY"
    type: sum
    sql: ${monto_transaccion} * ${tc_mtd_ly} ;;

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente,national_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure: export_amount_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT AMOUNT MTD LY"

    type: sum
    sql: ${monto_transaccion} * ${tc_mtd_ly} ;;

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente,export_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_mtd_ly {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD LY"
    type: number
    sql: ${national_amount_mtd_ly} + ${export_amount_mtd_ly} ;;

    drill_fields: [ nombre_cliente, total_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL AMOUNT MTD LY"
    type: number
    sql: CASE
          WHEN ${total_amount_mtd} > 0 AND ${total_amount_mtd_ly} = 0 THEN 1
          WHEN ${total_amount_mtd} = 0 AND ${total_amount_mtd_ly} > 0 THEN -1
          WHEN (${total_amount_mtd} /  NULLIF (${total_amount_mtd_ly},0))-1 = 0 THEN 0
          ELSE (${total_amount_mtd} /  NULLIF (${total_amount_mtd_ly},0))-1
         END *100
        ;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_amount_mtd_ly, total_amount_mtd, total_amount_mtd_ly]
  }


  measure: z_national_amount_bud_mtd{
    hidden: yes
    group_label: "Monthly"
    label: "Z NATIONAL AMOUNT BUD MTD"
    type: sum
    sql: ${monto_transaccion} * ${tc_mtd} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, z_national_amount_bud_mtd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "Z EXPORT AMOUNT BUD MTD"

    type: sum
    sql: ${monto_transaccion} * ${tc_mtd} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, z_export_amount_bud_mtd]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_mtd{
    group_label: "Monthly"
    label: "TOTAL AMOUNT BUD MTD"
    type: number
    sql: ${z_national_amount_bud_mtd} + ${z_export_amount_bud_mtd} ;;

    drill_fields: [ nombre_cliente, total_amount_bud_mtd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL BUD MTD"
    type: number
    sql: CASE
          WHEN ${total_amount_mtd} > 0 AND ${total_amount_bud_mtd} = 0 THEN 1
          WHEN ${total_amount_mtd} = 0 AND ${total_amount_bud_mtd} > 0 THEN -1
          WHEN (${total_amount_mtd} /  NULLIF (${total_amount_bud_mtd},0))-1=-1 THEN 0
          ELSE (${total_amount_mtd} /  NULLIF (${total_amount_bud_mtd},0))-1
         END * 100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente,vs_total_bud_mtd,total_amount_mtd,total_amount_bud_mtd]

  }

  measure: vs_total_bud_mtd_ {
    group_label: "Monthly"
    label: "% VS TOTAL BUD MTD_"
    type: number
    sql: CASE
          WHEN ${total_amount_bud_mtd} = 0 AND ${total_amount_mtd} = 0
          THEN 0
          WHEN ${total_amount_bud_mtd} = 0 AND ${total_amount_mtd} > 0
          THEN 1
          ELSE ${total_amount_mtd}/ NULLIF(${total_amount_bud_mtd},1)
         END * 100;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_bud_mtd_, total_amount_mtd, total_amount_bud_mtd]
  }

  #MONTHLY-QUANTITY-MTD

  measure: national_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_mtd]

    value_format: "#,##0"
  }

  measure: export_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_mtd]
    value_format: "#,##0"
  }

  measure: total_qty_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY MTD"
    type: number
    sql: ${national_qty_mtd} + ${export_qty_mtd} ;;
    drill_fields: [ nombre_cliente, total_qty_mtd]
    value_format: "#,##0"
  }

  measure: national_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_mtd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD LY"
    type: sum
    sql: ${cantidad};;


    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_mtd_ly {
    #hidden: yes
    group_label: "Monthly"
    label: "TOTAL QTY MTD LY"
    type: number
    sql: ${national_qty_mtd_ly} + ${export_qty_mtd_ly} ;;

    drill_fields: [ nombre_cliente, total_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL QTY MTD LY"
    type: number
    sql: CASE
          WHEN ${total_qty_mtd} > 0 AND ${total_qty_mtd_ly} = 0 THEN 1
          WHEN ${total_qty_mtd} = 0 AND ${total_qty_mtd_ly} > 0 THEN -1
          WHEN (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1  = 0 THEN 0
          ELSE (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_qty_mtd_ly,total_qty_mtd,total_qty_mtd_ly]

  }

  measure: national_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }


    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_bud_mtd]
  }

  measure: export_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_bud_mtd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY BUD MTD"
    type: number
    sql: ${national_qty_bud_mtd} + ${export_qty_bud_mtd} ;;

    drill_fields: [ nombre_cliente, total_qty_bud_mtd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL QTY BUD MTD"
    type: number
    sql: CASE
          WHEN ${total_qty_mtd} > 0 AND ${total_qty_bud_mtd} = 0 THEN 1
          WHEN ${total_qty_mtd} = 0 AND ${total_qty_bud_mtd} > 0 THEN -1
          WHEN (${total_qty_mtd} /  NULLIF (${total_qty_bud_mtd},0))-1= 0 THEN 0
          ELSE (${total_qty_mtd} /  NULLIF (${total_qty_bud_mtd},0))-1
         END *100 ;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_qty_bud_mtd,total_qty_mtd,total_qty_bud_mtd]

  }


  #ANNUAL-MONEY-YTD

  measure: national_amount_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL AMOUNT YTD"
    type: sum
    sql: ${monto_transaccion} * ${tc_ytd} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente,national_amount_ytd]

    value_format: "$#,##0.00"
  }

  measure: export_amount_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT AMOUNT YTD"
    type: sum
    sql: ${monto_transaccion} * ${tc_ytd} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente,export_amount_ytd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_ytd {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD"
    type: number
    sql: ${national_amount_ytd} + ${export_amount_ytd} ;;

    drill_fields: [ nombre_cliente,total_amount_ytd, total_amount_bud_ytd, vs_total_bud_ytd ]

    value_format: "$#,##0.00"
  }

  measure: total_amount_ytd_by_client {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD_"
    type: number
    sql: ${total_amount_ytd} ;;

    drill_fields: [ categoria, total_amount_ytd, total_amount_bud_ytd, vs_total_bud_ytd ]

    value_format: "$#,##0.00"
  }

  measure: national_amount_ytd_ly{
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL AMOUNT YTD LY"
    type: sum
    sql: ${monto_transaccion} * ${tc_ytd_ly} ;;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }


    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente,national_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure: export_amount_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT AMOUNT YTD LY"

    type: sum
    sql: ${monto_transaccion} * ${tc_ytd_ly} ;;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }


    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente,export_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_ytd_ly {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD LY"
    type: number
    sql: ${national_amount_ytd_ly} + ${export_amount_ytd_ly} ;;

    drill_fields: [ nombre_cliente, total_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL AMOUNT YTD LY"
    type: number
    sql: CASE
          WHEN ${total_amount_ytd} > 0 AND ${total_amount_ytd_ly} = 0 THEN 1
          WHEN ${total_amount_ytd} = 0 AND ${total_amount_ytd_ly} > 0 THEN -1
          WHEN (${total_amount_ytd} /  NULLIF (${total_amount_ytd_ly},0))-1 = 0 THEN 0
          ELSE (${total_amount_ytd} /  NULLIF (${total_amount_ytd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_amount_ytd_ly, total_amount_ytd, total_amount_ytd_ly]
  }

  measure: z_national_amount_bud_ytd{
    hidden: yes
    group_label: "Annual"
    label: "Z NATIONAL AMOUNT BUD YTD"
    type: sum
    sql: ${monto_transaccion} * ${tc_ytd} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, z_national_amount_bud_ytd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "Z EXPORT AMOUNT BUD YTD"

    type: sum
    sql: ${monto_transaccion} * ${tc_ytd} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, z_export_amount_bud_ytd]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_ytd{
    group_label: "Annual"
    label: "TOTAL AMOUNT BUD YTD"
    type: number
    sql: ${z_national_amount_bud_ytd} + ${z_export_amount_bud_ytd} ;;

    drill_fields: [ nombre_cliente, total_amount_bud_ytd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL BUD YTD"
    type: number
    sql: CASE
          WHEN ${total_amount_ytd} > 0 AND ${total_amount_bud_ytd} = 0 THEN 1
          WHEN ${total_amount_ytd} = 0 AND ${total_amount_bud_ytd} > 0 THEN -1
          WHEN (${total_amount_ytd} /  NULLIF (${total_amount_bud_ytd},0))-1=-1 THEN 0
          ELSE (${total_amount_ytd} /  NULLIF (${total_amount_bud_ytd},0))-1
         END * 100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente,vs_total_bud_ytd,total_amount_ytd,total_amount_bud_ytd]

  }

  measure: vs_total_bud_ytd_ {
    group_label: "Annual"
    label: "% VS TOTAL BUD YTD_"
    type: number
    sql: CASE
          WHEN ${total_amount_bud_ytd} = 0 AND ${total_amount_ytd} = 0
          THEN 0
          WHEN ${total_amount_bud_ytd} = 0 AND ${total_amount_ytd} > 0
          THEN 1
          ELSE ${total_amount_ytd}/ NULLIF(${total_amount_bud_ytd},1)
         END * 100;;


    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_bud_ytd_, total_amount_ytd, total_amount_bud_ytd]
  }



  #ANNUAL-QUANTITY-YTD

  measure: national_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_ytd]

    value_format: "#,##0"
  }

  measure: export_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_ytd]
    value_format: "#,##0"
  }

  measure: total_qty_ytd {
    group_label: "Annual"
    label: "TOTAL QTY YTD"
    type: number
    sql: ${national_qty_ytd} + ${export_qty_ytd} ;;
    drill_fields: [ nombre_cliente, total_qty_ytd]
    value_format: "#,##0"
  }

  measure: national_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_ytd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_ytd_ly {
    #hidden: yes
    group_label: "Annual"
    label: "TOTAL QTY YTD LY"
    type: number
    sql: ${national_qty_ytd_ly} + ${export_qty_ytd_ly} ;;

    drill_fields: [ nombre_cliente, total_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL QTY YTD LY"
    type: number
    sql: CASE
          WHEN ${total_qty_ytd} > 0 AND ${total_qty_ytd_ly} = 0 THEN 1
          WHEN ${total_qty_ytd} = 0 AND ${total_qty_ytd_ly} > 0 THEN -1
          WHEN (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1 = 0 THEN 0
          ELSE (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_qty_ytd_ly,total_qty_ytd,total_qty_ytd_ly]

  }

  measure: national_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_bud_ytd]
  }

  measure: export_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_bud_ytd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_ytd {
    group_label: "Annual"
    label: "TOTAL QTY BUD YTD"
    type: number
    sql: ${national_qty_bud_ytd} + ${export_qty_bud_ytd} ;;

    drill_fields: [ nombre_cliente, total_qty_bud_ytd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL QTY BUD YTD"
    type: number
    sql: CASE
          WHEN ${total_qty_ytd} > 0 AND ${total_qty_bud_ytd} = 0 THEN 1
          WHEN ${total_qty_ytd} = 0 AND ${total_qty_bud_ytd} > 0 THEN -1
          WHEN (${total_qty_ytd} /  NULLIF (${total_qty_bud_ytd},0))-1= 0 THEN 0
          ELSE (${total_qty_ytd} /  NULLIF (${total_qty_bud_ytd},0))-1
         END *100 ;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_qty_bud_ytd,total_qty_ytd,total_qty_bud_ytd]

  }

  measure: amount_bud_mtd_converted {
    group_label: "Budget monitor"
    label: "Amount bud MTD - {{ _filters['ventas_consolidado.moneda_conversion'] }}"
    type: sum
    sql: ${monto_transaccion} * ${tc_mtd};;

    filters: [tipo_transaccion: "Presupuesto"]

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    value_format_name: "usd"

  }

  measure: amount_bud_ytd_converted {
    group_label: "Budget monitor"
    label: "Amount bud YTD  - {{ _filters['ventas_consolidado.moneda_conversion'] }}"
    type: sum
    sql: ${monto_transaccion} * ${tc_mtd};;

    filters: [tipo_transaccion: "Presupuesto"]

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    value_format_name: "usd"

  }

  measure: amount_bud_mtd {
    group_label: "Budget monitor"
    label: "Amount bud MTD"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: [tipo_transaccion: "Presupuesto"]

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    value_format_name: "usd"

  }

  measure: amount_bud_ytd {
    group_label: "Budget monitor"
    label: "Amount bud YTD"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: [tipo_transaccion: "Presupuesto"]

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    value_format_name: "usd"

  }

  measure: dias_habiles_mtd {
    group_label: "Budget monitor"
    label: "Dias habiles MTD"
    type: count_distinct
    sql: ${fecha} ;;

    value_format_name: "decimal_0"

    filters: [tipo_transaccion: "Presupuesto"]

    filters: {
      field: filtro_mtd
      value: "yes"
    }

  }

  measure: dias_habiles_ytd {
    group_label: "Budget monitor"
    label: "Dias habiles YTD"
    type: count_distinct
    sql: ${fecha} ;;

    value_format_name: "decimal_0"

    filters: [tipo_transaccion: "Presupuesto"]

    filters: {
      field: filtro_ytd
      value: "yes"
    }

  }

  measure: monto_dia_mtd {
    group_label: "Budget monitor"
    label: "Monto p / dia MTD"
    type: number
    sql: SAFE_DIVIDE( ${amount_bud_mtd} , ${dias_habiles_mtd} ) ;;

    value_format_name: "usd"

  }

  measure: monto_dia_ytd {
    group_label: "Budget monitor"
    label: "Monto p / dia YTD"
    type: number
    sql: SAFE_DIVIDE( ${amount_bud_ytd} , ${dias_habiles_ytd} ) ;;

    value_format_name: "usd"

  }

}
