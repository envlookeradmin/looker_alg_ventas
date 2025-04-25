---
- dashboard: ventas__cancelaciones
  title: Ventas - Cancelaciones
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 5hVtLbHVwgrjbpwHR4EcFU
  elements:
  - title: Montos
    name: Montos
    model: alg_facturacion
    explore: ventas_cancelaciones
    type: looker_grid
    fields: [ventas_cancelaciones.Categoria, ventas_cancelaciones.total_monto, ventas_cancelaciones.total_monto_cancelaciones,
      ventas_cancelaciones.Subcategoria, ventas_cancelaciones.total_monto_devoluciones,
      ventas_cancelaciones.total_monto_neto]
    filters: {}
    sorts: [ventas_cancelaciones.Categoria]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_cancelaciones.total_monto:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    truncate_column_names: false
    defaults_version: 1
    column_order: [ventas_cancelaciones.Categoria, ventas_cancelaciones.Subcategoria,
      ventas_cancelaciones.total_monto, ventas_cancelaciones.total_monto_devoluciones,
      ventas_cancelaciones.total_monto_cancelaciones]
    listen:
      Fecha Seleccion: ventas_cancelaciones.fecha_seleccion
      Organizacion Ventas: ventas_cancelaciones.organizacion_ventas
    row: 0
    col: 0
    width: 20
    height: 10
  - title: Cantidades
    name: Cantidades
    model: alg_facturacion
    explore: ventas_cancelaciones
    type: looker_grid
    fields: [ventas_cancelaciones.Categoria, ventas_cancelaciones.Subcategoria, ventas_cancelaciones.total_cantidad,
      ventas_cancelaciones.total_cantidad_cancelaciones, ventas_cancelaciones.total_cantidad_devoluciones,
      ventas_cancelaciones.total_cantidad_neto]
    filters: {}
    sorts: [ventas_cancelaciones.Categoria]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_cancelaciones.total_monto:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    truncate_column_names: false
    defaults_version: 1
    column_order: [ventas_cancelaciones.Categoria, ventas_cancelaciones.Subcategoria,
      ventas_cancelaciones.total_cantidad, ventas_cancelaciones.total_cantidad_devoluciones,
      ventas_cancelaciones.total_cantidad_cancelaciones, ventas_cancelaciones.total_cantidad_neto]
    listen:
      Fecha Seleccion: ventas_cancelaciones.fecha_seleccion
      Organizacion Ventas: ventas_cancelaciones.organizacion_ventas
    row: 10
    col: 0
    width: 20
    height: 10
  filters:
  - name: Fecha Seleccion
    title: Fecha Seleccion
    type: field_filter
    default_value: 2025/01/01 to 2025/04/17
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: alg_facturacion
    explore: ventas_cancelaciones
    listens_to_filters: []
    field: ventas_cancelaciones.fecha_seleccion
  - name: Organizacion Ventas
    title: Organizacion Ventas
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: alg_facturacion
    explore: ventas_cancelaciones
    listens_to_filters: []
    field: ventas_cancelaciones.organizacion_ventas
