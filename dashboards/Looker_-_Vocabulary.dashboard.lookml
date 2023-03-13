- dashboard: dashboard__vocabulary
  title: Dashboard - Vocabulary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  filters_location_top: false
  preferred_slug: Oc3KV3STWG6umnTnvXNHaI
  elements:
  - type: button
    name: button_322
    rich_content_json: '{"text":"Domain data","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8"}'
    row: 0
    col: 8
    width: 3
    height: 1
  - type: button
    name: button_323
    rich_content_json: '{"text":"Data Definitions","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8"}'
    row: 0
    col: 0
    width: 3
    height: 1
  - type: button
    name: button_324
    rich_content_json: '{"text":"KPIs ","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8"}'
    row: 0
    col: 3
    width: 2
    height: 1
  - type: button
    name: button_325
    rich_content_json: '{"text":"Metadata","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8"}'
    row: 0
    col: 5
    width: 3
    height: 1
  - title: Business Vocabulary
    name: Business Vocabulary
    model: body_fit_marketing_case_model
    explore: vocabulary
    type: looker_grid
    fields: [vocabulary.scope, vocabulary.term, vocabulary.description]
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
    defaults_version: 1
    listen:
      Scope: vocabulary.scope
    row: 1
    col: 0
    width: 24
    height: 12
  filters:
  - name: Scope
    title: Scope
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: body_fit_marketing_case_model
    explore: vocabulary
    listens_to_filters: []
    field: vocabulary.scope
