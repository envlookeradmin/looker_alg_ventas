---
- dashboard: envases__facturacion
  title: Envases - facturacion
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: lhtKFG6kq7Aujc4aWk4ZKv
  elements:
  - title: CURRENCY
    name: CURRENCY
    model: alg_facturacion
    explore: ventas
    type: looker_grid
    fields: [ventas.moneda_transaccion, ventas.s_tipo_cambio]
    filters: {}
    sorts: [ventas.moneda_transaccion]
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
    header_text_alignment: center
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_column_widths:
      ventas.moneda_transaccion: 125
      ventas.s_tipo_cambio: 125
    series_cell_visualizations:
      ventas.s_tipo_cambio:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
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
    listen:
      Date: ventas.date_filter
    row: 0
    col: 0
    width: 5
    height: 5
  - title: SUMMARY
    name: SUMMARY
    model: alg_facturacion
    explore: ventas
    type: looker_grid
    fields: [planta.cluster, ventas.daily_sales, ventas.empty_value1, ventas.total_amount_mtd,
      ventas.vs_total_amount_mtd_ly, ventas.vs_total_bud_mtd, ventas.empty_value2,
      ventas.total_amount_ytd, ventas.vs_total_amount_ytd_ly, ventas.vs_total_bud_ytd]
    filters: {}
    sorts: [planta.cluster]
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
    header_font_size: '9'
    rows_font_size: '9'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 10
    series_labels:
      ventas.empty_value1: "."
      ventas.empty_value2: "."
      ventas.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
    series_column_widths:
      planta.cluster: 120
      ventas.daily_sales: 70
      ventas.empty_value1: 10
      ventas.total_amount_mtd: 100
      ventas.vs_total_amount_mtd_ly: 70
      ventas.empty_value2: 10
      ventas.vs_total_bud_mtd: 72
      ventas.total_amount_ytd: 100
      ventas.vs_total_amount_ytd_ly: 70
      ventas.vs_total_bud_ytd: 70
    series_cell_visualizations:
      ventas.daily_sales:
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
    listen:
      Date: ventas.date_filter
    row: 0
    col: 5
    width: 13
    height: 5
  - title: New Tile
    name: New Tile
    model: alg_facturacion
    explore: ventas
    type: single_value
    fields: [ventas.fecha_seleccionada]
    filters: {}
    sorts: [ventas.fecha_seleccionada]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5e2129"
    single_value_title: Data of the day
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
    listen:
      Date: ventas.date_filter
    row: 0
    col: 18
    width: 6
    height: 2
  - title: MÉXICO
    name: MÉXICO
    model: alg_facturacion
    explore: ventas
    type: looker_grid
    fields: [ventas.orden_categoria, ventas.categoria, ventas.subcategoria, ventas.daily_sales,
      ventas.empty_value1, ventas.total_qty_mtd, ventas.vs_total_qty_mtd_ly, ventas.vs_total_qty_bud_mtd,
      ventas.total_amount_mtd, ventas.vs_total_amount_mtd_ly, ventas.vs_total_bud_mtd,
      ventas.total_amount_mtd_ly, ventas.total_amount_bud_mtd, ventas.empty_value2,
      ventas.total_qty_ytd, ventas.vs_total_qty_ytd_ly, ventas.vs_total_qty_bud_ytd,
      ventas.total_amount_ytd, ventas.vs_total_amount_ytd_ly, ventas.vs_total_bud_ytd,
      ventas.total_amount_ytd_ly, ventas.total_amount_bud_ytd]
    filters:
      planta.cluster: Mexico
    sorts: [ventas.orden_categoria]
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
    header_font_size: '9'
    rows_font_size: '9'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 10
    series_labels:
      ventas.empty_value1: "'"
      ventas.empty_value2: "."
      ventas.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas.categoria: 120
      ventas.subcategoria: 120
      ventas.daily_sales: 70
      ventas.empty_value1: 10
      ventas.empty_value2: 10
      ventas.total_qty_mtd: 55
      ventas.vs_total_qty_mtd_ly: 70
      ventas.vs_total_qty_bud_mtd: 70
      ventas.total_amount_mtd: 80
      ventas.vs_total_amount_mtd_ly: 70
      ventas.vs_total_bud_mtd: 70
      ventas.total_amount_mtd_ly: 70
      ventas.total_amount_bud_mtd: 80
      ventas.total_qty_ytd: 55
      ventas.vs_total_qty_ytd_ly: 70
      ventas.vs_total_qty_bud_ytd: 70
      ventas.total_amount_ytd: 75
      ventas.vs_total_amount_ytd_ly: 70
      ventas.vs_total_bud_ytd: 70
      ventas.total_amount_ytd_ly: 70
      ventas.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas.daily_sales:
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
    hidden_fields: [ventas.orden_categoria]
    listen:
      Date: ventas.date_filter
    row: 5
    col: 0
    width: 24
    height: 6
  - title: LAST UPDATES BY REGION
    name: LAST UPDATES BY REGION
    model: alg_facturacion
    explore: bitacora
    type: looker_grid
    fields: [bitacora.time_zone, bitacora.date_time]
    sorts: [bitacora.date_time]
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
    minimum_column_width: 75
    series_column_widths:
      bitacora.time_zone: 160
      bitacora.date_time: 140
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
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
    listen: {}
    row: 2
    col: 18
    width: 6
    height: 3
  - title: TOTAL
    name: TOTAL
    model: alg_facturacion
    explore: ventas
    type: looker_grid
    fields: [ventas.categoria, ventas.subcategoria, ventas.daily_sales, ventas.total_amount_mtd,
      ventas.vs_total_amount_mtd_ly, ventas.vs_total_bud_mtd, ventas.total_amount_mtd_ly,
      ventas.total_amount_bud_mtd, ventas.total_amount_ytd, ventas.vs_total_amount_ytd_ly,
      ventas.vs_total_bud_ytd, ventas.total_amount_ytd_ly, ventas.total_amount_bud_ytd]
    filters:
      ventas.categoria: TOTAL EUR,TOTAL USD
    sorts: [ventas.daily_sales desc]
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
    header_font_size: '9'
    rows_font_size: '9'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      ventas.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_cell_visualizations:
      ventas.daily_sales:
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
    listen:
      Date: ventas.date_filter
    row: 17
    col: 0
    width: 24
    height: 3
  - title: ECN - NORTH
    name: ECN - NORTH
    model: alg_facturacion
    explore: ventas
    type: looker_grid
    fields: [ventas.orden_categoria, ventas.categoria, ventas.subcategoria, ventas.daily_sales,
      ventas.empty_value1, ventas.total_qty_mtd, ventas.vs_total_qty_mtd_ly, ventas.vs_total_qty_bud_mtd,
      ventas.total_amount_mtd, ventas.vs_total_amount_mtd_ly, ventas.vs_total_bud_mtd,
      ventas.total_amount_mtd_ly, ventas.total_amount_bud_mtd, ventas.empty_value2,
      ventas.total_qty_ytd, ventas.vs_total_qty_ytd_ly, ventas.vs_total_qty_bud_ytd,
      ventas.total_amount_ytd, ventas.vs_total_amount_ytd_ly, ventas.vs_total_bud_ytd,
      ventas.total_amount_ytd_ly, ventas.total_amount_bud_ytd]
    filters:
      planta.cluster: ECN - North
    sorts: [ventas.orden_categoria]
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
    header_font_size: '9'
    rows_font_size: '9'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 10
    series_labels:
      ventas.empty_value1: "'"
      ventas.empty_value2: "."
      ventas.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas.categoria: 120
      ventas.subcategoria: 120
      ventas.daily_sales: 70
      ventas.empty_value1: 10
      ventas.empty_value2: 10
      ventas.total_qty_mtd: 55
      ventas.vs_total_qty_mtd_ly: 70
      ventas.vs_total_qty_bud_mtd: 70
      ventas.total_amount_mtd: 80
      ventas.vs_total_amount_mtd_ly: 70
      ventas.vs_total_bud_mtd: 70
      ventas.total_amount_mtd_ly: 70
      ventas.total_amount_bud_mtd: 80
      ventas.total_qty_ytd: 55
      ventas.vs_total_qty_ytd_ly: 70
      ventas.vs_total_qty_bud_ytd: 70
      ventas.total_amount_ytd: 75
      ventas.vs_total_amount_ytd_ly: 70
      ventas.vs_total_bud_ytd: 70
      ventas.total_amount_ytd_ly: 70
      ventas.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas.daily_sales:
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
    hidden_fields: [ventas.orden_categoria]
    listen:
      Date: ventas.date_filter
    row: 11
    col: 0
    width: 24
    height: 6
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 2023/11/30
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_picker
      display: inline
      options: []
    model: alg_facturacion
    explore: ventas
    listens_to_filters: []
    field: ventas.date_filter
