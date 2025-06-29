---
- dashboard: alg_sales_usacanada
  title: ALG Sales USA-Canada
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: jDpRerYOEA45yrW34bi4Rv
  elements:
  - title: Sales over Time
    name: Sales over Time
    model: alg_facturacion
    explore: ventas_usa_can
    type: looker_line
    fields: [ventas_usa_can.billing_month_name, ventas_usa_can.total_sales, ventas_usa_can.ly_total_sales,
      ventas_usa_can.total_budget]
    filters:
      ventas_usa_can.total_sales: ">0"
    sorts: [ventas_usa_can.billing_month_name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: left
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: ventas_usa_can.total_sales,
            id: ventas_usa_can.total_sales, name: Sales}, {axisId: ventas_usa_can.ly_total_sales,
            id: ventas_usa_can.ly_total_sales, name: LY Sales}, {axisId: ventas_usa_can.total_budget,
            id: ventas_usa_can.total_budget, name: Budget}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      ventas_usa_can.total_sales: "#B42F37"
      ventas_usa_can.ly_total_sales: "#4276BE"
      ventas_usa_can.total_budget: "#9ED7D7"
    series_labels:
      ventas_usa_can.total_budget: Budget
      ventas_usa_can.total_sales: Sales
      ventas_usa_can.ly_total_sales: LY Sales
    swap_axes: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Billing Range: ventas_usa_can.billing_range
      Indicator: ventas_usa_can.indicator
      Currency: ventas_usa_can.currency
      Plant: ventas_usa_can.plant
    row: 0
    col: 0
    width: 24
    height: 7
  - title: Sales vs Budget by Category
    name: Sales vs Budget by Category
    model: alg_facturacion
    explore: ventas_usa_can
    type: looker_line
    fields: [ventas_usa_can.category, ventas_usa_can.total_sales, ventas_usa_can.total_budget]
    filters:
      ventas_usa_can.total_sales: ">0"
    sorts: [ventas_usa_can.total_sales desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: ventas_usa_can.total_sales,
            id: ventas_usa_can.total_sales, name: Sales}, {axisId: ventas_usa_can.total_budget,
            id: ventas_usa_can.total_budget, name: Budget}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: ventas_usa_can.sales_vs_budget,
            id: ventas_usa_can.sales_vs_budget, name: "% VS Budget"}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      ventas_usa_can.total_sales: column
    series_colors:
      ventas_usa_can.total_sales: "#B42F37"
      ventas_usa_can.total_budget: "#9ED7D7"
    series_labels:
      ventas_usa_can.total_sales: Sales
      ventas_usa_can.total_budget: Budget
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Billing Range: ventas_usa_can.billing_range
      Indicator: ventas_usa_can.indicator
      Currency: ventas_usa_can.currency
      Plant: ventas_usa_can.plant
    row: 7
    col: 0
    width: 12
    height: 8
  - title: Sales vs Last Year vs Budget
    name: Sales vs Last Year vs Budget
    model: alg_facturacion
    explore: ventas_usa_can
    type: looker_grid
    fields: [ventas_usa_can.category, ventas_usa_can.total_sales, ventas_usa_can.ly_total_sales,
      ventas_usa_can.sales_vs_ly, ventas_usa_can.total_budget, ventas_usa_can.sales_vs_budget,
      ventas_usa_can.subcategory]
    sorts: [ventas_usa_can.category, ventas_usa_can.subcategory]
    subtotals: [ventas_usa_can.category]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      ventas_usa_can.total_sales: Sales
      ventas_usa_can.ly_total_sales: LY Sales
      ventas_usa_can.sales_vs_ly: "% VS LY"
      ventas_usa_can.total_budget: Budget
      ventas_usa_can.sales_vs_budget: "% VS Budget"
    series_column_widths:
      ventas_usa_can.total_sales: 100
      ventas_usa_can.ly_total_sales: 100
      ventas_usa_can.sales_vs_ly: 100
      ventas_usa_can.total_budget: 100
      ventas_usa_can.sales_vs_budget: 100
    series_cell_visualizations:
      ventas_usa_can.total_sales:
        is_active: false
    series_text_format:
      ventas_usa_can.total_sales:
        bold: true
    series_collapsed:
      ventas_usa_can.category: true
    header_font_color: "#fff"
    header_background_color: "#B42F37"
    series_value_format:
      ventas_usa_can.total_sales:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      ventas_usa_can.ly_total_sales:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      ventas_usa_can.sales_vs_ly:
        format_string: "#,##0.00%"
      ventas_usa_can.total_budget:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      ventas_usa_can.sales_vs_budget:
        format_string: "#,##0.00%"
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
    truncate_column_names: false
    listen:
      Billing Range: ventas_usa_can.billing_range
      Indicator: ventas_usa_can.indicator
      Currency: ventas_usa_can.currency
      Plant: ventas_usa_can.plant
    row: 7
    col: 12
    width: 12
    height: 8
  - title: Detail by Client
    name: Detail by Client
    model: alg_facturacion
    explore: ventas_usa_can
    type: looker_grid
    fields: [ventas_usa_can.client_corporate, ventas_usa_can.client_group, ventas_usa_can.client,
      ventas_usa_can.total_sales, ventas_usa_can.ly_total_sales, ventas_usa_can.sales_vs_ly,
      ventas_usa_can.total_budget, ventas_usa_can.sales_vs_budget]
    sorts: [ventas_usa_can.client_corporate, ventas_usa_can.client_group, ventas_usa_can.total_sales
        desc]
    subtotals: [ventas_usa_can.client_corporate, ventas_usa_can.client_group]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      ventas_usa_can.client_corporate: Corporate
      ventas_usa_can.client: Client Name
      ventas_usa_can.total_sales: Sales
      ventas_usa_can.ly_total_sales: LY Sales
      ventas_usa_can.sales_vs_ly: "% VS LY"
      ventas_usa_can.total_budget: Budget
      ventas_usa_can.sales_vs_budget: "% VS Budget"
      ventas_usa_can.client_group: Group
    series_column_widths:
      ventas_usa_can.total_sales: 100
      ventas_usa_can.ly_total_sales: 100
      ventas_usa_can.sales_vs_ly: 100
      ventas_usa_can.total_budget: 100
      ventas_usa_can.sales_vs_budget: 100
      ventas_usa_can.client_corporate: 200
      ventas_usa_can.client: 200
      ventas_usa_can.client_group: 200
      grouped-column-ventas_usa_can.client_group: 195
    series_cell_visualizations:
      ventas_usa_can.total_sales:
        is_active: false
    series_text_format:
      ventas_usa_can.total_sales:
        bold: true
    series_collapsed:
      ventas_usa_can.client_corporate: true
      ventas_usa_can.client_group: true
    header_font_color: "#fff"
    header_background_color: "#B42F37"
    series_value_format:
      ventas_usa_can.total_sales:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      ventas_usa_can.ly_total_sales:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      ventas_usa_can.sales_vs_ly:
        format_string: "#,##0.00%"
      ventas_usa_can.total_budget:
        name: decimal_2
        decimals: '2'
        format_string: "#,##0.00"
        label: Decimals (2)
        label_prefix: Decimals
      ventas_usa_can.sales_vs_budget:
        format_string: "#,##0.00%"
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
    truncate_column_names: false
    listen:
      Billing Range: ventas_usa_can.billing_range
      Indicator: ventas_usa_can.indicator
      Currency: ventas_usa_can.currency
      Plant: ventas_usa_can.plant
    row: 15
    col: 3
    width: 18
    height: 8
  filters:
  - name: Billing Range
    title: Billing Range
    type: field_filter
    default_value: this year
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: alg_facturacion
    explore: ventas_usa_can
    listens_to_filters: []
    field: ventas_usa_can.billing_range
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
    explore: ventas_usa_can
    listens_to_filters: []
    field: ventas_usa_can.plant
  - name: Indicator
    title: Indicator
    type: field_filter
    default_value: Cantidad
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_toggles
      display: inline
    model: alg_facturacion
    explore: ventas_usa_can
    listens_to_filters: []
    field: ventas_usa_can.indicator
  - name: Currency
    title: Currency
    type: field_filter
    default_value: "^_MXN"
    allow_multiple_values: true
    required: true
    ui_config:
      type: radio_buttons
      display: inline
    model: alg_facturacion
    explore: ventas_usa_can
    listens_to_filters: []
    field: ventas_usa_can.currency
