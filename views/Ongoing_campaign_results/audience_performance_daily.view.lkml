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
  }

  dimension: audience_id {
    type: string
    sql: ${TABLE}.audience_id ;;
  }

  dimension: audience_size {
    type: number
    sql: ${TABLE}.audience_size ;;
  }

  dimension: avg_cpc {
    type: number
    sql: ${TABLE}.avg_CPC ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conv_rate {
    type: number
    sql: ${TABLE}.conv_rate ;;
  }

  dimension: conv_value {
    type: number
    sql: ${TABLE}.conv_value ;;
  }

  dimension: conv_value_per_cost {
    type: number
    sql: ${TABLE}.conv_value_per_cost ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.CTR ;;
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

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
