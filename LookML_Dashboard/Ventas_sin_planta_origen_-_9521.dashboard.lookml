---
- dashboard: ventas_sin_planta_origen__9521
  title: Ventas sin planta origen - 9521
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 1Reyo7AbLwsHaABlOp1t6u
  elements:
  - title: Ventas - sin planta origen
    name: Ventas - sin planta origen
    model: alg_facturacion
    explore: ventas_lotes
    type: looker_grid
    fields: [ventas_lotes.dates_month, ventas_lotes.fecha, ventas_lotes.documento_factura,
      ventas_lotes.Categoria, ventas_lotes.documento_entrega, ventas_lotes.monto_venta,
      ventas_lotes.cantidad_venta, ventas_lotes.cantidad_entrega, ventas_lotes.lote]
    filters: {}
    sorts: [ventas_lotes.dates_month, ventas_lotes.fecha, ventas_lotes.documento_factura,
      ventas_lotes.Categoria, ventas_lotes.documento_entrega]
    subtotals: [ventas_lotes.dates_month, ventas_lotes.fecha, ventas_lotes.documento_factura,
      ventas_lotes.Categoria, ventas_lotes.documento_entrega]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [ventas_lotes.dates_month, ventas_lotes.fecha, ventas_lotes.Categoria,
      ventas_lotes.documento_factura, ventas_lotes.documento_entrega, ventas_lotes.lote,
      ventas_lotes.cantidad_venta, ventas_lotes.monto_venta, ventas_lotes.cantidad_entrega]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_lotes.total_monto:
        is_active: false
    series_collapsed:
      ventas_lotes.documento_factura: true
      ventas_lotes.Categoria: true
      ventas_lotes.dates_month: true
      ventas_lotes.fecha: true
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_value_format:
      ventas_lotes.monto_venta:
        format_string: "$#,##0.00"
      ventas_lotes.cantidad_venta:
        format_string: "#,##0"
      ventas_lotes.cantidad_entrega:
        format_string: "#,##0"
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
      Fecha: ventas_lotes.fecha_seleccion
    row: 2
    col: 0
    width: 24
    height: 7
  - title: Total Monto Venta
    name: Total Monto Venta
    model: alg_facturacion
    explore: ventas_lotes
    type: single_value
    fields: [ventas_lotes.monto_venta]
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
    value_format: "$#,##0"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_lotes.total_monto:
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
    column_order: [ventas_lotes.fecha, ventas_lotes.documento_factura, ventas_lotes.Categoria,
      ventas_lotes.monto_venta, ventas_lotes.cantidad_venta, ventas_lotes.documento_entrega,
      ventas_lotes.total_cantidad_entrega]
    listen:
      Fecha: ventas_lotes.fecha_seleccion
    row: 0
    col: 0
    width: 7
    height: 2
  - title: Total Cantidad Venta
    name: Total Cantidad Venta
    model: alg_facturacion
    explore: ventas_lotes
    type: single_value
    fields: [ventas_lotes.cantidad_venta]
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
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      ventas_lotes.total_monto:
        is_active: false
    header_font_color: "#FFFFFF"
    header_background_color: "#5e2129"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    column_order: [ventas_lotes.fecha, ventas_lotes.documento_factura, ventas_lotes.Categoria,
      ventas_lotes.monto_venta, ventas_lotes.cantidad_venta, ventas_lotes.documento_entrega,
      ventas_lotes.total_cantidad_entrega]
    listen:
      Fecha: ventas_lotes.fecha_seleccion
    row: 0
    col: 7
    width: 7
    height: 2
  filters:
  - name: Fecha
    title: Fecha
    type: field_filter
    default_value: 2025/01/01 to 2025/05/29
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: alg_facturacion
    explore: ventas_lotes
    listens_to_filters: []
    field: ventas_lotes.fecha_seleccion
