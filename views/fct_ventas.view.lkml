view: ventas {

  derived_table: {
    sql:
       SELECT
        ID_FUENTE,
        DOCUMENTO,
        POSICION,
        TIPO_TRANSACCION,
        TIPO_DOCUMENTO,
        FECHA,
        CANAL_DISTRIBUCION,
        MATERIAL,
        PLANTA,
        CLIENTE,
        DESTINATARIO,
        ORGANIZACION_VENTAS,
        OFICINA_VENTAS,
        UNIDAD_BASE,
        CATEGORIA,
        SUBCATEGORIA,
        MONEDA_TRANSACCION,
        CANTIDAD,
        MONTO_TRANSACCION,
        TIPO_CAMBIO,
        MONTO_MXN
        FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_fct_ventas`
        UNION ALL
        SELECT
        v.ID_FUENTE,
        '' AS DOCUMENTO,
        '' AS POSICION,
        v.TIPO_TRANSACCION,
        '' AS TIPO_DOCUMENTO,
        v.FECHA,
        v.CANAL_DISTRIBUCION,
        '' AS MATERIAL,
        v.PLANTA,
        '' AS CLIENTE,
        '' AS DESTINATARIO,
        '' AS ORGANIZACION_VENTAS,
        '' AS OFICINA_VENTAS,
        '' AS UNIDAD_BASE,
        'TOTAL USD' AS CATEGORIA,
        '' AS SUBCATEGORIA,
        '' AS MONEDA_TRANSACCION,
        0 AS CANTIDAD,
        SUM(v.MONTO_TRANSACCION * cast(t.Tipo_Cambio as numeric) ) AS MONTO_TRANSACCION,
        0 TIPO_CAMBIO,
        0 MONTO_MXN
        FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_fct_ventas` v left join (SELECT
        ID_Fuente,
        Fecha,
        Moneda_Origen,
        Moneda_Conversion,
        Tipo_Cambio
        FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_dim_tipo_cambio`
        where Moneda_Origen IN ('MXN', 'EUR', 'DKK', 'GTQ', 'CAD')
        AND Moneda_Conversion IN ('USD') ) t on v.fecha = t.fecha and v.MONEDA_TRANSACCION = t.Moneda_Origen
        GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,21
        UNION ALL
        SELECT
        v.ID_FUENTE,
        '' AS DOCUMENTO,
        '' AS POSICION,
        v.TIPO_TRANSACCION,
        '' AS TIPO_DOCUMENTO,
        v.FECHA,
        v.CANAL_DISTRIBUCION,
        '' AS MATERIAL,
        v.PLANTA,
        '' AS CLIENTE,
        '' AS DESTINATARIO,
        '' AS ORGANIZACION_VENTAS,
        '' AS OFICINA_VENTAS,
        '' AS UNIDAD_BASE,
        'TOTAL EUR' AS CATEGORIA,
        '' AS SUBCATEGORIA,
        '' AS MONEDA_TRANSACCION,
        0 AS CANTIDAD,
        SUM(v.MONTO_TRANSACCION * cast(t.Tipo_Cambio as numeric) ) AS MONTO_TRANSACCION,
        0 TIPO_CAMBIO,
        0 MONTO_MXN
        FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_fct_ventas` v left join (SELECT
        ID_Fuente,
        Fecha,
        Moneda_Origen,
        Moneda_Conversion,
        Tipo_Cambio
        FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_dim_tipo_cambio`
        where Moneda_Origen IN ('MXN', 'USD', 'DKK', 'GTQ', 'CAD')
        AND Moneda_Conversion IN ('EUR') ) t on v.fecha = t.fecha and v.MONEDA_TRANSACCION = t.Moneda_Origen
        GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,21
       ;;
  }

  dimension: id_fuente {
    hidden: yes
    type: string
    sql: ${TABLE}.ID_FUENTE ;;
  }

  dimension: documento {
    hidden: yes
    type: string
    sql: ${TABLE}.DOCUMENTO ;;
  }

  dimension: posicion {
    hidden: yes
    type: string
    sql: ${TABLE}.POSICION ;;
  }

  dimension: tipo_transaccion {
    type: string
    sql: ${TABLE}.TIPO_TRANSACCION ;;
  }

  dimension: tipo_documento {
    hidden: yes
    type: string
    sql: ${TABLE}.TIPO_DOCUMENTO ;;
  }

  dimension: fecha {
    hidden: yes
    type: date
    sql: ${TABLE}.FECHA ;;
  }

  dimension: canal_distribucion {
    type: string
    sql: ${TABLE}.CANAL_DISTRIBUCION ;;
  }

  dimension: material {
    hidden: yes
    type: string
    sql: ${TABLE}.MATERIAL ;;
  }

  dimension: planta {
    hidden: yes
    type: string
    sql: ${TABLE}.PLANTA ;;
  }

  dimension: cliente {
    hidden: yes
    type: string
    sql: ${TABLE}.CLIENTE ;;
  }

  dimension: destinatario {
    hidden: yes
    type: string
    sql: ${TABLE}.DESTINATARIO ;;
  }

  dimension: organizacion_ventas {
    type: string
    sql: ${TABLE}.ORGANIZACION_VENTAS ;;
  }

  dimension: oficina_ventas {
    type: string
    sql: ${TABLE}.OFICINA_VENTAS ;;
  }

  dimension: unidad_base {
    type: string
    sql: ${TABLE}.UNIDAD_BASE ;;
  }


  dimension: categoria {
    label: "CATEGORY"
    type: string
    sql: ${TABLE}.CATEGORIA ;;

    html: {% if value == 'TOTAL LOCAL CURRENCY USD' or
          value == 'TOTAL LOCAL CURRENCY DKK' or
          value == 'TOTAL LOCAL CURRENCY EUR' or
          value == 'TOTAL LOCAL CURRENCY GTQ' or
          value == 'TOTAL LOCAL CURRENCY CAD' or
          value == 'TOTAL MXN' or
          value == 'TOTAL USD' or
          value == 'TOTAL EUR'
          %}
        <p style="color: white; background-color: #5e2129; font-size:100%; text-align:left">{{ rendered_value }}</p>

      {% elsif
      value != 'CP 19L' and
      value != 'CP 15L' and
      value != 'CP 10L' and
      value != 'CP 08L' and
      value != 'CP 04L' and

      value != 'Club (Alu)' and
      value != 'Club (Steel)' and
      value != 'Hansa' and
      value != 'Dingley' and
      value != 'Round Fish' and
      value != 'Fish - Other' and
      value != 'Draught Kegs' and
      value != 'Gravity Kegs' and
      value != 'Beverage Miscellaneous' and
      value != 'Tin Cans' and
      value != 'Vacuum Ink' and
      value != 'Pails' and
      value != 'Hobbocks' and
      value != 'Square' and
      value != 'Miscellaneous' and
      value != 'Plastic' and
      value != 'Industrial - Others' and

      value != 'Fish - 1/2 Oval' and
      value != 'Fish - 1/4 Oval' and
      value != 'Fish - 127' and
      value != 'Fish - 150' and
      value != 'Fish - 153' and
      value != 'Fish - 65' and
      value != 'Fish - 73' and
      value != 'Fish - 83' and
      value != 'Fish - 99' and
      value != 'Fish - Anchoas' and
      value != 'Fish - Club' and
      value != 'Fish - Goods for Resale' and
      value != 'Fish - Others' and
      value != 'Fish - Pails' and
      value != 'Fish - RR90' and

      value != 'Vegetables - 153' and
      value != 'Vegetables - 65' and
      value != 'Vegetables - 73' and
      value != 'Vegetables - 83' and
      value != 'Vegetables - 99' and
      value != 'Vegetables - Club' and
      value != 'Vegetables - Goods for Resale' and
      value != 'Vegetables - Others' and

      value != 'Industrial - 73' and
      value != 'Industrial - 99' and
      value != 'Industrial - General Line' and
      value != 'Industrial - Goods for Resale' and
      value != 'Industrial - Others' and
      value != 'Industrial - Pails' and

      value != 'Print and Coating Services - Goods for Resale' and
      value != 'Print and Coating Services - Others' and
      value != 'Print and Coating Services - Pails'

      %}
      <p style="color: black; font-weight: bold; font-size:100%; text-align:left">{{ rendered_value }}</p>

      {% else %}
      <p style="">{{ rendered_value }}</p>
      {% endif %} ;;

    order_by_field: orden_categoria
  }

  dimension: orden_categoria {
    type: number
    sql: CASE
         WHEN ${TABLE}.CATEGORIA NOT IN ('TOTAL USD', 'TOTAL EUR')
         THEN 10
         ELSE 200
         END ;;
  }

  dimension: subcategoria {
    label: "SUBCATEGORY"
    type: string
    sql: ${TABLE}.SUBCATEGORIA ;;
  }

  dimension: moneda_transaccion {
    label: "CURRENCY TYPE"
    type: string
    sql: ${TABLE}.MONEDA_TRANSACCION ;;
  }

  dimension: cantidad {
    hidden: yes
    type: number
    sql: ${TABLE}.CANTIDAD /1000 ;;
  }

  dimension: monto_transaccion {
    hidden: yes
    type: number
    sql: ${TABLE}.MONTO_TRANSACCION /1000 ;;
  }

  dimension: tipo_cambio {
    type: number
    sql: ${TABLE}.TIPO_CAMBIO ;;
  }

  dimension: monto_mxn {
    hidden: yes
    type: number
    sql: ${TABLE}.MONTO_MXN /1000 ;;
  }

  dimension: fecha_seleccionada {
    label: "Date filter"
    type: string
    sql: CAST({% date_start date_filter %} AS DATE) ;;
  }

  #Atributos de dimensiones

  dimension: nombre_cliente {
    hidden: yes
    type: string
    label: "CLIENT"
    sql: ${cliente.nombre} ;;
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
  dimension: is_previous_period{
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)  ;;
  }

  dimension: is_current_period{
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;
  }

  #YTD
  dimension: is_current_year {
    hidden: yes
    type: yesno
    sql: ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      and  ${fecha} <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)   ;;
  }

  dimension: is_previous_year {
    hidden: yes
    type: yesno
    sql: ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      and  ${fecha} <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)   ;;
  }

  #metricas

  measure: empty_value1 {
    label: "Empty value 1"
    type: string
    sql: '';;
  }

  measure: empty_value2 {
    label: "Empty value 2"
    type: string
    sql: '';;
  }

  measure: ultima_actualizacion {
    type: date
    label: "Update date"
    sql: MAX(${fecha});;
    convert_tz: no
  }

  measure: s_tipo_cambio {
    group_label: "Daily"
    label: "EXCHANGE RATE"
    type: max
    sql:  CASE
           WHEN ${fecha} >= CAST({% date_start date_filter %} AS DATE)
           AND ${fecha} <= CAST({% date_start date_filter %} AS DATE)
           THEN ${TABLE}.TIPO_CAMBIO
           ELSE 0
           END  ;;
  }

  measure: daily_sales {
    group_label: "Daily"
    label: "DAILY SALES"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: filtro_dia
      value: "yes"
    }

    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,daily_sales]

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

    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,daily_sales]

    value_format: "#,##0"
  }


  #MONTHLY-MONEY-MTD

  measure: national_amount_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL AMOUNT MTD"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [cliente,nombre_cliente,national_amount_mtd]

    value_format: "$#,##0.00"
  }

  measure: export_amount_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT AMOUNT MTD"
    type: sum
    sql: ${monto_transaccion} ;;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]
    filters: {
      field: is_current_period
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente,export_amount_mtd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_mtd {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD"
    type: number
    sql: ${national_amount_mtd} + ${export_amount_mtd} ;;

    drill_fields: [ cliente,nombre_cliente,total_amount_mtd]

    value_format: "$#,##0.00"
  }

  measure: total_amount_ {
    group_label: "Monthly"
    label: "TOTAL AMOUNT BY MONTH"
    type:  number
    sql: SUM( CASE WHEN ${canal_distribucion} = "NACIONAL" THEN ${monto_transaccion} END ) +
      SUM( CASE WHEN ${canal_distribucion} = "EXPORTACION" THEN ${monto_transaccion} END ) ;;
  }

  measure: national_amount_mtd_ly{
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL AMOUNT MTD LY"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: is_previous_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,national_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure: export_amount_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT AMOUNT MTD LY"

    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: is_previous_period
      value: "yes"
    }

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,export_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_mtd_ly {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD LY"
    type: number
    sql: ${national_amount_mtd_ly} + ${export_amount_mtd_ly} ;;

    drill_fields: [ cliente,nombre_cliente, total_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL AMOUNT MTD LY"
    type: number
    sql: CASE WHEN ${total_amount_mtd} > 0 AND ${total_amount_mtd_ly} = 0 THEN 1
                                WHEN ${total_amount_mtd} = 0 AND ${total_amount_mtd_ly} > 0 THEN -1
                                WHEN (${total_amount_mtd} /  NULLIF (${total_amount_mtd_ly},0))-1 = 0 THEN 0
                                ELSE (${total_amount_mtd} /  NULLIF (${total_amount_mtd_ly},0))-1
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

    drill_fields: [ cliente,nombre_cliente, vs_total_amount_mtd_ly, total_amount_mtd, total_amount_mtd_ly]
  }

  measure: z_national_amount_bud_mtd{
    group_label: "Monthly"
    label: "Z NATIONAL AMOUNT BUD MTD"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "PRESUPUESTO"]

    drill_fields: [ cliente,nombre_cliente, z_national_amount_bud_mtd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_mtd {
    group_label: "Monthly"
    label: "Z EXPORT AMOUNT BUD MTD"

    type: sum
    sql: ${monto_transaccion} ;;
    filters: {
      field: is_current_period
      value: "yes"
    }
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "PRESUPUESTO"]

    drill_fields: [ cliente,nombre_cliente, z_export_amount_bud_mtd]
    #value_format: "#,##0.00"
    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_mtd{
    group_label: "Monthly"
    label: "TOTAL AMOUNT BUD MTD"
    type: number
    sql: ${z_national_amount_bud_mtd} + ${z_export_amount_bud_mtd} ;;

    drill_fields: [ cliente,nombre_cliente, total_amount_bud_mtd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL BUD MTD"
    type: number
    sql: CASE WHEN ${total_amount_mtd} > 0 AND ${total_amount_bud_mtd} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente,vs_total_bud_mtd,total_amount_mtd,total_amount_bud_mtd]

  }

  #MONTHLY-QUANTITY-MTD

  measure: national_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente, national_qty_mtd]

    value_format: "#,##0"
  }

  measure: export_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente, export_qty_mtd]
    value_format: "#,##0"
  }

  measure: total_qty_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY MTD"
    type: number
    sql: ${national_qty_mtd} + ${export_qty_mtd} ;;
    drill_fields: [ cliente,nombre_cliente, total_qty_mtd]
    value_format: "#,##0"
  }

  measure: national_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: is_previous_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]
    drill_fields: [ cliente,nombre_cliente, national_qty_mtd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD LY"
    type: sum
    sql: ${cantidad};;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]
    filters: {
      field: is_previous_period
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente, export_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "TOTAL QTY MTD LY"
    type: number
    sql: ${national_qty_mtd_ly} + ${export_qty_mtd_ly} ;;

    drill_fields: [ cliente,nombre_cliente, total_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL QTY MTD LY"
    type: number
    sql: CASE WHEN ${total_qty_mtd} > 0 AND ${total_qty_mtd_ly} = 0 THEN 1
              WHEN ${total_qty_mtd} = 0 AND ${total_qty_mtd_ly} > 0 THEN -1
              WHEN (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1  = 0 THEN 0
              ELSE (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1   END *100;;

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

    drill_fields: [ cliente,nombre_cliente, vs_total_qty_mtd_ly,total_qty_mtd,total_qty_mtd_ly]

  }

  measure: national_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_period
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "PRESUPUESTO"]
    drill_fields: [ cliente,nombre_cliente, national_qty_bud_mtd]
  }

  measure: export_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "PRESUPUESTO"]
    filters: {
      field: is_current_period
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente, export_qty_bud_mtd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY BUD MTD"
    type: number
    sql: ${national_qty_bud_mtd} + ${export_qty_bud_mtd} ;;

    drill_fields: [ cliente,nombre_cliente, total_qty_bud_mtd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL QTY BUD MTD"
    type: number
    sql: CASE WHEN ${total_qty_mtd} > 0 AND ${total_qty_bud_mtd} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente, vs_total_qty_bud_mtd,total_qty_mtd,total_qty_bud_mtd]

  }


  #ANNUAL-MONEY-YTD

  measure: national_amount_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL AMOUNT YTD"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [cliente,nombre_cliente,national_amount_ytd]

    value_format: "$#,##0.00"
  }

  measure: export_amount_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT AMOUNT YTD"
    type: sum
    sql: ${monto_transaccion} ;;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]
    filters: {
      field: is_current_year
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente,export_amount_ytd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_ytd {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD"
    type: number
    sql: ${national_amount_ytd} + ${export_amount_ytd} ;;

    drill_fields: [ cliente,nombre_cliente,total_amount_ytd]

    value_format: "$#,##0.00"
  }

  measure: national_amount_ytd_ly{
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL AMOUNT YTD LY"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: is_previous_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,national_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure: export_amount_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT AMOUNT YTD LY"

    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: is_previous_year
      value: "yes"
    }

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente,export_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_ytd_ly {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD LY"
    type: number
    sql: ${national_amount_ytd_ly} + ${export_amount_ytd_ly} ;;

    drill_fields: [ cliente,nombre_cliente, total_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL AMOUNT YTD LY"
    type: number
    sql: CASE WHEN ${total_amount_ytd} > 0 AND ${total_amount_ytd_ly} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente, vs_total_amount_ytd_ly, total_amount_ytd, total_amount_ytd_ly]
  }

  measure: z_national_amount_bud_ytd{
    group_label: "Annual"
    label: "Z NATIONAL AMOUNT BUD YTD"
    type: sum
    sql: ${monto_transaccion} ;;

    filters: {
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "PRESUPUESTO"]

    drill_fields: [ cliente,nombre_cliente, z_national_amount_bud_ytd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_ytd {
    group_label: "Annual"
    label: "Z EXPORT AMOUNT BUD YTD"

    type: sum
    sql: ${monto_transaccion} ;;
    filters: {
      field: is_current_year
      value: "yes"
    }
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "PRESUPUESTO"]

    drill_fields: [ cliente,nombre_cliente, z_export_amount_bud_ytd]
    #value_format: "#,##0.00"
    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_ytd{
    group_label: "Annual"
    label: "TOTAL AMOUNT BUD YTD"
    type: number
    sql: ${z_national_amount_bud_ytd} + ${z_export_amount_bud_ytd} ;;

    drill_fields: [ cliente,nombre_cliente, total_amount_bud_ytd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL BUD YTD"
    type: number
    sql: CASE WHEN ${total_amount_ytd} > 0 AND ${total_amount_bud_ytd} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente,vs_total_bud_ytd,total_amount_ytd,total_amount_bud_ytd]

  }




  #ANNUAL-QUANTITY-YTD

  measure: national_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente, national_qty_ytd]

    value_format: "#,##0"
  }

  measure: export_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]

    drill_fields: [ cliente,nombre_cliente, export_qty_ytd]
    value_format: "#,##0"
  }

  measure: total_qty_ytd {
    group_label: "Annual"
    label: "TOTAL QTY YTD"
    type: number
    sql: ${national_qty_ytd} + ${export_qty_ytd} ;;
    drill_fields: [ cliente,nombre_cliente, total_qty_ytd]
    value_format: "#,##0"
  }

  measure: national_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: is_previous_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "VENTA"]
    drill_fields: [ cliente,nombre_cliente, national_qty_ytd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD LY"
    type: sum
    sql: ${cantidad};;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "VENTA"]
    filters: {
      field: is_previous_year
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente, export_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "TOTAL QTY YTD LY"
    type: number
    sql: ${national_qty_ytd_ly} + ${export_qty_ytd_ly} ;;

    drill_fields: [ cliente,nombre_cliente, total_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL QTY YTD LY"
    type: number
    sql: CASE WHEN ${total_qty_ytd} > 0 AND ${total_qty_ytd_ly} = 0 THEN 1
              WHEN ${total_qty_ytd} = 0 AND ${total_qty_ytd_ly} > 0 THEN -1
              WHEN (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1  = 0 THEN 0
              ELSE (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1   END *100;;

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

    drill_fields: [ cliente,nombre_cliente, vs_total_qty_ytd_ly,total_qty_ytd,total_qty_ytd_ly]

  }

  measure: national_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: is_current_year
      value: "yes"
    }

    filters: [canal_distribucion: "NACIONAL"]
    filters: [tipo_transaccion: "PRESUPUESTO"]
    drill_fields: [ cliente,nombre_cliente, national_qty_bud_ytd]
  }

  measure: export_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;
    filters: [canal_distribucion: "EXPORTACION"]
    filters: [tipo_transaccion: "PRESUPUESTO"]
    filters: {
      field: is_current_year
      value: "yes"
    }

    drill_fields: [ cliente,nombre_cliente, export_qty_bud_ytd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_ytd {
    group_label: "Annual"
    label: "TOTAL QTY BUD YTD"
    type: number
    sql: ${national_qty_bud_ytd} + ${export_qty_bud_ytd} ;;

    drill_fields: [ cliente,nombre_cliente, total_qty_bud_ytd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL QTY BUD YTD"
    type: number
    sql: CASE WHEN ${total_qty_ytd} > 0 AND ${total_qty_bud_ytd} = 0 THEN 1
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

    drill_fields: [ cliente,nombre_cliente, vs_total_qty_bud_ytd,total_qty_ytd,total_qty_bud_ytd]

  }


}
