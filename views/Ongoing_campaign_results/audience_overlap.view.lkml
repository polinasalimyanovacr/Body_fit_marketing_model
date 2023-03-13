view: audience_overlap {
  sql_table_name: `body-fit-test.tmp.audience_overlap`
    ;;

  dimension: gads_account_id {
    type: string
    sql: ${TABLE}.gads_account_id ;;
  }

  dimension: audience_id {
    type: string
    primary_key: yes
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

  measure: audience_size_measure {
    type: sum
    sql: ${TABLE}.audience_size ;;
    value_format: "0"
  }

  measure: co_occurences_measure {
    type: sum
    sql: ${TABLE}.co_occurences;;
    value_format: "0"
  }

#  measure: conv_value_per_cost_main {
#    type: number
#    value_format: "#,##0"
#    sql: ${audience_performance_daily.conv_value}/NULLIF(${audience_performance_daily.cost}, 0) where ${audience_id}=${audience_performance_daily.audience_id};;
#  }

#  measure: conv_value_per_cost_second {
 #   type: number
 #   value_format: "#,##0"
 #   sql: ${audience_performance_daily.conv_value}/NULLIF(${audience_performance_daily.cost}, 0) where ${audience_id2}=${audience_performance_daily.audience_id};;
 # }


  measure: count {
    type: count
    drill_fields: []
  }
}
