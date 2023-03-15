view: cltv {
  sql_table_name: `body-fit-test.tmp.cltv_pred`
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

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: date_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_end ;;
  }

  dimension_group: date_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_start ;;
  }

  dimension: pred_cltv {
    type: number
    sql: ${TABLE}.pred_cltv ;;
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
