---
- dashboard: envases_-_facturacion_2
  title: Envases - facturacion_2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ZFYJUU1a6as8feS6bV9Ted
  elements:
  - title: New Tile
    name: New Tile
    model: alg_facturacion
    explore: ventas1
    type: single_value
    fields: [ventas1.fecha_seleccionada]
    sorts: [ventas1.fecha_seleccionada]
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
      Date: ventas1.date_filter
    row: 0
    col: 18
    width: 6
    height: 2
  - title: MÉXICO
    name: MÉXICO
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.subcategoria, ventas1.daily_sales,
      ventas1.empty_value1, ventas1.total_qty_mtd, ventas1.vs_total_qty_mtd_ly, ventas1.vs_total_qty_bud_mtd,
      ventas1.total_amount_mtd, ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd,
      ventas1.total_amount_mtd_ly, ventas1.total_amount_bud_mtd, ventas1.empty_value2,
      ventas1.total_qty_ytd, ventas1.vs_total_qty_ytd_ly, ventas1.vs_total_qty_bud_ytd,
      ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly, ventas1.vs_total_bud_ytd,
      ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      planta.cluster: Mexico
      ventas1.categoria: "-TOTAL EUR,-SUBTOTAL USD,-SUBTOTAL EUR"
    sorts: [ventas1.orden_categoria]
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
      ventas1.empty_value1: "'"
      ventas1.empty_value2: "."
      ventas1.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas1.categoria: 120
      ventas1.subcategoria: 120
      ventas1.daily_sales: 70
      ventas1.empty_value1: 10
      ventas1.empty_value2: 10
      ventas1.total_qty_mtd: 55
      ventas1.vs_total_qty_mtd_ly: 70
      ventas1.vs_total_qty_bud_mtd: 70
      ventas1.total_amount_mtd: 80
      ventas1.vs_total_amount_mtd_ly: 70
      ventas1.vs_total_bud_mtd: 70
      ventas1.total_amount_mtd_ly: 70
      ventas1.total_amount_bud_mtd: 80
      ventas1.total_qty_ytd: 55
      ventas1.vs_total_qty_ytd_ly: 70
      ventas1.vs_total_qty_bud_ytd: 70
      ventas1.total_amount_ytd: 75
      ventas1.vs_total_amount_ytd_ly: 70
      ventas1.vs_total_bud_ytd: 70
      ventas1.total_amount_ytd_ly: 70
      ventas1.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 6
    col: 0
    width: 24
    height: 10
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
  - title: ECN - NORTH
    name: ECN - NORTH
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.subcategoria, ventas1.daily_sales,
      ventas1.empty_value1, ventas1.total_qty_mtd, ventas1.vs_total_qty_mtd_ly, ventas1.vs_total_qty_bud_mtd,
      ventas1.total_amount_mtd, ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd,
      ventas1.total_amount_mtd_ly, ventas1.total_amount_bud_mtd, ventas1.empty_value2,
      ventas1.total_qty_ytd, ventas1.vs_total_qty_ytd_ly, ventas1.vs_total_qty_bud_ytd,
      ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly, ventas1.vs_total_bud_ytd,
      ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      planta.cluster: ECN - North
      ventas1.categoria: "-TOTAL MXN,-TOTAL USD,-SUBTOTAL USD,-SUBTOTAL EUR"
    sorts: [ventas1.orden_categoria]
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
      ventas1.empty_value1: "'"
      ventas1.empty_value2: "."
      ventas1.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas1.categoria: 120
      ventas1.subcategoria: 120
      ventas1.daily_sales: 70
      ventas1.empty_value1: 10
      ventas1.empty_value2: 10
      ventas1.total_qty_mtd: 55
      ventas1.vs_total_qty_mtd_ly: 70
      ventas1.vs_total_qty_bud_mtd: 70
      ventas1.total_amount_mtd: 80
      ventas1.vs_total_amount_mtd_ly: 70
      ventas1.vs_total_bud_mtd: 70
      ventas1.total_amount_mtd_ly: 70
      ventas1.total_amount_bud_mtd: 80
      ventas1.total_qty_ytd: 55
      ventas1.vs_total_qty_ytd_ly: 70
      ventas1.vs_total_qty_bud_ytd: 70
      ventas1.total_amount_ytd: 75
      ventas1.vs_total_amount_ytd_ly: 70
      ventas1.vs_total_bud_ytd: 70
      ventas1.total_amount_ytd_ly: 70
      ventas1.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 32
    col: 0
    width: 24
    height: 8
  - title: USA
    name: USA
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.subcategoria, ventas1.daily_sales,
      ventas1.empty_value1, ventas1.total_qty_mtd, ventas1.vs_total_qty_mtd_ly, ventas1.vs_total_qty_bud_mtd,
      ventas1.total_amount_mtd, ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd,
      ventas1.total_amount_mtd_ly, ventas1.total_amount_bud_mtd, ventas1.empty_value2,
      ventas1.total_qty_ytd, ventas1.vs_total_qty_ytd_ly, ventas1.vs_total_qty_bud_ytd,
      ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly, ventas1.vs_total_bud_ytd,
      ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      planta.cluster: USA
      ventas1.categoria: "-TOTAL MXN,-TOTAL EUR,-SUBTOTAL EUR,-SUBTOTAL USD"
    sorts: [ventas1.orden_categoria]
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
      ventas1.empty_value1: "'"
      ventas1.empty_value2: "."
      ventas1.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas1.categoria: 120
      ventas1.subcategoria: 120
      ventas1.daily_sales: 70
      ventas1.empty_value1: 10
      ventas1.empty_value2: 10
      ventas1.total_qty_mtd: 55
      ventas1.vs_total_qty_mtd_ly: 70
      ventas1.vs_total_qty_bud_mtd: 70
      ventas1.total_amount_mtd: 80
      ventas1.vs_total_amount_mtd_ly: 70
      ventas1.vs_total_bud_mtd: 70
      ventas1.total_amount_mtd_ly: 70
      ventas1.total_amount_bud_mtd: 80
      ventas1.total_qty_ytd: 55
      ventas1.vs_total_qty_ytd_ly: 70
      ventas1.vs_total_qty_bud_ytd: 70
      ventas1.total_amount_ytd: 75
      ventas1.vs_total_amount_ytd_ly: 70
      ventas1.vs_total_bud_ytd: 70
      ventas1.total_amount_ytd_ly: 70
      ventas1.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 16
    col: 0
    width: 24
    height: 4
  - title: GUATEMALA
    name: GUATEMALA
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.subcategoria, ventas1.daily_sales,
      ventas1.empty_value1, ventas1.total_qty_mtd, ventas1.vs_total_qty_mtd_ly, ventas1.vs_total_qty_bud_mtd,
      ventas1.total_amount_mtd, ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd,
      ventas1.total_amount_mtd_ly, ventas1.total_amount_bud_mtd, ventas1.empty_value2,
      ventas1.total_qty_ytd, ventas1.vs_total_qty_ytd_ly, ventas1.vs_total_qty_bud_ytd,
      ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly, ventas1.vs_total_bud_ytd,
      ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      planta.cluster: Guatemala
      ventas1.categoria: "-TOTAL EUR,-TOTAL MXN,-SUBTOTAL EUR,-SUBTOTAL USD"
    sorts: [ventas1.orden_categoria]
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
      ventas1.empty_value1: "'"
      ventas1.empty_value2: "."
      ventas1.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas1.categoria: 120
      ventas1.subcategoria: 120
      ventas1.daily_sales: 70
      ventas1.empty_value1: 10
      ventas1.empty_value2: 10
      ventas1.total_qty_mtd: 55
      ventas1.vs_total_qty_mtd_ly: 70
      ventas1.vs_total_qty_bud_mtd: 70
      ventas1.total_amount_mtd: 80
      ventas1.vs_total_amount_mtd_ly: 70
      ventas1.vs_total_bud_mtd: 70
      ventas1.total_amount_mtd_ly: 70
      ventas1.total_amount_bud_mtd: 80
      ventas1.total_qty_ytd: 55
      ventas1.vs_total_qty_ytd_ly: 70
      ventas1.vs_total_qty_bud_ytd: 70
      ventas1.total_amount_ytd: 75
      ventas1.vs_total_amount_ytd_ly: 70
      ventas1.vs_total_bud_ytd: 70
      ventas1.total_amount_ytd_ly: 70
      ventas1.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 24
    col: 0
    width: 24
    height: 5
  - title: ECS - SOUTH
    name: ECS - SOUTH
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.subcategoria, ventas1.daily_sales,
      ventas1.empty_value1, ventas1.total_qty_mtd, ventas1.vs_total_qty_mtd_ly, ventas1.vs_total_qty_bud_mtd,
      ventas1.total_amount_mtd, ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd,
      ventas1.total_amount_mtd_ly, ventas1.total_amount_bud_mtd, ventas1.empty_value2,
      ventas1.total_qty_ytd, ventas1.vs_total_qty_ytd_ly, ventas1.vs_total_qty_bud_ytd,
      ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly, ventas1.vs_total_bud_ytd,
      ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      planta.cluster: ECS - South
      ventas1.categoria: "-TOTAL MXN,-TOTAL USD,-SUBTOTAL EUR,-SUBTOTAL USD"
    sorts: [ventas1.orden_categoria]
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
      ventas1.empty_value1: "'"
      ventas1.empty_value2: "."
      ventas1.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas1.categoria: 120
      ventas1.subcategoria: 120
      ventas1.daily_sales: 70
      ventas1.empty_value1: 10
      ventas1.empty_value2: 10
      ventas1.total_qty_mtd: 55
      ventas1.vs_total_qty_mtd_ly: 70
      ventas1.vs_total_qty_bud_mtd: 70
      ventas1.total_amount_mtd: 80
      ventas1.vs_total_amount_mtd_ly: 70
      ventas1.vs_total_bud_mtd: 70
      ventas1.total_amount_mtd_ly: 70
      ventas1.total_amount_bud_mtd: 80
      ventas1.total_qty_ytd: 55
      ventas1.vs_total_qty_ytd_ly: 70
      ventas1.vs_total_qty_bud_ytd: 70
      ventas1.total_amount_ytd: 75
      ventas1.vs_total_amount_ytd_ly: 70
      ventas1.vs_total_bud_ytd: 70
      ventas1.total_amount_ytd_ly: 70
      ventas1.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 46
    col: 0
    width: 24
    height: 11
  - title: ECW - WEST
    name: ECW - WEST
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.subcategoria, ventas1.daily_sales,
      ventas1.empty_value1, ventas1.total_qty_mtd, ventas1.vs_total_qty_mtd_ly, ventas1.vs_total_qty_bud_mtd,
      ventas1.total_amount_mtd, ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd,
      ventas1.total_amount_mtd_ly, ventas1.total_amount_bud_mtd, ventas1.empty_value2,
      ventas1.total_qty_ytd, ventas1.vs_total_qty_ytd_ly, ventas1.vs_total_qty_bud_ytd,
      ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly, ventas1.vs_total_bud_ytd,
      ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      planta.cluster: ECW - West
      ventas1.categoria: "-TOTAL MXN,-TOTAL USD,-SUBTOTAL USD,-SUBTOTAL EUR"
    sorts: [ventas1.orden_categoria]
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
      ventas1.empty_value1: "'"
      ventas1.empty_value2: "."
      ventas1.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas1.categoria: 120
      ventas1.subcategoria: 120
      ventas1.daily_sales: 70
      ventas1.empty_value1: 10
      ventas1.empty_value2: 10
      ventas1.total_qty_mtd: 55
      ventas1.vs_total_qty_mtd_ly: 70
      ventas1.vs_total_qty_bud_mtd: 70
      ventas1.total_amount_mtd: 80
      ventas1.vs_total_amount_mtd_ly: 70
      ventas1.vs_total_bud_mtd: 70
      ventas1.total_amount_mtd_ly: 70
      ventas1.total_amount_bud_mtd: 80
      ventas1.total_qty_ytd: 55
      ventas1.vs_total_qty_ytd_ly: 70
      ventas1.vs_total_qty_bud_ytd: 70
      ventas1.total_amount_ytd: 75
      ventas1.vs_total_amount_ytd_ly: 70
      ventas1.vs_total_bud_ytd: 70
      ventas1.total_amount_ytd_ly: 70
      ventas1.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 57
    col: 0
    width: 24
    height: 4
  - title: ECC - CENTRAL
    name: ECC - CENTRAL
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.subcategoria, ventas1.daily_sales,
      ventas1.empty_value1, ventas1.total_qty_mtd, ventas1.vs_total_qty_mtd_ly, ventas1.vs_total_qty_bud_mtd,
      ventas1.total_amount_mtd, ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd,
      ventas1.total_amount_mtd_ly, ventas1.total_amount_bud_mtd, ventas1.empty_value2,
      ventas1.total_qty_ytd, ventas1.vs_total_qty_ytd_ly, ventas1.vs_total_qty_bud_ytd,
      ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly, ventas1.vs_total_bud_ytd,
      ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      planta.cluster: ECC - Central
      ventas1.categoria: "-TOTAL MXN,-TOTAL USD,-SUBTOTAL USD,-SUBTOTAL EUR"
    sorts: [ventas1.orden_categoria]
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
      ventas1.empty_value1: "'"
      ventas1.empty_value2: "."
      ventas1.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas1.categoria: 120
      ventas1.subcategoria: 120
      ventas1.daily_sales: 70
      ventas1.empty_value1: 10
      ventas1.empty_value2: 10
      ventas1.total_qty_mtd: 55
      ventas1.vs_total_qty_mtd_ly: 70
      ventas1.vs_total_qty_bud_mtd: 70
      ventas1.total_amount_mtd: 80
      ventas1.vs_total_amount_mtd_ly: 70
      ventas1.vs_total_bud_mtd: 70
      ventas1.total_amount_mtd_ly: 70
      ventas1.total_amount_bud_mtd: 80
      ventas1.total_qty_ytd: 55
      ventas1.vs_total_qty_ytd_ly: 70
      ventas1.vs_total_qty_bud_ytd: 70
      ventas1.total_amount_ytd: 75
      ventas1.vs_total_amount_ytd_ly: 70
      ventas1.vs_total_bud_ytd: 70
      ventas1.total_amount_ytd_ly: 70
      ventas1.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 40
    col: 0
    width: 24
    height: 6
  - title: CANADA
    name: CANADA
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.subcategoria, ventas1.daily_sales,
      ventas1.empty_value1, ventas1.total_qty_mtd, ventas1.vs_total_qty_mtd_ly, ventas1.vs_total_qty_bud_mtd,
      ventas1.total_amount_mtd, ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd,
      ventas1.total_amount_mtd_ly, ventas1.total_amount_bud_mtd, ventas1.empty_value2,
      ventas1.total_qty_ytd, ventas1.vs_total_qty_ytd_ly, ventas1.vs_total_qty_bud_ytd,
      ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly, ventas1.vs_total_bud_ytd,
      ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      planta.cluster: Canada
      ventas1.categoria: "-TOTAL MXN,-TOTAL EUR,-SUBTOTAL USD,-SUBTOTAL EUR"
    sorts: [ventas1.orden_categoria]
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
      ventas1.empty_value1: "'"
      ventas1.empty_value2: "."
      ventas1.vs_total_qty_mtd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_mtd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_qty_ytd_ly: "% VS TOTAL QTY LY"
      ventas1.vs_total_qty_bud_ytd: "% VS TOTAL QTY BUD"
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_column_widths:
      ventas1.categoria: 120
      ventas1.subcategoria: 120
      ventas1.daily_sales: 70
      ventas1.empty_value1: 10
      ventas1.empty_value2: 10
      ventas1.total_qty_mtd: 55
      ventas1.vs_total_qty_mtd_ly: 70
      ventas1.vs_total_qty_bud_mtd: 70
      ventas1.total_amount_mtd: 80
      ventas1.vs_total_amount_mtd_ly: 70
      ventas1.vs_total_bud_mtd: 70
      ventas1.total_amount_mtd_ly: 70
      ventas1.total_amount_bud_mtd: 80
      ventas1.total_qty_ytd: 55
      ventas1.vs_total_qty_ytd_ly: 70
      ventas1.vs_total_qty_bud_ytd: 70
      ventas1.total_amount_ytd: 75
      ventas1.vs_total_amount_ytd_ly: 70
      ventas1.vs_total_bud_ytd: 70
      ventas1.total_amount_ytd_ly: 70
      ventas1.total_amount_bud_ytd: 80
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 20
    col: 0
    width: 24
    height: 4
  - title: TOTAL AMERICA
    name: TOTAL AMERICA
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.daily_sales, ventas1.total_amount_mtd,
      ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd, ventas1.total_amount_mtd_ly,
      ventas1.total_amount_bud_mtd, ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly,
      ventas1.vs_total_bud_ytd, ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      ventas1.categoria: TOTAL MXN,TOTAL USD
      planta.region: Americas
    sorts: [ventas1.orden_categoria desc]
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
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 29
    col: 0
    width: 24
    height: 3
  - title: TOTAL EUROPE
    name: TOTAL EUROPE
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.daily_sales, ventas1.total_amount_mtd,
      ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd, ventas1.total_amount_mtd_ly,
      ventas1.total_amount_bud_mtd, ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly,
      ventas1.vs_total_bud_ytd, ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      ventas1.categoria: TOTAL MXN,TOTAL EUR
      planta.region: Europa
    sorts: [ventas1.orden_categoria]
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
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 61
    col: 0
    width: 24
    height: 3
  - title: CURRENCY
    name: CURRENCY
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.FCURR, ventas1.tc_diario]
    filters:
      ventas1.categoria: TOTAL MXN
      planta.pais: "-Mexico"
      ventas1.tc_diario: ">0"
    sorts: [ventas1.tc_diario desc 0]
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
      ventas1.FCURR: 125
      ventas1.tc_diario: 125
    series_cell_visualizations:
      ventas1.tc_diario:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    defaults_version: 1
    listen:
      Date: ventas1.date_filter
    row: 0
    col: 0
    width: 5
    height: 5
  - title: TOTAL
    name: TOTAL
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_categoria, ventas1.categoria, ventas1.daily_sales, ventas1.total_amount_mtd,
      ventas1.vs_total_amount_mtd_ly, ventas1.vs_total_bud_mtd, ventas1.total_amount_mtd_ly,
      ventas1.total_amount_bud_mtd, ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly,
      ventas1.vs_total_bud_ytd, ventas1.total_amount_ytd_ly, ventas1.total_amount_bud_ytd]
    filters:
      ventas1.categoria: TOTAL MXN,TOTAL USD
      planta.region: Americas,Europa
    sorts: [ventas1.orden_categoria]
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
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.total_amount_mtd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_mtd: TOTAL AMOUNT BUD
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.total_amount_ytd_ly: TOTAL AMOUNT LY
      ventas1.total_amount_bud_ytd: TOTAL AMOUNT BUD
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_categoria]
    listen:
      Date: ventas1.date_filter
    row: 64
    col: 0
    width: 24
    height: 3
  - title: SUMMARY
    name: SUMMARY
    model: alg_facturacion
    explore: ventas1
    type: looker_grid
    fields: [ventas1.orden_cluster_resumen, ventas1.cluster_resumen, ventas1.daily_sales,
      ventas1.empty_value1, ventas1.total_amount_mtd, ventas1.vs_total_amount_mtd_ly,
      ventas1.vs_total_bud_mtd, ventas1.empty_value2, ventas1.total_amount_ytd, ventas1.vs_total_amount_ytd_ly,
      ventas1.vs_total_bud_ytd]
    filters:
      planta.region: Americas,Europa
      ventas1.categoria: "-%TOTAL LOCAL CURRENCY%"
    sorts: [ventas1.orden_cluster_resumen]
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
      ventas1.empty_value1: "."
      ventas1.empty_value2: "."
      ventas1.vs_total_amount_mtd_ly: "% VS TOTAL AMOUNT LY"
      ventas1.vs_total_bud_mtd: "% VS TOTAL BUD"
      ventas1.vs_total_bud_ytd: "% VS TOTAL BUD"
      ventas1.vs_total_amount_ytd_ly: "% VS TOTAL AMOUNT LY"
    series_column_widths:
      ventas1.daily_sales: 70
      ventas1.empty_value1: 10
      ventas1.total_amount_mtd: 100
      ventas1.vs_total_amount_mtd_ly: 70
      ventas1.empty_value2: 10
      ventas1.vs_total_bud_mtd: 72
      ventas1.total_amount_ytd: 100
      ventas1.vs_total_amount_ytd_ly: 70
      ventas1.vs_total_bud_ytd: 70
      ventas1.cluster_resumen: 120
    series_cell_visualizations:
      ventas1.daily_sales:
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
    hidden_fields: [ventas1.orden_cluster_resumen]
    listen:
      Date: ventas1.date_filter
    row: 0
    col: 5
    width: 13
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
    explore: ventas1
    listens_to_filters: []
    field: ventas1.date_filter
