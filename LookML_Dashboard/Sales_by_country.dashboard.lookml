---
- dashboard: sales_by_country
  title: Sales by country
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: 073ACT7t9LmLmjix6RCAWN
  elements:
  - title: EXCHANGE RATES
    name: EXCHANGE RATES
    model: alg_facturacion
    explore: ventas_analisis
    type: looker_grid
    fields: [ventas_analisis.m_tc_diario, ventas_analisis.m_tc_mtd, ventas_analisis.m_tc_mtd_ly,
      ventas_analisis.m_tc_ytd, ventas_analisis.m_tc_ytd_ly, ventas_analisis.m_tc_bud_mtd,
      ventas_analisis.FCURR]
    filters:
      ventas_analisis.m_tc_diario: NOT NULL
    sorts: [ventas_analisis.FCURR]
    limit: 500
    column_limit: 50
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
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 40
    series_column_widths:
      ventas_analisis.m_tc_bud_mtd: 50
      ventas_analisis.FCURR: 65
      ventas_analisis.m_tc_mtd: 55
      ventas_analisis.m_tc_mtd_ly: 75
      ventas_analisis.m_tc_ytd_ly: 50
      ventas_analisis.m_tc_ytd: 45
      ventas_analisis.m_tc_diario: 50
    series_cell_visualizations:
      ventas_analisis.daily_sales:
        is_active: false
    series_collapsed:
      ventas_analisis.region: true
      ventas_analisis.moneda_conversion: true
    header_font_color: "#FFFFFF"
    header_background_color: "#920F05"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: DAILY SALES
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
    hidden_pivots: {}
    listen:
      Date: ventas_analisis.date_filter
      Currency: ventas_analisis.moneda_conversion
      Country: ventas_analisis.pais_destinatario
    row: 0
    col: 0
    width: 7
    height: 4
  - title: Sales by month
    name: Sales by month
    model: alg_facturacion
    explore: ventas_analisis
    type: looker_grid
    fields: [ventas_analisis.pais_destinatario, ventas_analisis.dates_month, ventas_analisis.month_amount]
    pivots: [ventas_analisis.dates_month]
    fill_fields: [ventas_analisis.dates_month]
    filters:
      ventas_analisis.pais: ''
      ventas_analisis.filtro_desde_hasta: '1'
    sorts: [ventas_analisis.dates_month, ventas_analisis.month_amount desc 0]
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
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      ventas_analisis.pais_destinatario: Country
      ventas_analisis.dates_month: Month
    series_cell_visualizations:
      ventas_analisis.daily_sales:
        is_active: false
    series_collapsed:
      ventas_analisis.region: true
      ventas_analisis.moneda_conversion: true
    header_font_color: "#FFFFFF"
    header_background_color: "#920F05"
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
    hidden_pivots: {}
    pinned_columns:
      ventas_analisis.pais_destinatario: left
    column_order: [ventas_analisis.pais_destinatario, 2022-02_ventas_analisis.month_amount,
      2022-03_ventas_analisis.month_amount, 2022-04_ventas_analisis.month_amount,
      2022-05_ventas_analisis.month_amount, 2022-06_ventas_analisis.month_amount,
      2022-07_ventas_analisis.month_amount, 2022-08_ventas_analisis.month_amount,
      2022-09_ventas_analisis.month_amount, 2022-10_ventas_analisis.month_amount,
      2022-11_ventas_analisis.month_amount, 2022-12_ventas_analisis.month_amount,
      2023-01_ventas_analisis.month_amount, 2023-02_ventas_analisis.month_amount,
      2023-03_ventas_analisis.month_amount, 2023-04_ventas_analisis.month_amount,
      2023-05_ventas_analisis.month_amount, 2023-06_ventas_analisis.month_amount,
      2023-07_ventas_analisis.month_amount, 2023-08_ventas_analisis.month_amount,
      2023-09_ventas_analisis.month_amount, 2023-10_ventas_analisis.month_amount,
      2023-11_ventas_analisis.month_amount, 2023-12_ventas_analisis.month_amount,
      2024-01_ventas_analisis.month_amount, 2024-02_ventas_analisis.month_amount,
      2024-03_ventas_analisis.month_amount, 2024-04_ventas_analisis.month_amount,
      2024-05_ventas_analisis.month_amount, 2024-06_ventas_analisis.month_amount,
      2024-07_ventas_analisis.month_amount, 2024-08_ventas_analisis.month_amount,
      2024-09_ventas_analisis.month_amount, 2024-10_ventas_analisis.month_amount]
    listen:
      Date: ventas_analisis.date_filter
      Currency: ventas_analisis.moneda_conversion
      Region: ventas_analisis.region
      Cluster: ventas_analisis.cluster
      Plant: ventas_analisis.nombre_planta
      Category: ventas_analisis.categoria
      Client: ventas_analisis.nombre_cliente
      Sales Org: ventas_analisis.organizacion_ventas
      Global Category: ventas_analisis.categoria_global
      Country: ventas_analisis.pais_destinatario
    row: 4
    col: 0
    width: 24
    height: 9
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: last day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: alg_facturacion
    explore: ventas_analisis
    listens_to_filters: []
    field: ventas_analisis.date_filter
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: alg_facturacion
    explore: ventas_analisis
    listens_to_filters: []
    field: ventas_analisis.region
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
    explore: ventas_analisis
    listens_to_filters: [Region]
    field: ventas_analisis.cluster
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_analisis
    listens_to_filters: [Region, Cluster]
    field: ventas_analisis.pais_destinatario
  - name: Sales Org
    title: Sales Org
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_analisis
    listens_to_filters: [Country, Region, Cluster]
    field: ventas_analisis.organizacion_ventas
  - name: Plant
    title: Plant
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_analisis
    listens_to_filters: [Country, Sales Org, Region, Cluster]
    field: ventas_analisis.nombre_planta
  - name: Global Category
    title: Global Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_analisis
    listens_to_filters: [Country, Sales Org, Plant, Region, Cluster]
    field: ventas_analisis.categoria_global
  - name: Category
    title: Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_analisis
    listens_to_filters: [Country, Sales Org, Plant, Global Category, Region, Cluster]
    field: ventas_analisis.categoria
  - name: Client
    title: Client
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_analisis
    listens_to_filters: [Category, Country, Sales Org, Plant, Global Category, Region,
      Cluster]
    field: ventas_analisis.nombre_cliente
  - name: Currency
    title: Currency
    type: field_filter
    default_value: MXN
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: alg_facturacion
    explore: ventas_analisis
    listens_to_filters: []
    field: ventas_analisis.moneda_conversion
