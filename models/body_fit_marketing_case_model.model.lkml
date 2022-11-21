connection: "body-fit-test"

# include all the views
include: "/views/**/*.view"

datagroup: body_fit_marketing_case_model_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: body_fit_marketing_case_model_default_datagroup

explore: segments_test_copy {}

explore: bqml_models {}

explore: segments_test {}

explore: gads_customer_match_user_list {}
