---
- dashboard: 10_yrs_dshbd_alg_vs_mkt
  title: 10 YRS DSHBD ALG vs MKT
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: QyqyDoQD3ceMKk1hxc6Ix0
  elements:
  - title: VOLUME COMPARISON (Thousands)
    name: VOLUME COMPARISON (Thousands)
    model: alg_facturacion_h
    explore: ventas_historico
    type: looker_line
    fields: [ventas_historico.cantidad, ventas_historico.cantidad_mercado, ventas_historico.fecha_year]
    fill_fields: [ventas_historico.fecha_year]
    sorts: [ventas_historico.fecha_year desc]
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
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      ventas_historico.cantidad: "#B42F37"
      ventas_historico.cantidad_mercado: "#44759A"
    series_labels:
      ventas_historico.cantidad: ENVASES
      ventas_historico.cantidad_mercado: MERCADO
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Cluster: ventas_historico.cluster
      Region: ventas_historico.region
      Distribution Channel: ventas_historico.canal_distribucion
      Date: ventas_historico.fecha_year
    row: 0
    col: 0
    width: 24
    height: 7
  - title: FOOD (Thousands)
    name: FOOD (Thousands)
    model: alg_facturacion_h
    explore: ventas_historico
    type: looker_line
    fields: [ventas_historico.cantidad, ventas_historico.cantidad_mercado, ventas_historico.fecha_year,
      ventas_historico.master_category]
    pivots: [ventas_historico.master_category]
    filters:
      ventas_historico.master_category: Food
    sorts: [ventas_historico.master_category, ventas_historico.fecha_year]
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
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: ventas_historico.cantidad,
            id: Food - ventas_historico.cantidad, name: Food - Ventas Historico Cantidad
              Facturada}, {axisId: ventas_historico.cantidad_mercado, id: Food - ventas_historico.cantidad_mercado,
            name: Food - Ventas Historico Cantidad Mercado}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_types:
      Food - ventas_historico.cantidad: column
      General Line - ventas_historico.cantidad: column
      Food - ventas_historico.cantidad_mercado: column
    series_colors:
      ventas_historico.cantidad: "#B42F37"
      Food - ventas_historico.cantidad: "#B42F37"
      General Line - ventas_historico.cantidad: "#B42F37"
      General Line - ventas_historico.cantidad_mercado: "#4276BE"
      Food - ventas_historico.cantidad_mercado: "#44759A"
    series_labels:
      ventas_historico.cantidad: ENVASES
      ventas_historico.cantidad_mercado: MERCADO
      Food - ventas_historico.cantidad: ENVASES
      Food - ventas_historico.cantidad_mercado: MARKET
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Cluster: ventas_historico.cluster
      Region: ventas_historico.region
      Distribution Channel: ventas_historico.canal_distribucion
      Date: ventas_historico.fecha_year
    row: 7
    col: 0
    width: 24
    height: 7
  - title: 'DETAIL by CATEGORY (ENVASES) '
    name: 'DETAIL by CATEGORY (ENVASES) '
    model: alg_facturacion_h
    explore: ventas_historico
    type: looker_grid
    fields: [ventas_historico.cantidad, ventas_historico.categoria_global, ventas_historico.fecha_year]
    pivots: [ventas_historico.fecha_year]
    fill_fields: [ventas_historico.fecha_year]
    filters:
      ventas_historico.cluster: ''
      ventas_historico.nombre_planta: ''
      ventas_historico.codigo_planta: ''
      ventas_historico.pais_planta: ''
    sorts: [ventas_historico.fecha_year, ventas_historico.cantidad desc 0]
    limit: 500
    column_limit: 50
    total: true
    filter_expression: matches_filter(${ventas_historico.categoria_global}, `-NULL`)
      AND matches_filter(${ventas_historico.categoria_global}, `-EMPTY`)
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 90
    series_cell_visualizations:
      ventas_historico.cantidad:
        is_active: true
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
      Cluster: ventas_historico.cluster
      Region: ventas_historico.region
      Distribution Channel: ventas_historico.canal_distribucion
      Date: ventas_historico.fecha_year
    row: 21
    col: 0
    width: 24
    height: 6
  - title: GENERAL LINE (Thousands)
    name: GENERAL LINE (Thousands)
    model: alg_facturacion_h
    explore: ventas_historico
    type: looker_line
    fields: [ventas_historico.cantidad, ventas_historico.cantidad_mercado, ventas_historico.fecha_year,
      ventas_historico.master_category]
    pivots: [ventas_historico.master_category]
    filters:
      ventas_historico.master_category: General Line
    sorts: [ventas_historico.master_category, ventas_historico.fecha_year]
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
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: ventas_historico.cantidad,
            id: Food - ventas_historico.cantidad, name: Food - Ventas Historico Cantidad
              Facturada}, {axisId: ventas_historico.cantidad_mercado, id: Food - ventas_historico.cantidad_mercado,
            name: Food - Ventas Historico Cantidad Mercado}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      Food - ventas_historico.cantidad: column
      General Line - ventas_historico.cantidad: column
      Food - ventas_historico.cantidad_mercado: column
      General Line - ventas_historico.cantidad_mercado: column
    series_colors:
      ventas_historico.cantidad: "#B42F37"
      Food - ventas_historico.cantidad: "#E57947"
      General Line - ventas_historico.cantidad: "#B42F37"
      General Line - ventas_historico.cantidad_mercado: "#44759A"
    series_labels:
      ventas_historico.cantidad: ENVASES
      ventas_historico.cantidad_mercado: MERCADO
      General Line - ventas_historico.cantidad: ENVASES
      General Line - ventas_historico.cantidad_mercado: MARKET
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Cluster: ventas_historico.cluster
      Region: ventas_historico.region
      Distribution Channel: ventas_historico.canal_distribucion
      Date: ventas_historico.fecha_year
    row: 14
    col: 0
    width: 24
    height: 7
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 10 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: alg_facturacion_h
    explore: ventas_historico
    listens_to_filters: []
    field: ventas_historico.fecha_year
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: alg_facturacion_h
    explore: ventas_historico
    listens_to_filters: []
    field: ventas_historico.region
  - name: Cluster
    title: Cluster
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: alg_facturacion_h
    explore: ventas_historico
    listens_to_filters: [Region]
    field: ventas_historico.cluster
  - name: Distribution Channel
    title: Distribution Channel
    type: field_filter
    default_value: Nacional
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: alg_facturacion_h
    explore: ventas_historico
    listens_to_filters: []
    field: ventas_historico.canal_distribucion
