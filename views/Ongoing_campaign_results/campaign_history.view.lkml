view: campaign_history {
  sql_table_name: `body-fit-test.tmp.campaign_history`
    ;;

  dimension: ad_group {
    type: string
    sql: ${TABLE}.ad_group ;;
  }

  dimension: audience {
    type: string
    sql: ${TABLE}.audience ;;
  }

  dimension: audience_id {
    type: string
    sql: ${TABLE}.audience_id ;;
    primary_key: yes
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  measure: click {
    type: average
    sql: ${TABLE}.click ;;
    value_format: "#,##0"
    description: "The number of clicks on your website URLs from a Google Search results page, not including clicks on paid Google Ads search results"

  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  measure: conversion {
    type: sum
    sql: ${TABLE}.conversion ;;
    value_format: "#,##0"
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: date {
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.date ;;
  }

  dimension: gads_account {
    type: string
    sql: ${TABLE}.gads_account ;;
  }

  dimension: gads_account_id {
    type: string
    sql: ${TABLE}.gads_account_id ;;
  }

  dimension: hashed_email {
    type: string
    sql: ${TABLE}.hashed_email ;;
  }

  measure: impression {
    type: sum
    sql: ${TABLE}.impression ;;
    value_format: "#,##0"
  }

  measure: impression_avg {
    type: average
    sql: ${TABLE}.impression ;;
    value_format: "#,##0"
  }

  measure: total_ordered_quantity {
    type: average
    sql: ${TABLE}.total_ordered_quantity ;;
    value_format: "#,##0"
  }

  measure: total_ordered_revenue {
    type: average
    sql: ${TABLE}.total_ordered_revenue ;;
  }

  measure: total_orders {
    type: average
    sql: ${TABLE}.total_orders ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: conv_rate_avg {
    type: average
    sql: ${TABLE}.conversion*100;;
    value_format: "#,##0.00"
    description: "Conversion rates are calculated by simply taking the number of conversions and dividing that by the number of total ad interactions that can be tracked to a conversion during the same time period."
  }
}
