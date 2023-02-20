- dashboard: dashboard__marketing_dashboard
  title: Dashboard - Marketing Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  filters_bar_collapsed: true
  filters_location_top: false
  preferred_slug: cGfr2qPYIAyg2obN2sGbEw
  elements:
  - title: Product type Sales
    name: Product type Sales
    model: body_fit_marketing_case_model
    explore: orders
    type: looker_pie
    fields: [sql_productslast18months.count, sql_productslast18months.product_type]
    filters: {}
    sorts: [sql_productslast18months.count desc 0]
    limit: 500
    value_labels: legend
    label_type: labPer
    hidden_fields: []
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
    series_types: {}
    listen:
      Age: orders.age
      City: orders.shipping_address_city
      Timestamp Date: orders.timestamp_date
      Country Code: orders.shipping_address_country_code
      Email Consent (Yes / No): orders.email_consent
      Gender: orders.gender
      Inactive (Yes / No): sql_inactive.inactive
      Did Not Buy (Yes / No): sql_notusedcampaign.did_not_buy
      Product Last18 Months (Yes / No): sql_productslast18months.product_last18_months
      Sales Buyer (Yes / No): sql_salesbuyer.sales_buyer
      Discount Quantity Percentage: sql_salesbuyer.discount_quantity_percentage
      Unused (Yes / No): sql_unusedvoucher.unused
      Product Type: sql_productslast18months.product_type
    row: 4
    col: 0
    width: 6
    height: 8
  - title: Sales Buyers in selection
    name: Sales Buyers in selection
    model: body_fit_marketing_case_model
    explore: orders
    type: looker_grid
    fields: [sql_salesbuyer.sales_buyer, sql_salesbuyer.count]
    fill_fields: [sql_salesbuyer.sales_buyer]
    sorts: [sql_salesbuyer.count desc 0]
    limit: 500
    dynamic_fields: [{args: [sql_salesbuyer.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: sql_salesbuyer.count, label: Percent
          of SQL Salesbuyer Count, source_field: sql_salesbuyer.count, table_calculation: percent_of_sql_salesbuyer_count,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: true
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
    series_cell_visualizations:
      sql_salesbuyer.count:
        is_active: true
        palette:
          palette_id: legacy_diverging1
          collection_id: legacy
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    defaults_version: 1
    series_types: {}
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
    listen:
      Age: orders.age
      City: orders.shipping_address_city
      Timestamp Date: orders.timestamp_date
      Country Code: orders.shipping_address_country_code
      Email Consent (Yes / No): orders.email_consent
      Gender: orders.gender
      Inactive (Yes / No): sql_inactive.inactive
      Did Not Buy (Yes / No): sql_notusedcampaign.did_not_buy
      Product Last18 Months (Yes / No): sql_productslast18months.product_last18_months
      Sales Buyer (Yes / No): sql_salesbuyer.sales_buyer
      Discount Quantity Percentage: sql_salesbuyer.discount_quantity_percentage
      Unused (Yes / No): sql_unusedvoucher.unused
      Product Type: sql_productslast18months.product_type
    row: 9
    col: 6
    width: 11
    height: 3
  - title: Customers who haven't bought in a while in selection
    name: Customers who haven't bought in a while in selection
    model: body_fit_marketing_case_model
    explore: orders
    type: looker_grid
    fields: [sql_inactive.inactive, sql_inactive.count]
    fill_fields: [sql_inactive.inactive]
    sorts: [sql_inactive.count desc 0]
    limit: 500
    total: true
    dynamic_fields: [{args: [sql_salesbuyer.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: sql_salesbuyer.count, label: Percent
          of SQL Salesbuyer Count, source_field: sql_salesbuyer.count, table_calculation: percent_of_sql_salesbuyer_count,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [sql_inactive.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: sql_inactive.count, label: Percent
          of SQL Inactive Count, source_field: sql_inactive.count, table_calculation: percent_of_sql_inactive_count,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      sql_salesbuyer.count:
        is_active: true
        palette:
          palette_id: legacy_diverging1
          collection_id: legacy
      sql_inactive.count:
        is_active: true
        palette:
          palette_id: legacy_diverging1
          collection_id: legacy
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    defaults_version: 1
    series_types: {}
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
    note_state: collapsed
    note_display: above
    listen:
      Age: orders.age
      City: orders.shipping_address_city
      Timestamp Date: orders.timestamp_date
      Country Code: orders.shipping_address_country_code
      Email Consent (Yes / No): orders.email_consent
      Gender: orders.gender
      Inactive (Yes / No): sql_inactive.inactive
      Did Not Buy (Yes / No): sql_notusedcampaign.did_not_buy
      Product Last18 Months (Yes / No): sql_productslast18months.product_last18_months
      Sales Buyer (Yes / No): sql_salesbuyer.sales_buyer
      Discount Quantity Percentage: sql_salesbuyer.discount_quantity_percentage
      Unused (Yes / No): sql_unusedvoucher.unused
      Product Type: sql_productslast18months.product_type
    row: 6
    col: 6
    width: 11
    height: 3
  - title: Top 10 customers by Revenue
    name: Top 10 customers by Revenue
    model: body_fit_marketing_case_model
    explore: orders
    type: looker_grid
    fields: [orders.contact_email_address, orders.total_order_revenue, contacts.email_consent]
    sorts: [orders.total_order_revenue desc]
    limit: 10
    total: true
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      sql_salesbuyer.count:
        is_active: true
        palette:
          palette_id: legacy_diverging1
          collection_id: legacy
      sql_inactive.count:
        is_active: true
        palette:
          palette_id: legacy_diverging1
          collection_id: legacy
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    defaults_version: 1
    series_types: {}
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
    listen:
      Age: orders.age
      City: orders.shipping_address_city
      Timestamp Date: orders.timestamp_date
      Country Code: orders.shipping_address_country_code
      Email Consent (Yes / No): orders.email_consent
      Gender: orders.gender
      Inactive (Yes / No): sql_inactive.inactive
      Did Not Buy (Yes / No): sql_notusedcampaign.did_not_buy
      Product Last18 Months (Yes / No): sql_productslast18months.product_last18_months
      Sales Buyer (Yes / No): sql_salesbuyer.sales_buyer
      Discount Quantity Percentage: sql_salesbuyer.discount_quantity_percentage
      Unused (Yes / No): sql_unusedvoucher.unused
      Product Type: sql_productslast18months.product_type
    row: 0
    col: 6
    width: 11
    height: 6
  - title: Total revenue without filters
    name: Total revenue without filters
    model: body_fit_marketing_case_model
    explore: orders
    type: single_value
    fields: [orders.currency, round_total_revenue, orders.total_order_revenue]
    filters:
      orders.shipping_address_country_code: ''
      sql_productslast18months.product_last18_months: ''
      sql_notusedcampaign.did_not_buy: ''
      sql_inactive.inactive: ''
      sql_salesbuyer.sales_buyer: ''
      sql_unusedvoucher.unused: ''
      contacts.email_consent: ''
      orders.timestamp_date: 2020/12/01 to 2022/12/16
      orders.age: "[0, 100]"
      orders.shipping_address_city: ''
      sql_productslast18months.product_type: ''
    sorts: [round_total_revenue desc 0]
    limit: 560
    column_limit: 50
    total: true
    dynamic_fields: [{category: measure, expression: !!null '', label: Round Total
          Revenue, value_format: '0.', value_format_name: __custom, based_on: orders.total_revenue,
        _kind_hint: measure, measure: round_total_revenue, type: string, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#635189"
    single_value_title: Total Revenue
    value_format: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      sql_salesbuyer.count:
        is_active: true
        palette:
          palette_id: legacy_diverging1
          collection_id: legacy
      sql_inactive.count:
        is_active: true
        palette:
          palette_id: legacy_diverging1
          collection_id: legacy
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    value_labels: legend
    label_type: labPer
    hidden_fields:
    defaults_version: 1
    series_types: {}
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
    listen: {}
    row: 10
    col: 17
    width: 7
    height: 2
  - title: Total revenue - filters
    name: Total revenue - filters
    model: body_fit_marketing_case_model
    explore: orders
    type: single_value
    fields: [orders.currency, round_total_revenue, orders.total_order_revenue]
    filters: {}
    sorts: [round_total_revenue desc 0]
    limit: 560
    column_limit: 50
    total: true
    dynamic_fields: [{category: measure, expression: !!null '', label: Round Total
          Revenue, value_format: '0.', value_format_name: __custom, based_on: orders.total_revenue,
        _kind_hint: measure, measure: round_total_revenue, type: string, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#635189"
    single_value_title: Selection Total Revenue
    value_format: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      sql_salesbuyer.count:
        is_active: true
        palette:
          palette_id: legacy_diverging1
          collection_id: legacy
      sql_inactive.count:
        is_active: true
        palette:
          palette_id: legacy_diverging1
          collection_id: legacy
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    value_labels: legend
    label_type: labPer
    hidden_fields:
    defaults_version: 1
    series_types: {}
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
    listen:
      Age: orders.age
      City: orders.shipping_address_city
      Email Consent (Yes / No): orders.email_consent
      Gender: orders.gender
      Timestamp Date: orders.timestamp_date
      Country Code: orders.shipping_address_country_code
      Inactive (Yes / No): sql_inactive.inactive
      Did Not Buy (Yes / No): sql_notusedcampaign.did_not_buy
      Product Last18 Months (Yes / No): sql_productslast18months.product_last18_months
      Sales Buyer (Yes / No): sql_salesbuyer.sales_buyer
      Discount Quantity Percentage: sql_salesbuyer.discount_quantity_percentage
      Unused (Yes / No): sql_unusedvoucher.unused
      Product Type: sql_productslast18months.product_type
    row: 7
    col: 17
    width: 7
    height: 3
  - title: Selection with filter
    name: Selection with filter
    model: body_fit_marketing_case_model
    explore: orders
    type: single_value
    fields: [contacts_count, orders.count]
    sorts: [total_customers desc]
    limit: 500
    total: true
    dynamic_fields: [{category: table_calculation, expression: "${contacts_count:total}",
        label: Total customers, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: total_customers, _type_hint: number},
      {category: measure, expression: !!null '', label: Contacts count, value_format: !!null '',
        value_format_name: !!null '', based_on: contacts.contact_id, _kind_hint: measure,
        measure: contacts_count, type: count_distinct, _type_hint: number}, {category: table_calculation,
        expression: "${orders.count:total}", label: Total orders, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, table_calculation: total_orders,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Selection count
    value_format: ''
    comparison_label: Selection Orders
    conditional_formatting: [{type: less than, value: 2000, background_color: '',
        font_color: "#ed6168", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    series_types: {}
    hidden_fields: [contacts_count, orders.count]
    note_state: collapsed
    note_display: hover
    note_text: Business rule - Marketing campaign should be handled only with a selection
      bigger than 2.000 customer emails
    listen:
      Country Code: orders.shipping_address_country_code
      Timestamp Date: orders.timestamp_date
      Age: orders.age
      City: orders.shipping_address_city
      Email Consent (Yes / No): contacts.email_consent
      Gender: contacts.gender
      Inactive (Yes / No): sql_inactive.inactive
      Did Not Buy (Yes / No): sql_notusedcampaign.did_not_buy
      Product Last18 Months (Yes / No): sql_productslast18months.product_last18_months
      Sales Buyer (Yes / No): sql_salesbuyer.sales_buyer
      Discount Quantity Percentage: sql_salesbuyer.discount_quantity_percentage
      Unused (Yes / No): sql_unusedvoucher.unused
      Product Type: sql_productslast18months.product_type
    row: 3
    col: 17
    width: 7
    height: 4
  - title: 'Selection analysis based on complex metrics '
    name: 'Selection analysis based on complex metrics '
    model: body_fit_marketing_case_model
    explore: orders
    type: looker_grid
    fields: [orders.contact_email_address, orders.total_order_revenue, orders.total_ordered_quantity,
      orders.shipping_address_country_code, sql_inactive.inactive, sql_salesbuyer.sales_buyer,
      sql_productslast18months.product_last18_months]
    filters:
      contacts.age: ''
    sorts: [orders.contact_email_address]
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
      Country Code: orders.shipping_address_country_code
      Timestamp Date: orders.timestamp_date
      Age: orders.age
      City: orders.shipping_address_city
      Email Consent (Yes / No): orders.email_consent
      Gender: orders.gender
      Inactive (Yes / No): sql_inactive.inactive
      Did Not Buy (Yes / No): sql_notusedcampaign.did_not_buy
      Product Last18 Months (Yes / No): sql_productslast18months.product_last18_months
      Sales Buyer (Yes / No): sql_salesbuyer.sales_buyer
      Discount Quantity Percentage: sql_salesbuyer.discount_quantity_percentage
      Unused (Yes / No): sql_unusedvoucher.unused
      Product Type: sql_productslast18months.product_type
    row: 12
    col: 0
    width: 24
    height: 7
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |+
      <img alt="Another cute kitten pic" src="https://drive.google.com/uc?id=1ox4LFjvc8cjc2QJwU-REz4Pmd7hL4FCq" />



    row: 0
    col: 0
    width: 6
    height: 2
  - title: Send curent audience selection
    name: Send curent audience selection
    model: body_fit_marketing_case_model
    explore: orders
    type: single_value
    fields: [orders.Button_2]
    sorts: [orders.Button_2]
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
    series_types: {}
    listen:
      Country Code: orders.shipping_address_country_code
      Timestamp Date: orders.timestamp_date
      Age: orders.age
      City: orders.shipping_address_city
      Email Consent (Yes / No): orders.email_consent
      Gender: orders.gender
      Inactive (Yes / No): sql_inactive.inactive
      Did Not Buy (Yes / No): sql_notusedcampaign.did_not_buy
      Product Last18 Months (Yes / No): sql_productslast18months.product_last18_months
      Sales Buyer (Yes / No): sql_salesbuyer.sales_buyer
      Discount Quantity Percentage: sql_salesbuyer.discount_quantity_percentage
      Unused (Yes / No): sql_unusedvoucher.unused
      Product Type: sql_productslast18months.product_type
    row: 0
    col: 17
    width: 7
    height: 3
  - type: button
    name: button_315
    rich_content_json: '{"text":"Looker vocabulary","description":"","newTab":true,"alignment":"center","size":"large","style":"FILLED","color":"#6181aa","href":"https://crystalloids.eu.looker.com/dashboards/58?Term="}'
    row: 2
    col: 0
    width: 6
    height: 2
  filters:
  - name: Age
    title: Age
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options: []
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: orders.age
  - name: Email Consent (Yes / No)
    title: Email Consent (Yes / No)
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: orders.email_consent
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: orders.shipping_address_city
  - name: Timestamp Date
    title: Timestamp Date
    type: field_filter
    default_value: 2020/12/01 to 2022/12/16
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: orders.timestamp_date
  - name: Gender
    title: Gender
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: orders.gender
  - name: Country Code
    title: Country Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: orders.shipping_address_country_code
  - name: Inactive (Yes / No)
    title: Inactive (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: sql_inactive.inactive
  - name: Did Not Buy (Yes / No)
    title: Did Not Buy (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: sql_notusedcampaign.did_not_buy
  - name: Product Last18 Months (Yes / No)
    title: Product Last18 Months (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: sql_productslast18months.product_last18_months
  - name: Sales Buyer (Yes / No)
    title: Sales Buyer (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: sql_salesbuyer.sales_buyer
  - name: Discount Quantity Percentage
    title: Discount Quantity Percentage
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options: []
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: sql_salesbuyer.discount_quantity_percentage
  - name: Unused (Yes / No)
    title: Unused (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: sql_unusedvoucher.unused
  - name: Product Type
    title: Product Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options:
      - beauty
      - accessory
      - consumable
      - appliance
      - clothing
      - merchandised
    model: body_fit_marketing_case_model
    explore: orders
    listens_to_filters: []
    field: sql_productslast18months.product_type
