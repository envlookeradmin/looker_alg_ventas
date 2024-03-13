---
- dashboard: envases__facturacion_
  title: Envases - facturacion_
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: qK3vFhafGvVPE0T0zr7ZaA
  elements:
  - title: Currency
    name: Currency
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
      ventas.moneda_transaccion: 110
      ventas.s_tipo_cambio: 100
    series_cell_visualizations:
      ventas.s_tipo_cambio:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#696969"
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
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 3
    col: 0
    width: 4
    height: 4
  - title: New Tile (Copy 2)
    name: New Tile (Copy 2)
    model: alg_facturacion
    explore: ventas
    type: single_value
    fields: [ventas.total_amount_mtd]
    filters:
      ventas.categoria: "-TOTAL USD,-TOTAL EUR"
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
    custom_color: "#000000"
    single_value_title: TOTAL AMOUNT MTD
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 3
    col: 9
    width: 5
    height: 2
  - title: DAILY SALES
    name: DAILY SALES
    model: alg_facturacion
    explore: ventas
    type: single_value
    fields: [ventas.daily_sales]
    filters:
      ventas.categoria: "-TOTAL USD,-TOTAL EUR"
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
    custom_color: "#000000"
    single_value_title: DAILY SALES
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
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 3
    col: 4
    width: 5
    height: 2
  - title: DAILY SALES (Copy)
    name: DAILY SALES (Copy)
    model: alg_facturacion
    explore: ventas
    type: single_value
    fields: [ventas.daily_sales_qty]
    filters: {}
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
    custom_color: "#000000"
    single_value_title: DAILY SALES (QUANTITY)
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
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 5
    col: 4
    width: 5
    height: 2
  - title: New Tile (Copy 4)
    name: New Tile (Copy 4)
    model: alg_facturacion
    explore: ventas
    type: single_value
    fields: [ventas.total_qty_mtd]
    filters: {}
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
    custom_color: "#000000"
    single_value_title: TOTAL QUANTITY MTD
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
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 5
    col: 9
    width: 5
    height: 2
  - title: New Tile (Copy 3)
    name: New Tile (Copy 3)
    model: alg_facturacion
    explore: ventas
    type: single_value
    fields: [ventas.total_amount_ytd]
    filters:
      ventas.categoria: "-TOTAL USD,-TOTAL EUR"
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
    custom_color: "#000000"
    single_value_title: TOTAL AMOUNT YTD
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
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 3
    col: 14
    width: 5
    height: 2
  - title: New Tile (Copy 5)
    name: New Tile (Copy 5)
    model: alg_facturacion
    explore: ventas
    type: single_value
    fields: [ventas.total_qty_ytd]
    filters: {}
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
    custom_color: "#000000"
    single_value_title: TOTAL QUANTITY YTD
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
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 5
    col: 14
    width: 5
    height: 2
  - title: 'Total amount vs last year by category '
    name: 'Total amount vs last year by category '
    model: alg_facturacion
    explore: ventas
    type: looker_column
    fields: [ventas.total_amount_ytd, ventas.total_amount_ytd_ly, ventas.categoria]
    filters:
      ventas.categoria: "-TOTAL USD,-TOTAL EUR"
    sorts: [ventas.total_amount_ytd desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: ventas.total_amount_ytd,
            id: ventas.total_amount_ytd, name: TOTAL AMOUNT YTD}, {axisId: ventas.total_amount_ytd_ly,
            id: ventas.total_amount_ytd_ly, name: TOTAL AMOUNT YTD LY}], showLabels: false,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      ventas.total_amount_ytd: "#5e2129"
      ventas.total_amount_ytd_ly: "#80868B"
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
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Date: ventas.date_filter
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 7
    col: 9
    width: 15
    height: 6
  - title: "(Better) Top 10 selling products"
    name: "(Better) Top 10 selling products"
    model: alg_facturacion
    explore: ventas
    type: looker_grid
    fields: [ventas.total_amount_ytd, grupo_material.descripcion]
    filters:
      grupo_material.descripcion: "-NULL"
    sorts: [ventas.total_amount_ytd desc 0]
    limit: 10
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
    header_font_color: "#FFFFFF"
    header_background_color: "#696969"
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ventas.total_amount_ytd,
            id: ventas.total_amount_ytd, name: TOTAL AMOUNT YTD}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    series_colors:
      ventas.total_amount_ytd: "#12B5CB"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    custom_color: "#5e2129"
    single_value_title: Data of the day
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: ventas.date_filter
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 13
    col: 0
    width: 12
    height: 6
  - title: Bottom 10 selling products
    name: Bottom 10 selling products
    model: alg_facturacion
    explore: ventas
    type: looker_grid
    fields: [ventas.total_amount_ytd, grupo_material.descripcion]
    filters:
      material.descripcion: "-NULL"
    sorts: [ventas.total_amount_ytd]
    limit: 10
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
    header_font_color: "#FFFFFF"
    header_background_color: "#696969"
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
    y_axes: [{label: '', orientation: left, series: [{axisId: ventas.total_amount_ytd,
            id: ventas.total_amount_ytd, name: TOTAL AMOUNT YTD}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      ventas.total_amount_ytd: "#FF8168"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    custom_color: "#5e2129"
    single_value_title: Data of the day
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: ventas.date_filter
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 13
    col: 12
    width: 12
    height: 6
  - title: Last updates by region
    name: Last updates by region
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
      bitacora.time_zone: 120
      bitacora.date_time: 120
    header_font_color: "#FFFFFF"
    header_background_color: "#696969"
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
    row: 3
    col: 19
    width: 5
    height: 4
  - title: Sales by distribution channel
    name: Sales by distribution channel
    model: alg_facturacion
    explore: ventas
    type: looker_pie
    fields: [ventas.total_amount_ytd, ventas.canal_distribucion]
    filters:
      ventas.categoria: "-TOTAL USD,-TOTAL EUR"
    sorts: [ventas.total_amount_ytd desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: true
    series_colors:
      ventas.total_amount_ytd: "#5e2129"
      ventas.total_amount_ytd_ly: "#80868B"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: ventas.total_amount_ytd,
            id: ventas.total_amount_ytd, name: TOTAL AMOUNT YTD}, {axisId: ventas.total_amount_ytd_ly,
            id: ventas.total_amount_ytd_ly, name: TOTAL AMOUNT YTD LY}], showLabels: false,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_pivots: {}
    listen:
      Date: ventas.date_filter
      Pais: planta.pais
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 7
    col: 0
    width: 9
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border-radius: 5px; padding: 5px 10px; background: #FFFFFF;\
      \ height: 100px; color: red;\">\n\t<nav style=\"font-size: 18px;\">\n\t\t<img\
      \ style=\"color: #efefef; padding: 5px 15px; float: left; height: 100px;\" src=\"\
      https://www.envases.mx/media/10252/envases_rgb600x400px.png\"/>\n\t\t\t\t\n\t\
      </nav>\n</div>"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Category
    name: Category
    model: alg_facturacion
    explore: ventas
    type: looker_grid
    fields: [ventas.orden_categoria, ventas.categoria, ventas.subcategoria, ventas.daily_sales,
      ventas.total_qty_mtd, ventas.total_amount_mtd, ventas.total_amount_mtd_ly, ventas.total_amount_bud_mtd,
      ventas.total_qty_ytd, ventas.total_amount_ytd, ventas.total_amount_ytd_ly, ventas.total_amount_bud_ytd]
    filters: {}
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
    header_text_alignment: center
    header_font_size: '9'
    rows_font_size: '9'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas.daily_sales:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#696969"
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
      Cluster: planta.cluster
      Planta: planta.nombre
    row: 19
    col: 0
    width: 24
    height: 8
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
    explore: ventas
    listens_to_filters: []
    field: planta.cluster
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
    explore: ventas
    listens_to_filters: [Cluster]
    field: planta.pais
  - name: Planta
    title: Planta
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas
    listens_to_filters: [Pais]
    field: planta.nombre
