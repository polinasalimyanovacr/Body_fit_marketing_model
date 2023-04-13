view: gads_customer_match_user_list {
  sql_table_name: `tmp.gads_customer_match_user_list`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: gads_account_id {
    type: string
    sql: ${TABLE}.gads_account_id ;;
  }

  dimension: hashed_email {
    type: string
    sql: ${TABLE}.hashed_email ;;
  }

  dimension: user_list_resource_name {
    type: string
    sql: ${TABLE}.user_list_resource_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, user_list_resource_name]
  }
}
