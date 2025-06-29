view: ventas_usa_can {
  derived_table: {
    sql:
    WITH
    TC_US AS (
      SELECT
        CASE WHEN Presupuesto THEN 'Presupuesto' ELSE 'Venta' END AS Tipo_Transaccion
        , Moneda_Origen, Moneda_Conversion
        , Fecha, CAST(Tipo_Cambio AS NUMERIC) Tipo_Cambio
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Divisas`
      WHERE
        Moneda_Origen IN ('MXN', 'CAD') AND Moneda_Conversion = 'USD' AND
        Fecha >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(),YEAR), INTERVAL 1 YEAR)
    ),
    TC_MX AS (
      SELECT
        CASE WHEN Presupuesto THEN 'Presupuesto' ELSE 'Venta' END AS Tipo_Transaccion
        , Moneda_Origen, Moneda_Conversion
        , Fecha, CAST(Tipo_Cambio AS NUMERIC) Tipo_Cambio
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Dim_Divisas`
      WHERE
        Moneda_Origen IN ('USD', 'CAD') AND Moneda_Conversion = 'MXN' AND
        Fecha >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(),YEAR), INTERVAL 1 YEAR)
    )
    SELECT
      VTAS.Tipo_Transaccion, VTAS.Fecha, VTAS.Material, VTAS.Descripcion_Material
      , VTAS.Grupo_Material, VTAS.Descripcion_Grupo_Material, VTAS.Categoria, VTAS.Categoria_Global
      , VTAS.Subcategoria, VTAS.Planta, VTAS.Nombre_Planta, VTAS.Pais, VTAS.Ciudad, VTAS.Cliente
      , VTAS.Nombre_Cliente, VTAS.Grupo_Cliente, VTAS.Corporativo
      , VTAS.Moneda_Transaccion, CAST(COALESCE(TC_US.Tipo_Cambio, 1) AS NUMERIC) TC_USD, CAST(COALESCE(TC_MX.Tipo_Cambio, 1) AS NUMERIC) TC_MXN
      , ROUND(SUM(Cantidad),4) Cantidad
      , ROUND(SUM(Monto * CAST(COALESCE(TC_MX.Tipo_Cambio, 1) AS NUMERIC)),4) Monto_MXN
      , ROUND(SUM(Monto * CAST(COALESCE(TC_US.Tipo_Cambio, 1) AS NUMERIC)),4) Monto_USD
    FROM
      `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Fact_Ventas_Columnar` VTAS
      LEFT JOIN TC_US ON
        VTAS.Tipo_Transaccion = TC_US.Tipo_Transaccion AND
        VTAS.Moneda_Transaccion = TC_US.Moneda_Origen AND
        VTAS.Fecha = TC_US.Fecha
      LEFT JOIN TC_MX ON
        VTAS.Tipo_Transaccion = TC_MX.Tipo_Transaccion AND
        VTAS.Moneda_Transaccion = TC_MX.Moneda_Origen AND
        VTAS.Fecha = TC_MX.Fecha
    WHERE
      VTAS.ID_Fuente = 'ECC_USA' AND VTAS.Cluster IN ('USA', 'Canada') AND VTAS.Division = 'ALG' AND
      VTAS.Fecha >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(),YEAR), INTERVAL 1 YEAR)
    GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20;;
  }
  # PARAMETROS Y FILTROS
  parameter: indicator {
    description: "Select indicator to agregate"
    type: unquoted
    allowed_value: {
      label: "Quantity"
      value: "Cantidad"
    }
    allowed_value: {
      label: "Amount"
      value: "Monto"
    }
    default_value: "Cantidad"
  }
  parameter: currency {
    description: "Select currency to calculate amount"
    type: unquoted
    allowed_value: {
      label: "MXN"
      value: "_MXN"
    }
    allowed_value: {
      label: "USD"
      value: "_USD"
    }
    default_value: "USD"
  }
  filter: billing_range {
    type: date
  }
  dimension: selected_measure {
    type: number
    hidden: yes
    sql:
    {% if indicator._parameter_value == "Cantidad" %}
      ${TABLE}.{% parameter indicator %}
    {% else %}
      ${TABLE}.{% parameter indicator %}{% parameter currency %}
    {% endif %};;
  }
  # DATE DIMENSIONS
  dimension_group: billing {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: range_start {
    type: date
    hidden: yes
    sql: {% date_start billing_range %} ;;
  }
  dimension: range_end {
    type: date
    hidden: yes
    sql: DATE_SUB({% date_end billing_range %}, INTERVAL 1 DAY) ;;
  }
  dimension: selected_range {
    type: yesno
    hidden: yes
    sql: ${billing_raw} between ${range_start} AND ${range_end} ;;
  }
  dimension: ly_range {
    type: yesno
    hidden: yes
    sql: ${billing_raw} between DATE_SUB(${range_start}, INTERVAL 1 YEAR) AND DATE_SUB(${range_end}, INTERVAL 1 YEAR) ;;
  }
  #DIMENSIONS
  dimension: transaction_type {
    type: string
    sql: CASE WHEN ${TABLE}.Tipo_Transaccion = 'Presupuesto' THEN 'Budget' ELSE 'Sales' END ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.Categoria ;;
  }
  dimension: subcategory {
    type: string
    sql: ${TABLE}.Subcategoria ;;
  }
  dimension: plant {
    type: string
    sql: ${TABLE}.Planta || '-' || ${TABLE}.Nombre_Planta ;;
  }
  dimension: client {
    type: string
    sql: ${TABLE}.Nombre_Cliente ;;
  }
  dimension: client_group {
    type: string
    sql: ${TABLE}.Grupo_Cliente ;;
  }
  dimension: client_corporate {
    type: string
    sql: ${TABLE}.Corporativo ;;
  }
  # MEASURES
  measure: total_sales {
    type: sum
    sql: ${selected_measure} / 1000 ;;
    filters: [selected_range: "yes", transaction_type: "Sales"]
    value_format_name: decimal_2
  }
  measure: ly_total_sales {
    type: sum
    label: "Total Sales Last Year"
    sql: ${selected_measure} / 1000 ;;
    filters: [ly_range: "yes", transaction_type: "Sales"]
    value_format_name: decimal_2
  }
  measure: total_budget {
    type: sum
    label: "Total Budget"
    sql: ${selected_measure} / 1000 ;;
    filters: [selected_range: "yes", transaction_type: "Budget"]
    value_format_name: decimal_2
  }
  measure: sales_vs_budget {
    type: number
    label: "% VS Budget"
    sql:
      (CASE WHEN ${total_budget} = 0 THEN (
        CASE WHEN (${total_sales} - ${total_budget}) = 0 THEN NULL
        ELSE 1 END)
      ELSE SAFE_DIVIDE(${total_sales} - ${total_budget},${total_budget}) END) ;;
    value_format_name: percent_2
    html:
      {% if value > 0 %}{% assign indicator = "green,▲" | split: ',' %}
      {% else %}{% assign indicator = "red,▼" | split: ',' %}
      {% endif %}
      <font color="{{indicator[0]}}">
      {% if value == 99999.12345 %} &infin
      {% else %}{{rendered_value}}
      {% endif %} {{indicator[1]}}
      </font>;;
  }
  measure: sales_vs_ly {
    type: number
    label: "% VS Last Year"
    sql:
      (CASE WHEN ${ly_total_sales} = 0 THEN (
        CASE WHEN (${total_sales} - ${ly_total_sales}) = 0 THEN NULL
        ELSE 1 END)
      ELSE SAFE_DIVIDE(${total_sales} - ${ly_total_sales},${ly_total_sales}) END) ;;
    value_format_name: percent_2
    html:
      {% if value > 0 %}{% assign indicator = "green,▲" | split: ',' %}
      {% else %}{% assign indicator = "red,▼" | split: ',' %}
      {% endif %}
      <font color="{{indicator[0]}}">
      {% if value == 99999.12345 %} &infin
      {% else %}{{rendered_value}}
      {% endif %} {{indicator[1]}}
      </font>;;
  }
}
