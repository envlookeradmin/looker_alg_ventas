---
- dashboard: interactive_sales_performance_report_by_division
  title: Interactive Sales Performance Report By Division
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: Hz07H9r1wZLC0vBf03xxGk
  elements:
  - title: Sales by category
    name: Sales by category
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_grid
    fields: [ventas_consolidado.cluster, ventas_consolidado.categoria, ventas_consolidado.subcategoria,
      ventas_consolidado.daily_sales, ventas_consolidado.total_amount_mtd, ventas_consolidado.total_amount_mtd_ly,
      ventas_consolidado.vs_total_amount_mtd_ly, ventas_consolidado.total_amount_bud_mtd,
      ventas_consolidado.vs_total_bud_mtd, ventas_consolidado.total_amount_ytd, ventas_consolidado.total_amount_ytd_ly,
      ventas_consolidado.vs_total_amount_ytd_ly, ventas_consolidado.total_amount_bud_ytd,
      ventas_consolidado.vs_total_bud_ytd]
    sorts: [ventas_consolidado.cluster, ventas_consolidado.categoria, ventas_consolidado.subcategoria]
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
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
    listen:
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      "% VS Total Bud MTD": ventas_consolidado.vs_total_bud_mtd
      "% VS Total Bud YTD": ventas_consolidado.vs_total_bud_ytd
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 30
    col: 0
    width: 24
    height: 9
  - title: DAILY SALES
    name: DAILY SALES
    model: alg_facturacion
    explore: ventas_consolidado
    type: single_value
    fields: [ventas_consolidado.daily_sales]
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
    single_value_title: DAILY SALES
    value_format: "$#,##0"
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 0
    col: 7
    width: 5
    height: 3
  - title: TOTAL AMOUNT MTD
    name: TOTAL AMOUNT MTD
    model: alg_facturacion
    explore: ventas_consolidado
    type: single_value
    fields: [ventas_consolidado.total_amount_mtd]
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
    single_value_title: TOTAL AMOUNT MTD
    value_format: "$#,##0"
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 0
    col: 12
    width: 6
    height: 3
  - title: DAILY SALES (QUANTITY)
    name: DAILY SALES (QUANTITY)
    model: alg_facturacion
    explore: ventas_consolidado
    type: single_value
    fields: [ventas_consolidado.daily_sales_qty]
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
    custom_color: "#759884"
    single_value_title: DAILY SALES (QUANTITY)
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
    title_hidden: true
    listen:
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 3
    col: 7
    width: 5
    height: 3
  - title: TOTAL AMOUNT YTD
    name: TOTAL AMOUNT YTD
    model: alg_facturacion
    explore: ventas_consolidado
    type: single_value
    fields: [ventas_consolidado.total_amount_ytd]
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
    single_value_title: TOTAL AMOUNT YTD
    value_format: "$#,##0"
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 0
    col: 18
    width: 6
    height: 3
  - title: TOTAL QUANTITY MTD
    name: TOTAL QUANTITY MTD
    model: alg_facturacion
    explore: ventas_consolidado
    type: single_value
    fields: [ventas_consolidado.total_qty_mtd]
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
    custom_color: "#759884"
    single_value_title: TOTAL QUANTITY MTD
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 3
    col: 12
    width: 6
    height: 3
  - title: TOTAL QUANTITY YTD
    name: TOTAL QUANTITY YTD
    model: alg_facturacion
    explore: ventas_consolidado
    type: single_value
    fields: [ventas_consolidado.total_qty_ytd]
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
    custom_color: "#759884"
    single_value_title: TOTAL QUANTITY YTD
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 3
    col: 18
    width: 6
    height: 3
  - title: Top 10 Clients
    name: Top 10 Clients
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_bar
    fields: [ventas_consolidado.nombre_cliente, ventas_consolidado.total_amount_mtd_by_client]
    sorts: [ventas_consolidado.total_amount_mtd_by_client desc 0]
    limit: 10
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
    y_axes: [{label: TOTAL AMOUNT MTD, orientation: bottom, series: [{axisId: ventas_consolidado.total_amount_mtd_by_client,
            id: ventas_consolidado.total_amount_mtd_by_client, name: TOTAL AMOUNT
              MTD_}], showLabels: true, showValues: true, valueFormat: "$#,##0", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors:
      ventas_consolidado.total_amount_mtd: "#dc4033"
      ventas_consolidado.total_amount_mtd_by_client: "#dc4033"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: TOTAL AMOUNT MTD
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 18
    col: 0
    width: 12
    height: 6
  - title: Top 10 Category
    name: Top 10 Category
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_bar
    fields: [ventas_consolidado.total_amount_mtd, ventas_consolidado.categoria]
    sorts: [ventas_consolidado.total_amount_mtd desc 0]
    limit: 10
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ventas_consolidado.total_amount_mtd,
            id: ventas_consolidado.total_amount_mtd, name: TOTAL AMOUNT MTD}], showLabels: true,
        showValues: true, valueFormat: "$#,##0", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      ventas_consolidado.total_amount_mtd: "#759884"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: TOTAL AMOUNT MTD
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 18
    col: 12
    width: 12
    height: 6
  - title: TOTAL AMOUNT VS LY
    name: TOTAL AMOUNT VS LY
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_bar
    fields: [ventas_consolidado.total_amount_mtd, ventas_consolidado.total_amount_mtd_ly]
    sorts: [ventas_consolidado.total_amount_mtd_ly desc]
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
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ventas_consolidado.total_amount_mtd_ly,
            id: ventas_consolidado.total_amount_mtd_ly, name: TOTAL AMOUNT MTD LY},
          {axisId: ventas_consolidado.total_amount_mtd, id: ventas_consolidado.total_amount_mtd,
            name: TOTAL AMOUNT MTD}], showLabels: false, showValues: true, valueFormat: "$#,##0",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: "$#,##0"
    series_colors:
      Exportacion: "#FF8168"
      Nacional: "#EA4335"
      ventas_consolidado.total_amount_mtd: "#C01825"
      ventas_consolidado.total_amount_mtd_ly: "#7d8d8c"
    x_axis_datetime_label: ''
    show_dropoff: false
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: TOTAL AMOUNT YTD
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 7
    col: 12
    width: 12
    height: 5
  - title: Sales by distribution channel
    name: Sales by distribution channel
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_pie
    fields: [ventas_consolidado.total_amount_ytd, ventas_consolidado.canal_distribucion]
    sorts: [ventas_consolidado.total_amount_ytd desc 0]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    series_colors:
      Exportacion: "#a8ded6"
      Nacional: "#e5877f"
    show_value_labels: false
    font_size: 12
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: TOTAL AMOUNT YTD
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 13
    col: 0
    width: 12
    height: 5
  - title: EXCHANGE RATES
    name: EXCHANGE RATES
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_grid
    fields: [ventas_consolidado.m_tc_diario, ventas_consolidado.m_tc_mtd, ventas_consolidado.m_tc_mtd_ly,
      ventas_consolidado.m_tc_ytd, ventas_consolidado.m_tc_ytd_ly, ventas_consolidado.m_tc_bud_mtd,
      ventas_consolidado.FCURR]
    filters:
      ventas_consolidado.m_tc_diario: NOT NULL
    sorts: [ventas_consolidado.FCURR]
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
      ventas_consolidado.m_tc_bud_mtd: 50
      ventas_consolidado.FCURR: 65
      ventas_consolidado.m_tc_mtd: 55
      ventas_consolidado.m_tc_mtd_ly: 75
      ventas_consolidado.m_tc_ytd_ly: 50
      ventas_consolidado.m_tc_ytd: 45
      ventas_consolidado.m_tc_diario: 50
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      División: ventas_consolidado.division
    row: 2
    col: 0
    width: 7
    height: 4
  - title: Sales by distribution channel
    name: Sales by distribution channel (2)
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_pie
    fields: [ventas_consolidado.canal_distribucion, ventas_consolidado.total_amount_mtd]
    sorts: [ventas_consolidado.total_amount_mtd desc 0]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    series_colors:
      Exportacion: "#a8ded6"
      Nacional: "#e78580"
    show_value_labels: false
    font_size: 12
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: TOTAL AMOUNT YTD
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 7
    col: 0
    width: 12
    height: 5
  - title: TOTAL AMOUNT VS LY
    name: TOTAL AMOUNT VS LY (2)
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_bar
    fields: [ventas_consolidado.total_amount_ytd, ventas_consolidado.total_amount_ytd_ly]
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
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ventas_consolidado.total_amount_ytd_ly,
            id: ventas_consolidado.total_amount_ytd_ly, name: TOTAL AMOUNT YTD LY},
          {axisId: ventas_consolidado.total_amount_ytd, id: ventas_consolidado.total_amount_ytd,
            name: TOTAL AMOUNT YTD}], showLabels: false, showValues: true, valueFormat: "$#,##0",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: "$#,##0"
    series_colors:
      Exportacion: "#FF8168"
      Nacional: "#EA4335"
      ventas_consolidado.total_amount_mtd: "#5e2129"
      ventas_consolidado.total_amount_mtd_ly: "#80868B"
      ventas_consolidado.total_amount_ytd_ly: "#7d8d8c"
      ventas_consolidado.total_amount_ytd: "#C01825"
    show_dropoff: false
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: TOTAL AMOUNT YTD
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 13
    col: 12
    width: 12
    height: 5
  - name: YTD
    type: text
    title_text: YTD
    body_text: ''
    row: 12
    col: 0
    width: 24
    height: 1
  - name: MTD
    type: text
    title_text: MTD
    body_text: ''
    row: 6
    col: 0
    width: 24
    height: 1
  - title: Quantities by category
    name: Quantities by category
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_grid
    fields: [ventas_consolidado.cluster, ventas_consolidado.categoria, ventas_consolidado.subcategoria,
      ventas_consolidado.daily_sales_qty, ventas_consolidado.total_qty_mtd, ventas_consolidado.total_qty_mtd_ly,
      ventas_consolidado.vs_total_qty_mtd_ly, ventas_consolidado.total_qty_bud_mtd,
      ventas_consolidado.vs_total_qty_bud_mtd, ventas_consolidado.total_qty_ytd, ventas_consolidado.total_qty_ytd_ly,
      ventas_consolidado.vs_total_qty_ytd_ly, ventas_consolidado.total_qty_bud_ytd,
      ventas_consolidado.vs_total_qty_bud_ytd]
    sorts: [ventas_consolidado.cluster, ventas_consolidado.categoria, ventas_consolidado.subcategoria]
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
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
    listen:
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      "% VS Total Bud MTD": ventas_consolidado.vs_total_bud_mtd
      "% VS Total Bud YTD": ventas_consolidado.vs_total_bud_ytd
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 39
    col: 0
    width: 24
    height: 9
  - title: Top 10 Clients
    name: Top 10 Clients (2)
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_bar
    fields: [ventas_consolidado.nombre_cliente, ventas_consolidado.total_amount_ytd_by_client]
    sorts: [ventas_consolidado.total_amount_ytd_by_client desc 0]
    limit: 10
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
    y_axes: [{label: TOTAL AMOUNT YTD, orientation: bottom, series: [{axisId: ventas_consolidado.total_amount_ytd_by_client,
            id: ventas_consolidado.total_amount_ytd_by_client, name: TOTAL AMOUNT
              YTD_}], showLabels: true, showValues: true, valueFormat: "$#,##0", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors:
      ventas_consolidado.total_amount_mtd: "#dc4033"
      ventas_consolidado.total_amount_mtd_by_client: "#dc4033"
      ventas_consolidado.total_amount_ytd_by_client: "#dc4033"
    series_labels: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: TOTAL AMOUNT MTD
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 24
    col: 0
    width: 12
    height: 6
  - title: Top 10 Category
    name: Top 10 Category (2)
    model: alg_facturacion
    explore: ventas_consolidado
    type: looker_bar
    fields: [ventas_consolidado.categoria, ventas_consolidado.total_amount_ytd]
    sorts: [ventas_consolidado.total_amount_ytd desc 0]
    limit: 10
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ventas_consolidado.total_amount_mtd,
            id: ventas_consolidado.total_amount_mtd, name: TOTAL AMOUNT MTD}], showLabels: true,
        showValues: true, valueFormat: "$#,##0", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      ventas_consolidado.total_amount_mtd: "#759884"
      ventas_consolidado.total_amount_ytd: "#759884"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: TOTAL AMOUNT MTD
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 24
    col: 12
    width: 12
    height: 6
  - title: Data of the day
    name: Data of the day
    model: alg_facturacion
    explore: ventas_consolidado
    type: single_value
    fields: [ventas_consolidado.fecha_seleccionada]
    sorts: [ventas_consolidado.fecha_seleccionada]
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
    single_value_title: ''
    value_format: "$#,##0"
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_consolidado.daily_sales:
        is_active: false
    series_collapsed:
      ventas_consolidado.region: true
      ventas_consolidado.moneda_conversion: true
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
      Date: ventas_consolidado.date_filter
      Currency: ventas_consolidado.moneda_conversion
      Region: ventas_consolidado.region
      Cluster: ventas_consolidado.cluster
      Country: ventas_consolidado.pais
      Plant: ventas_consolidado.nombre_planta
      Category: ventas_consolidado.categoria
      Client: ventas_consolidado.nombre_cliente
      Sales Org: ventas_consolidado.organizacion_ventas
      Global Category: ventas_consolidado.categoria_global
      Corporate: ventas_consolidado.corporativo
      División: ventas_consolidado.division
    row: 0
    col: 0
    width: 7
    height: 2
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
    explore: ventas_consolidado
    listens_to_filters: []
    field: ventas_consolidado.date_filter
  - name: División
    title: División
    type: field_filter
    default_value: ALG,ALU,PET
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: []
    field: ventas_consolidado.division
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
    explore: ventas_consolidado
    listens_to_filters: [División]
    field: ventas_consolidado.region
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
    listens_to_filters: [Region, División]
    field: ventas_consolidado.cluster
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
    explore: ventas_consolidado
    listens_to_filters: [Region, Cluster, División]
    field: ventas_consolidado.pais
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
    explore: ventas_consolidado
    listens_to_filters: [Region, Cluster, Country, División]
    field: ventas_consolidado.organizacion_ventas
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
    explore: ventas_consolidado
    listens_to_filters: [Region, Cluster, Country, Sales Org, División]
    field: ventas_consolidado.nombre_planta
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
    explore: ventas_consolidado
    listens_to_filters: [Region, Cluster, Country, Sales Org, Plant, División]
    field: ventas_consolidado.categoria_global
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
    explore: ventas_consolidado
    listens_to_filters: [Region, Cluster, Country, Sales Org, Plant, Global Category,
      División]
    field: ventas_consolidado.categoria
  - name: Corporate
    title: Corporate
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: [Region, Cluster, Country, Sales Org, Plant, Global Category,
      Category, División]
    field: ventas_consolidado.corporativo
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
    explore: ventas_consolidado
    listens_to_filters: [Corporate, Region, Cluster, Country, Sales Org, Plant, Global
        Category, Category, División]
    field: ventas_consolidado.nombre_cliente
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
    explore: ventas_consolidado
    listens_to_filters: [División]
    field: ventas_consolidado.moneda_conversion
  - name: "% VS Total Bud MTD"
    title: "% VS Total Bud MTD"
    type: field_filter
    default_value: not null
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: []
    field: ventas_consolidado.vs_total_bud_mtd
  - name: "% VS Total Bud YTD"
    title: "% VS Total Bud YTD"
    type: field_filter
    default_value: not null
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: alg_facturacion
    explore: ventas_consolidado
    listens_to_filters: []
    field: ventas_consolidado.vs_total_bud_ytd
