connection: "body-fit-test"

# include all the views
include: "/views/**/*.view"

datagroup: body_fit_marketing_case_model_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: body_fit_marketing_case_model_default_datagroup

explore: bqml_models {}

explore: segments_test_copy {}

explore: sql_inactive {}

explore: sql_salesbuyer {}

explore: sql_unusedvoucher{}

explore:  contacts {
  join: orders {
    type: left_outer
    view_label: "Contacts + Orders"
    sql_on: ${orders.contact_id} = ${contacts.contact_id} ;;
    relationship: many_to_one
  }
  }

explore: sql_productslast18months {}

#MASTER VIEW
explore:  orders {
  join: contacts {
    type: left_outer
    sql_on: ${orders.contact_id} = ${contacts.contact_id} ;;
    relationship: many_to_one
  }
  join: sql_inactive {
   type: left_outer
    sql_on: ${orders.contact_id} = ${sql_inactive.contact_id} ;;
    relationship: many_to_one
  }
  join: sql_notusedcampaign {
    type: left_outer
    sql_on: ${orders.contact_id} = ${sql_notusedcampaign.contact_id} ;;
    relationship: many_to_one
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
