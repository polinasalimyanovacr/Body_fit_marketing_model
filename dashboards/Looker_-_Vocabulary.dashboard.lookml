- dashboard: dashboard__vocabulary
  title: Dashboard - Vocabulary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Oc3KV3STWG6umnTnvXNHaI
  elements:
  - title: Looker - vocabulary
    name: Looker - vocabulary
    model: body_fit_marketing_case_model
    explore: vocabulary
    type: looker_grid
    fields: [vocabulary.term, vocabulary.definition]
    sorts: [vocabulary.term]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    series_types: {}
    series_column_widths:
      vocabulary.term: 130
    listen:
      Term: vocabulary.term
    row: 0
    col: 0
    width: 24
    height: 14
  filters:
  - name: Term
    title: Term
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: body_fit_marketing_case_model
    explore: vocabulary
    listens_to_filters: []
    field: vocabulary.term
