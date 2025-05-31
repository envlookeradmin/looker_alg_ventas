---
- dashboard: alg074_monitor_budget_por_cliente
  title: "(ALG-074) Monitor Budget por Cliente"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: XZEBuDeMLpOCBLRC40q0Ue
  elements:
  - title: POR DIMENSION Y CLIENTE
    name: POR DIMENSION Y CLIENTE
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_grid
    fields: [ventas_consolidado.pais, ventas_consolidado.dimensiones, ventas_consolidado.nombre_cliente,
      ventas_consolidado.total_qty_bud_ytd, ventas_consolidado.total_qty_bud_mtd,
      ventas_consolidado.amount_bud_mtd, ventas_consolidado.amount_bud_ytd, ventas_consolidado.amount_bud_mtd_converted,
      ventas_consolidado.amount_bud_ytd_converted]
    filters:
      ventas_consolidado.tipo_transaccion: Presupuesto
    sorts: [ventas_consolidado.pais, ventas_consolidado.dimensiones]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '9'
    rows_font_size: '9'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [ventas_consolidado.pais, ventas_consolidado.dimensiones, ventas_consolidado.nombre_cliente,
      ventas_consolidado.amount_bud_mtd_converted, ventas_consolidado.amount_bud_mtd,
      ventas_consolidado.total_qty_bud_mtd, ventas_consolidado.amount_bud_ytd_converted,
      ventas_consolidado.amount_bud_ytd, ventas_consolidado.total_qty_bud_ytd, ventas_consolidado.total_amount_bud_mtd,
      ventas_consolidado.total_amount_bud_ytd]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 10
    series_labels:
      ventas_consolidado.empty_value1: "'"
      ventas_consolidado.empty_value2: "."
      ventas_consolidado.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas_consolidado.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas_consolidado.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas_consolidado.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas_consolidado.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas_consolidado.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas_consolidado.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas_consolidado.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas_consolidado.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas_consolidado.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas_consolidado.nombre_cliente: Client
      ventas_consolidado.pais: Country
      ventas_consolidado.dimensiones: Size
      ventas_consolidado.total_qty_bud_ytd: Qty bud YTD
      ventas_consolidado.total_qty_bud_mtd: Qty bud MTD
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen:
      Cluster: ventas_consolidado.cluster
      Fuente: ventas_consolidado.id_fuente
      Fecha: ventas_consolidado.date_filter
      División: ventas_consolidado.division
      Pais: ventas_consolidado.pais
      Cliente: ventas_consolidado.nombre_cliente
      Corporativo: ventas_consolidado.corporativo
      Moneda: ventas_consolidado.moneda_conversion
    row: 0
    col: 0
    width: 24
    height: 8
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: last day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: []
    field: ventas_consolidado.date_filter
  - name: División
    title: División
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: []
    field: ventas_consolidado.division
  - name: Fuente
    title: Fuente
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: [División]
    field: ventas_consolidado.id_fuente
  - name: Cluster
    title: Cluster
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: [División, Fuente]
    field: ventas_consolidado.cluster
  - name: Pais
    title: Pais
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: [División, Fuente, Cluster]
    field: ventas_consolidado.pais
  - name: Corporativo
    title: Corporativo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: [División, Fuente, Cluster, Pais]
    field: ventas_consolidado.corporativo
  - name: Cliente
    title: Cliente
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: [Corporativo, División, Fuente, Cluster, Pais]
    field: ventas_consolidado.nombre_cliente
  - name: Moneda
    title: Moneda
    type: field_filter
    default_value: MXN
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: popover
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: []
    field: ventas_consolidado.moneda_conversion
