- dashboard: audience_overlap
  title: Audience Overlap
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: OHS8melFGGlDfw142hXQde
  elements:
  - title: comparing audiences
    name: comparing audiences
    model: body_fit_marketing_case_model
    explore: audience_overlap
    type: looker_grid
    fields: [audience_overlap.audience_segment, audience_overlap.audience_segment2,
      audience_overlap.audience_size, audience_overlap.co_occurences, audience_overlap.overlap]
    sorts: [audience_overlap.overlap desc]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      audience_overlap.co_occurences: 126
    series_cell_visualizations:
      audience_overlap.overlap:
        is_active: true
        palette:
          palette_id: b0b613a8-dd3a-1fb4-1455-c4f38216fc96
          collection_id: legacy
          custom_colors:
          - "#FFFFFF"
          - "#F36254"
        value_display: true
      audience_overlap.co_occurences:
        is_active: true
        palette:
          palette_id: ce8ca238-b0dc-c8c2-29dc-e8af5bc7e585
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#8860bd"
    series_value_format:
      audience_overlap.overlap:
        name: percent_0
        decimals: '0'
        format_string: "#,##0%"
        label: Percent (0)
        label_prefix: Percent
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
    series_types: {}
    listen:
      Gads Account ID: audience_overlap.gads_account_id
      Audience Segment: audience_overlap.audience_segment
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Gads Account ID
    title: Gads Account ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: marketer-bf-demo
    explore: audience_overlap
    listens_to_filters: []
    field: audience_overlap.gads_account_id
  - name: Audience Segment
    title: Audience Segment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: marketer-bf-demo
    explore: audience_overlap
    listens_to_filters: []
    field: audience_overlap.audience_segment
