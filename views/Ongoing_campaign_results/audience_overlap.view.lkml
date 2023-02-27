view: audience_overlap {
  sql_table_name: `body-fit-test.tmp.audience_overlap`
    ;;

  dimension: gads_account_id {
    type: string
    sql: ${TABLE}.gads_account_id ;;
  }

  dimension: audience_id {
    type: string
    sql: ${TABLE}.audience_id ;;
  }

  dimension: audience_id2 {
    type: string
    sql: ${TABLE}.audience_id2 ;;
  }

  dimension: audience_segment {
    type: string
    sql: ${TABLE}.audience_segment ;;
  }

  dimension: audience_segment2 {
    type: string
    sql: ${TABLE}.audience_segment2 ;;
  }

  dimension: audience_size {
    type: number
    sql: ${TABLE}.audience_size ;;
  }

  dimension: co_occurences {
    type: number
    sql: ${TABLE}.co_occurences ;;
  }

  dimension: overlap {
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.co_occurences/NULLIF(${TABLE}.audience_size,0) ;;
  }

  measure: overlap_measure {
    type: sum
    value_format_name: percent_2
    sql: ${TABLE}.co_occurences/NULLIF(${TABLE}.audience_size,0) ;;
    value_format: "0"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
