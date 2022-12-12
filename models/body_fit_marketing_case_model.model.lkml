connection: "body-fit-test"

# include all the views
include: "/views/**/*.view"

datagroup: body_fit_marketing_case_model_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: body_fit_marketing_case_model_default_datagroup

explore: segments_test_copy {}

explore: sql_inactive {}

explore: sql_salesbuyer {}

explore: sql_unusedvoucher{}

explore: segments_test {
    #Repeated nested object
    join: segments_test_copy {
      view_label: "Nested content"
      sql: LEFT JOIN UNNEST(orderLines.discountAmount) as discountAmount ;;
      relationship: one_to_many
    }

}
