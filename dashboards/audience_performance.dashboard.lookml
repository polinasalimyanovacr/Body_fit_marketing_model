- dashboard: audience_performance
  title: Audience Performance
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: jjjACBGlDzjEVg56FAg4u5
  elements:
  - title: click trough rate (CTR)
    name: click trough rate (CTR)
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.ctr, audience_performance.date_week, audience_performance.audience]
    pivots: [audience_performance.audience]
    fill_fields: [audience_performance.date_week]
    filters:
      audience_performance.gads_account: ''
      audience_performance.audience: ''
    sorts: [audience_performance.audience, audience_performance.date_week desc]
    limit: 500
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: audience_performance.ctr
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
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.ctr,
            id: audience_performance.ctr, name: Ctr}], showLabels: true, showValues: true,
        maxValue: 1, minValue: 0, unpinAxis: false, tickDensity: default, type: linear},
      {label: '', orientation: right, series: [{axisId: audience_performance.conv_rate,
            id: audience_performance.conv_rate, name: Conv Rate}], showLabels: true,
        showValues: true, maxValue: 0.1, minValue: 0, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      non_purchasers_2022_q3 - audience_performance.impressions: "#929292"
      non_repeaters_2022_q3 - audience_performance.impressions: "#62bad4"
    defaults_version: 1
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Campaign: audience_performance.campaign
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
    row: 4
    col: 0
    width: 19
    height: 5
  - title: conversion rate (CVR)
    name: conversion rate (CVR)
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.date_week, audience_performance.audience, audience_performance.conv_rate]
    pivots: [audience_performance.audience]
    fill_fields: [audience_performance.date_week]
    sorts: [audience_performance.audience, audience_performance.date_week desc]
    limit: 500
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: audience_performance.conv_rate
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
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.ctr,
            id: audience_performance.ctr, name: Ctr}], showLabels: true, showValues: true,
        maxValue: 1, minValue: 0, unpinAxis: false, tickDensity: default, type: linear},
      {label: '', orientation: right, series: [{axisId: audience_performance.conv_rate,
            id: audience_performance.conv_rate, name: Conv Rate}], showLabels: true,
        showValues: true, maxValue: 0.1, minValue: 0, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      non_purchasers_2022_q3 - audience_performance.impressions: "#929292"
      non_repeaters_2022_q3 - audience_performance.impressions: "#62bad4"
    defaults_version: 1
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Campaign: audience_performance.campaign
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
    row: 9
    col: 0
    width: 19
    height: 5
  - title: average cost per click (CPC)
    name: average cost per click (CPC)
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.date_week, audience_performance.audience, audience_performance.avg_cpc]
    pivots: [audience_performance.audience]
    fill_fields: [audience_performance.date_week]
    sorts: [audience_performance.audience, audience_performance.date_week desc]
    limit: 500
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: audience_performance.avg_cpc
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
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: audience_performance.avg_cpc,
            id: non_purchasers_2022_q3 - audience_performance.avg_cpc, name: non_purchasers_2022_q3},
          {axisId: audience_performance.avg_cpc, id: non_repeaters_2022_q3 - audience_performance.avg_cpc,
            name: non_repeaters_2022_q3}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: log}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
    row: 14
    col: 0
    width: 19
    height: 6
  - title: impressions
    name: impressions
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.impressions, audience_performance.audience]
    pivots: [audience_performance.audience]
    sorts: [audience_performance.audience]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.impressions,
            id: non_purchasers_2022_q3 - audience_performance.impressions, name: non_purchasers_2022_q3},
          {axisId: audience_performance.impressions, id: non_repeaters_2022_q3 - audience_performance.impressions,
            name: non_repeaters_2022_q3}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    font_size: '12'
    series_types: {}
    show_dropoff: true
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    hidden_pivots: {}
    up_color: false
    down_color: false
    total_color: false
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
    row: 4
    col: 19
    width: 5
    height: 4
  - title: conversions
    name: conversions
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.audience, audience_performance.conversions]
    pivots: [audience_performance.audience]
    sorts: [audience_performance.audience]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.conversions,
            id: non_purchasers_2022_q3 - audience_performance.conversions, name: non_purchasers_2022_q3},
          {axisId: audience_performance.conversions, id: non_repeaters_2022_q3 - audience_performance.conversions,
            name: non_repeaters_2022_q3}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    font_size: '10'
    series_types: {}
    show_dropoff: true
    value_labels: labels
    label_type: labVal
    defaults_version: 1
    hidden_pivots: {}
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
    row: 12
    col: 19
    width: 5
    height: 4
  - title: clicks
    name: clicks
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.audience, audience_performance.clicks]
    pivots: [audience_performance.audience]
    sorts: [audience_performance.audience]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.clicks,
            id: non_purchasers_2022_q3 - audience_performance.clicks, name: non_purchasers_2022_q3},
          {axisId: audience_performance.clicks, id: non_repeaters_2022_q3 - audience_performance.clicks,
            name: non_repeaters_2022_q3}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    font_size: '12'
    series_types: {}
    show_dropoff: true
    value_labels: labels
    label_type: labVal
    defaults_version: 1
    hidden_pivots: {}
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
    row: 8
    col: 19
    width: 5
    height: 4
  - title: conversion value per cost (CVPC)
    name: conversion value per cost (CVPC)
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.date_week, audience_performance.audience, audience_performance.conv_value_per_cost]
    pivots: [audience_performance.audience]
    fill_fields: [audience_performance.date_week]
    sorts: [audience_performance.audience, audience_performance.date_week desc]
    limit: 500
    analysis_config:
      forecasting:
      - confidence_interval: 0.95
        field_name: audience_performance.conv_value_per_cost
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
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.clicks,
            id: non_purchasers_2022_q3 - audience_performance.clicks, name: non_purchasers_2022_q3
              - Audience Performance Clicks}, {axisId: audience_performance.cost,
            id: non_purchasers_2022_q3 - audience_performance.cost, name: non_purchasers_2022_q3
              - Audience Performance Cost}, {axisId: audience_performance.clicks,
            id: non_repeaters_2022_q3 - audience_performance.clicks, name: non_repeaters_2022_q3
              - Audience Performance Clicks}, {axisId: audience_performance.cost,
            id: non_repeaters_2022_q3 - audience_performance.cost, name: non_repeaters_2022_q3
              - Audience Performance Cost}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: audience_performance.avg_cpc, id: non_purchasers_2022_q3
              - audience_performance.avg_cpc, name: non_purchasers_2022_q3 - Audience
              Performance Avg Cpc}, {axisId: audience_performance.avg_cpc, id: non_repeaters_2022_q3
              - audience_performance.avg_cpc, name: non_repeaters_2022_q3 - Audience
              Performance Avg Cpc}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: log}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types: {}
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
    row: 20
    col: 0
    width: 19
    height: 6
  - title: audience size
    name: audience size
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.audience, audience_performance.audience_size]
    pivots: [audience_performance.audience]
    sorts: [audience_performance.audience]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.audience_size,
            id: non_purchasers_2022_q3 - audience_performance.audience_size, name: non_purchasers_2022_q3},
          {axisId: audience_performance.audience_size, id: non_repeaters_2022_q3 -
              audience_performance.audience_size, name: non_repeaters_2022_q3}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    font_size: '12'
    series_types: {}
    column_spacing_ratio: 0.1
    show_dropoff: true
    defaults_version: 1
    hidden_pivots: {}
    up_color: false
    down_color: false
    total_color: false
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
      Audience: audience_performance.audience
    row: 0
    col: 19
    width: 5
    height: 4
  - title: CVR
    name: CVR
    model: marketer-bf-demo
    explore: audience_performance
    type: single_value
    fields: [audience_performance.conv_rate]
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
    series_types: {}
    defaults_version: 1
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
      Audience: audience_performance.audience
    row: 2
    col: 0
    width: 4
    height: 2
  - title: CTR
    name: CTR
    model: marketer-bf-demo
    explore: audience_performance
    type: single_value
    fields: [audience_performance.ctr]
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
    series_types: {}
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
      Audience: audience_performance.audience
    row: 0
    col: 0
    width: 4
    height: 2
  - title: conversion value
    name: conversion value
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.audience, audience_performance.conv_value]
    pivots: [audience_performance.audience]
    sorts: [audience_performance.audience]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.cost,
            id: non_purchasers_2022_q3 - audience_performance.cost, name: non_purchasers_2022_q3},
          {axisId: audience_performance.cost, id: non_repeaters_2022_q3 - audience_performance.cost,
            name: non_repeaters_2022_q3}], showLabels: false, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    font_size: '12'
    label_value_format: '"€"0.000,'
    series_types: {}
    column_spacing_ratio: 0.1
    show_dropoff: true
    defaults_version: 1
    hidden_pivots: {}
    up_color: false
    down_color: false
    total_color: false
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
      Audience: audience_performance.audience
    row: 0
    col: 9
    width: 5
    height: 4
  - title: cost
    name: cost
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.audience, audience_performance.cost]
    pivots: [audience_performance.audience]
    sorts: [audience_performance.audience]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.cost,
            id: non_purchasers_2022_q3 - audience_performance.cost, name: non_purchasers_2022_q3},
          {axisId: audience_performance.cost, id: non_repeaters_2022_q3 - audience_performance.cost,
            name: non_repeaters_2022_q3}], showLabels: false, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    font_size: '10'
    label_value_format: '"€"0.000,'
    series_types: {}
    column_spacing_ratio: 0.1
    show_dropoff: true
    defaults_version: 1
    hidden_pivots: {}
    up_color: false
    down_color: false
    total_color: false
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
      Audience: audience_performance.audience
    row: 0
    col: 14
    width: 5
    height: 4
  - title: conv value / cost
    name: conv value / cost
    model: marketer-bf-demo
    explore: audience_performance
    type: looker_column
    fields: [audience_performance.audience, audience_performance.conv_value_per_cost]
    pivots: [audience_performance.audience]
    sorts: [audience_performance.audience]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: audience_performance.cost,
            id: non_purchasers_2022_q3 - audience_performance.cost, name: non_purchasers_2022_q3},
          {axisId: audience_performance.cost, id: non_repeaters_2022_q3 - audience_performance.cost,
            name: non_repeaters_2022_q3}], showLabels: false, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    font_size: '12'
    label_value_format: '"€"0.00'
    series_types: {}
    column_spacing_ratio: 0.1
    show_dropoff: true
    defaults_version: 1
    hidden_pivots: {}
    up_color: false
    down_color: false
    total_color: false
    listen:
      Ad Group: audience_performance.ad_group
      Date Date: audience_performance.date_date
      Campaign: audience_performance.campaign
      Audience: audience_performance.audience
    row: 0
    col: 4
    width: 5
    height: 4
  filters:
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: marketer-bf-demo
    explore: audience_performance
    listens_to_filters: []
    field: audience_performance.campaign
  - name: Ad Group
    title: Ad Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: marketer-bf-demo
    explore: audience_performance
    listens_to_filters: []
    field: audience_performance.ad_group
  - name: Date Date
    title: Date Date
    type: field_filter
    default_value: 2022/10/01 to 2023/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: marketer-bf-demo
    explore: audience_performance
    listens_to_filters: []
    field: audience_performance.date_date
  - name: Audience
    title: Audience
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: marketer-bf-demo
    explore: audience_performance
    listens_to_filters: []
    field: audience_performance.audience
