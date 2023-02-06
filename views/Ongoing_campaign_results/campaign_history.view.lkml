view: campaign_history {
  sql_table_name: `tmp.campaign_history`
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
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: click {
    type: number
    sql: ${TABLE}.click ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: conversion {
    type: number
    sql: ${TABLE}.conversion ;;
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
  }

  dimension: gads_account_id {
    type: string
    sql: ${TABLE}.gads_account_id ;;
  }

  dimension: hashed_email {
    type: string
    sql: ${TABLE}.hashed_email ;;
  }

  dimension: impression {
    type: number
    sql: ${TABLE}.impression ;;
    description: "An impression is counted each time your ad is shown on a search result page or other sites on the Google Network."
  }

  dimension: total_ordered_quantity {
    type: number
    sql: ${TABLE}.total_ordered_quantity ;;
  }

  dimension: total_ordered_revenue {
    type: number
    sql: ${TABLE}.total_ordered_revenue ;;
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_revenue_s {
    type: sum
    sql: ${TABLE}.total_ordered_revenue ;;
    value_format: "\"€\"#,##0.00"
 #   sql_distinct_key: ${TABLE}.transactionId;;
  }

  measure: total_ordered_quantity_s {
    type: sum
    sql: ${TABLE}.total_ordered_quantity ;;
    value_format: "\"€\"#,##0.00"
    }
}
