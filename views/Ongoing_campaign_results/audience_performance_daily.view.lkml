
view: audience_performance_daily {
  sql_table_name: `tmp.audience_performance_daily`
    ;;

  dimension: ad_group {
    type: string
    sql: ${TABLE}.ad_group ;;
  }

  dimension: audience {
    type: string
    sql: ${TABLE}.audience ;;
    description: "Users that you group together based on any combination of attributes that is meaningful to your business"
  }


  dimension: audience_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.audience_id ;;
  }


  dimension: audience_size {
    type: number
    sql: ${TABLE}.audience_size ;;
    hidden: no
    description: "The number of customers' emails that are included into the campaign audience"
  }

  dimension: avg_cpc {
    type: number
    sql: ${TABLE}.avg_CPC ;;
    hidden: yes
    description: "Cost-per-click or CPC can be seen in the Acquisition reports and typically refers to people clicking through to your website from paid ads. This includes traffic from linked Google Ads accounts and campaign tagged URLs where the medium has been defined as ‘cpc’ or ‘paid’. "
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
    description: "The campaign name is provided when you use a campaign tagged URL for your inbound marketing or from your Google Ads campaigns "
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
    hidden: no
    description: "The number of clicks on your website URLs from a Google Search results page, not including clicks on paid Google Ads search results"
  }

  dimension: conv_rate {
    type: number
    sql: ${TABLE}.conv_rate ;;
    hidden: no
    description: "Conversion rates are calculated by simply taking the number of conversions and dividing that by the number of total ad interactions that can be tracked to a conversion during the same time period."
  }


  dimension: conv_value {
    type: number
    sql: ${TABLE}.conv_value ;;
    hidden: yes
    description: "Value per conversion tells you approximately how much, on average, each of your conversions is worth. It's calculated by dividing your total conversion value by the number in your “Conversions” column. This metric is useful if each of your conversions has a different value."
  }

  dimension: conv_value_per_cost {
    type: number
    sql: ${TABLE}.conv_value_per_cost ;;
    hidden: yes
    description: "Conversion value per cost estimates your return on investment. It's calculated by dividing your total conversion value by the total cost of all ad interactions."
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
    hidden: yes
    description: "A conversion is reported whenever a user completes a goal or makes a purchase during a session. Each goal will report a maximum of one conversion per session, while every transaction is reported. See also goal completion and ecommerce transaction. "
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
    description: "A cost is the value of money that has been used up to manage marketing campaigns"
    hidden: no
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.CTR ;;
    description: "CTR is the number of clicks that your ad receives divided by the number of times your ad is shown: clicks ÷ impressions = CTR."
    hidden: yes
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: gads_account {
    type: string
    sql: ${TABLE}.gads_account ;;
    description: "Marketing specialists can use different accounts in Google Ads to handle campaigns. Field Gads Account shows the account related to campaign"
  }

  dimension: gads_account_id {
    type: string
    sql: ${TABLE}.gads_account_id ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
    hidden: yes
    description: "The number of times any URL from your site appeared in search results viewed by a user, not including paid Google Ads search impressions."
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: impressios_sum {
    type: sum
    sql: ${TABLE}.impressions ;;
    hidden: no
    value_format: "#,##0"
    description: "The number of times any URL from your site appeared in search results viewed by a user, not including paid Google Ads search impressions."
  }

  measure: ctr_sum {
    type: sum
    sql: ${TABLE}.CTR ;;
    value_format: "#,##0.00"
    description: "CTR is the number of clicks that your ad receives divided by the number of times your ad is shown: clicks ÷ impressions = CTR."
  }

  measure: cost_sum {
    type: sum
    sql: ${TABLE}.cost ;;
    description: "A cost is the value of money that has been used up to manage marketing campaigns"
    value_format: "\"€\"#,##0.00"
  }

  measure: conversion_sum {
    type: sum
    sql: ${TABLE}.conversions ;;
    description: "A conversion is reported whenever a user completes a goal or makes a purchase during a session. Each goal will report a maximum of one conversion per session, while every transaction is reported. See also goal completion and ecommerce transaction. "
    value_format: "#,##0.00"
  }

  measure: conv_value_per_cost_sum {
    type: sum
    sql: ${TABLE}.conv_value_per_cost ;;
    description: "Conversion value per cost estimates your return on investment. It's calculated by dividing your total conversion value by the total cost of all ad interactions."
    value_format: "#,##0.00"
  }

  measure: conv_value_sum {
    type: sum
    sql: ${TABLE}.conv_value ;;
    description: "Value per conversion tells you approximately how much, on average, each of your conversions is worth. It's calculated by dividing your total conversion value by the number in your “Conversions” column. This metric is useful if each of your conversions has a different value."
    value_format: "#,##0.00"
  }

  measure: conv_rate_sum {
    type: sum
    sql: ${TABLE}.conv_rate ;;
    value_format: "#,##0.00"
    description: "Conversion rates are calculated by simply taking the number of conversions and dividing that by the number of total ad interactions that can be tracked to a conversion during the same time period."
  }


  measure: conv_rate_avg {
    type: average
    sql: ${TABLE}.conv_rate*100;;
    value_format: "#,##0.00"
    description: "Conversion rates are calculated by simply taking the number of conversions and dividing that by the number of total ad interactions that can be tracked to a conversion during the same time period."
  }

  measure: clicks_sum {
    type: sum
    sql: ${TABLE}.clicks ;;
    description: "The number of clicks on your website URLs from a Google Search results page, not including clicks on paid Google Ads search results"
    value_format: "#,##0"
    sql_distinct_key: ${TABLE}.audience_id;;
  }

  measure: avg_CPC_a {
    type: average
    sql: ${TABLE}.avg_CPC ;;
    description: "Cost-per-click or CPC can be seen in the Acquisition reports and typically refers to people clicking through to your website from paid ads. This includes traffic from linked Google Ads accounts and campaign tagged URLs where the medium has been defined as ‘cpc’ or ‘paid’. "
    value_format: "#,##0.00"
  }

  measure: audience_size_sum {
    type: number
    sql: ${TABLE}.audience_size ;;
    description: "The number of customers' emails that are included into the campaign audience"
    value_format: "#,##0"
  } }
