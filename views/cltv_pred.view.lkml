view: cltv_pred {
  sql_table_name: `tmp.cltv_pred`
    ;;

  dimension: cltv {
    type: number
    sql: ${TABLE}.cltv ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_email {
    type: string
    sql: ${TABLE}.customer_email ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: pred_cltv {
    type: number
    sql: ${TABLE}.pred_cltv ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_cltv {
    type: average
    sql: ${pred_cltv} ;;
    value_format: "\"€\"#,##0.00"
    sql_distinct_key: ${TABLE}.customer_id;;
    drill_fields: []
  }
}
