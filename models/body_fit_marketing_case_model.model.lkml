connection: "body-fit-test"

# include all the views
include: "/views/**/*.view"

datagroup: body_fit_marketing_case_model_default_datagroup {
  sql_trigger: SELECT FORMAT_TIMESTAMP('%F',
  CURRENT_TIMESTAMP(), 'Europe/Amsterdam');;
  max_cache_age: "24 hour"
}

persist_with: body_fit_marketing_case_model_default_datagroup

explore: bqml_models {}

explore: segments_test_copy {}

explore: vocabulary {}

explore: audience_performance_daily  {
  join: segments {
    type: left_outer
    sql_on: ${audience_performance_daily.audience_id}=${segments.id} ;;
    relationship: many_to_one
  }
  join:  campaign_history {
    type: left_outer
    sql_on: ${audience_performance_daily.audience_id}=${campaign_history.audience_id} ;;
    relationship: one_to_many
  }
}

#MASTER VIEW with joins
explore:  orders {
  join: sql_inactive {
   type: left_outer
    sql_on: ${orders.contact_id} = ${sql_inactive.contact_id} ;;
    relationship: many_to_one
  }

  join: sql_notusedcampaign {
    type: left_outer
    sql_on: ${orders.contact_id} = ${sql_notusedcampaign.contact_id} ;;
    relationship: many_to_many
  }

  join: sql_productslast18months {
    type: left_outer
    sql_on: ${orders.contact_id} = ${sql_productslast18months.contact_id} ;;
    relationship: many_to_many
  }

  join: sql_salesbuyer {
    type: left_outer
    sql_on: ${orders.contact_id} = ${sql_salesbuyer.contact_id} ;;
    relationship: many_to_one
  }

  join: sql_unusedvoucher {
    type: left_outer
    sql_on: ${orders.contact_id} = ${sql_unusedvoucher.contact_id} ;;
    relationship: many_to_many
  }

}

# Place in `body_fit_marketing_case_model` model
explore: +orders {
  aggregate_table: rollup__contact_email_address__total_order_revenue {
    query: {
      dimensions: [contact_email_address, total_order_revenue]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}


explore: segments_test {
    #Repeated nested object
    join: segments_test_copy {
      view_label: "Nested content"
      sql: LEFT JOIN UNNEST(orderLines.discountAmount) as discountAmount ;;
      relationship: one_to_many
    }

}
