view: facebook_api_response {
  sql_table_name: select * from `body-fit-test.facebook.facebook_api_response`
  partition_key: [${timestamp_date}];;


  dimension: batch_number {
    type: number
    sql: ${TABLE}.batchNumber ;;
  }
  dimension: operation_id {
    type: string
    sql: ${TABLE}.operationId ;;
  }
  dimension: response {
    type: string
    sql: ${TABLE}.response ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  measure: count {
    type: count
  }
}
