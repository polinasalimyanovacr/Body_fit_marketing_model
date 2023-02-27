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
    type: sum
    sql: ${TABLE}.click ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  measure: conversion {
    type: sum
    sql: ${TABLE}.conversion ;;
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
  }

  measure: num_contacts {
    type: sum
    sql: ${TABLE}.num_contacts ;;
  }

  measure: total_ordered_quantity {
    type: sum
    sql: ${TABLE}.total_ordered_quantity ;;
  }

  measure: total_ordered_revenue {
    type: sum
    sql: ${TABLE}.total_ordered_revenue ;;
  }

  measure: total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
