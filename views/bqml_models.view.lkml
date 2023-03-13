view: bqml_models {
  sql_table_name: `tmp.bqml_models`
    ;;

  dimension_group: created {
    type: time
    description: "When model was created"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: model_name {
    type: string
    description: "BigQuery ML model name"
    sql: ${TABLE}.model_name ;;
  }

  dimension: model_type {
    type: string
    description: "BigQuery ML model type"
    sql: ${TABLE}.model_type ;;
  }

  dimension: sql_text {
    type: string
    description: "SQL query used to create model"
    sql: ${TABLE}.sql_text ;;
  }

  dimension: target_column {
    type: string
    description: "The label column names in the training data (INPUT_LABEL_COLS)"
    sql: ${TABLE}.target_column ;;
  }

  measure: count {
    type: count
    drill_fields: [model_name]
  }
}
