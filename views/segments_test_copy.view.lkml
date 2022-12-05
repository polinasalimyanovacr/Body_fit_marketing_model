view: segments_test_copy {
  sql_table_name: `tmp.segments_test_copy`
    ;;

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension_group: creation_datetime {
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
    sql: ${TABLE}.creation_datetime ;;
  }

  dimension: include_similar_audience {
    type: yesno
    sql: ${TABLE}.include_similar_audience ;;
  }

  dimension: match_type {
    type: string
    sql: ${TABLE}.match_type ;;
  }

  dimension: segment_name {
    type: string
    sql: ${TABLE}.segment_name ;;
  }

  measure: count {
    type: count
    drill_fields: [segment_name]
  }
}
