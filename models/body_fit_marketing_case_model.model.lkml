connection: "body-fit-test"

# include all the views
include: "/views/**/*.view"

datagroup: body_fit_marketing_case_model_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

named_value_format: thousand_formatting {
  value_format: "#.###,00"
  strict_value_format: yes
}

persist_with: body_fit_marketing_case_model_default_datagroup

explore: bqml_models {}

explore: segments_test_copy {}

explore: contacts {}

explore: sql_inactive {}

explore: sql_salesbuyer {}

explore: sql_unusedvoucher{}

explore: sql_productslast18months {}

explore: sql_notusedcampaign {}

explore: vocabulary {}

#MASTER VIEW with joins
explore:  orders {
  join: sql_inactive {
   type: left_outer
    sql_on: ${orders.contact_id} = ${sql_inactive.contact_id} ;;
    relationship: many_to_one
  }

  join: contacts {
    type: left_outer
    sql_on: ${orders.contact_id} = ${contacts.contact_id};;
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

explore: segments_test {
    #Repeated nested object
    join: segments_test_copy {
      view_label: "Nested content"
      sql: LEFT JOIN UNNEST(orderLines.discountAmount) as discountAmount ;;
      relationship: one_to_many
    }

}
