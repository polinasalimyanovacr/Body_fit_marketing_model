view: audience_performance_daily {
  sql_table_name: `body-fit-test.tmp.audience_performance_daily`
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

  measure: audience_size {
    type: median
    sql: ${TABLE}.audience_size ;;
  }

  measure: avg_cpc {
    type: number
    sql: ${cost}/NULLIF(${clicks}, 0) ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: conv_rate {
    type: number
    sql: ${conversions}/NULLIF(${clicks}, 0) ;;
  }

  measure: conv_value {
    type: sum
    sql: ${TABLE}.conv_value ;;
  }

  measure: conv_value_per_cost {
    type: number
    sql: ${conv_value}/NULLIF(${cost}, 0) ;;
  }

  measure: conversions {
    type: sum
    sql: ${TABLE}.conversions ;;
  }

  measure: cost {
    type: sum
    sql: ${TABLE}.cost ;;
  }

  measure: ctr {
    type: number
    sql: ${clicks}/NULLIF(${impressions}, 0) ;;
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

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
