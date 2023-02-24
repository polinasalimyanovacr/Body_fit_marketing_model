- dashboard: campaign_performance
  title: Campaign Performance
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: Zi4S3PDzFTl1ZtwxMuFjgK
  elements:
  - title: CTR
    name: CTR
    model: marketer-bf-demo
    explore: campaign_performance
    type: single_value
    fields: [campaign_performance.ctr]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.00%
    defaults_version: 1
    series_types: {}
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 0
    col: 0
    width: 4
    height: 2
  - title: CVR
    name: CVR
    model: marketer-bf-demo
    explore: campaign_performance
    type: single_value
    fields: [campaign_performance.conv_rate]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.00%
    defaults_version: 1
    series_types: {}
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 2
    col: 0
    width: 4
    height: 2
  - title: conversion value
    name: conversion value
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.conv_value]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_performance.conv_value_per_cost,
            id: campaign_performance.conv_value_per_cost, name: Conv Value per Cost}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 0
    col: 9
    width: 5
    height: 4
  - title: conv value / cost
    name: conv value / cost
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.conv_value_per_cost]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_performance.conv_value_per_cost,
            id: campaign_performance.conv_value_per_cost, name: Conv Value per Cost}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 0
    col: 4
    width: 5
    height: 4
  - title: tot number of contacts
    name: tot number of contacts
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.num_contacts]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_performance.conv_value_per_cost,
            id: campaign_performance.conv_value_per_cost, name: Conv Value per Cost}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 0
    col: 19
    width: 5
    height: 4
  - title: cost
    name: cost
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.cost]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_performance.conv_value_per_cost,
            id: campaign_performance.conv_value_per_cost, name: Conv Value per Cost}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 0
    col: 14
    width: 5
    height: 4
  - title: conversion rate (CVR)
    name: conversion rate (CVR)
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.date_week, campaign_performance.campaign, campaign_performance.conv_rate]
    pivots: [campaign_performance.campaign]
    fill_fields: [campaign_performance.date_week]
    sorts: [campaign_performance.campaign, campaign_performance.date_week desc]
    limit: 500
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: campaign_performance.conv_rate
        forecast_n: 4
        forecast_interval: week
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
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 9
    col: 0
    width: 19
    height: 5
  - title: click trough rate (CTR)
    name: click trough rate (CTR)
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.ctr, campaign_performance.date_week, campaign_performance.campaign]
    pivots: [campaign_performance.campaign]
    fill_fields: [campaign_performance.date_week]
    sorts: [campaign_performance.campaign, campaign_performance.date_week desc]
    limit: 500
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: campaign_performance.ctr
        forecast_n: 4
        forecast_interval: week
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
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 4
    col: 0
    width: 19
    height: 5
  - title: impressions
    name: impressions
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.impressions]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_performance.conv_value_per_cost,
            id: campaign_performance.conv_value_per_cost, name: Conv Value per Cost}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 4
    col: 19
    width: 5
    height: 4
  - title: average cost per click (CPC)
    name: average cost per click (CPC)
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.date_week, campaign_performance.campaign, campaign_performance.avg_cpc]
    pivots: [campaign_performance.campaign]
    fill_fields: [campaign_performance.date_week]
    sorts: [campaign_performance.campaign, campaign_performance.date_week desc]
    limit: 500
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: campaign_performance.avg_cpc
        forecast_n: 4
        forecast_interval: week
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
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 14
    col: 0
    width: 19
    height: 5
  - title: conversion value per cost (CVPC)
    name: conversion value per cost (CVPC)
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.date_week, campaign_performance.campaign, campaign_performance.conv_value_per_cost]
    pivots: [campaign_performance.campaign]
    fill_fields: [campaign_performance.date_week]
    sorts: [campaign_performance.campaign, campaign_performance.date_week desc]
    limit: 500
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: campaign_performance.conv_value_per_cost
        forecast_n: 4
        forecast_interval: week
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
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 19
    col: 0
    width: 19
    height: 5
  - title: clicks
    name: clicks
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.clicks]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_performance.conv_value_per_cost,
            id: campaign_performance.conv_value_per_cost, name: Conv Value per Cost}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 8
    col: 19
    width: 5
    height: 4
  - title: conversions
    name: conversions
    model: marketer-bf-demo
    explore: campaign_performance
    type: looker_column
    fields: [campaign_performance.conversions]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign_performance.conv_value_per_cost,
            id: campaign_performance.conv_value_per_cost, name: Conv Value per Cost}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Campaign: campaign_performance.campaign
      Date: campaign_performance.date_date
      Gads Account ID: campaign_performance.gads_account_id
    row: 12
    col: 19
    width: 5
    height: 4
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
    explore: campaign_performance
    listens_to_filters: []
    field: campaign_performance.gads_account_id
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: Test-Search-01
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: marketer-bf-demo
    explore: campaign_performance
    listens_to_filters: []
    field: campaign_performance.campaign
  - name: Date
    title: Date
    type: field_filter
    default_value: 2022/10/01 to 2023/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: marketer-bf-demo
    explore: campaign_performance
    listens_to_filters: []
    field: campaign_performance.date_date
