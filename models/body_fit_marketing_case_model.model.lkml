connection: "body-fit-test"

# include all the views
include: "/views/**/*.view"

# include all the dashboards
include: "/dashboards/audience_overlap.dashboard.lookml"

datagroup: body_fit_marketing_case_model_default_datagroup {
  sql_trigger: SELECT FORMAT_TIMESTAMP('%F',
  CURRENT_TIMESTAMP(), 'Europe/Amsterdam');;
  max_cache_age: "24 hour"
}

persist_with: body_fit_marketing_case_model_default_datagroup

explore: bqml_models {}

explore: segments_test_copy {}

# explore: audience_performance_daily  {
#   join: segments {
#     type: left_outer
#     sql_on: ${audience_performance_daily.audience_id}=${segments.id} ;;
#     relationship: many_to_one
#   }
#   join:  campaign_history {
#     type: left_outer
#     sql_on: ${audience_performance_daily.audience_id}=${campaign_history.audience_id} ;;
#     relationship: one_to_many
#   }
# }

explore: campaign_history {
  from:  campaign_history
}

explore: campaign_performance {
  from:  campaign_performance_daily
}

explore: audience_performance {
  from:  audience_performance_daily
}

explore: audience_overlap {
  from:  audience_overlap
}

explore: vocabulary {}

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

explore: +orders {
  aggregate_table: selection_count {
    query: {
      measures: [Count_Distinct_contacts, count]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

explore: +orders {
  aggregate_table: product_type_sales {
    query: {
      dimensions: [sql_productslast18months.product_type]
      measures: [sql_productslast18months.count]
      filters: [sql_productslast18months.product_last18_months: "Yes"]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

explore: +orders {
  aggregate_table: top_10_customers_by_revenue {
    query: {
      dimensions: [contact_email_address, total_order_revenue]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

explore: +orders {
  aggregate_table: inactive_customers {
    query: {
      dimensions: [sql_inactive.inactive]
      measures: [sql_inactive.count]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

explore: +orders {
  aggregate_table: sales_buyers_customers {
    query: {
      dimensions: [sql_salesbuyer.sales_buyer]
      measures: [sql_salesbuyer.count]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

explore: +orders {
  aggregate_table: selection_analysis {
    query: {
      dimensions: [
        age,
        contact_email_address,
        email_consent,
        gender,
        shipping_address_country_code,
        sql_inactive.inactive,
        sql_productslast18months.product_last18_months,
        sql_salesbuyer.sales_buyer,
        total_order_revenue,
        total_ordered_quantity
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}


explore: +orders {
  aggregate_table: rollup__timestamp_month {
    query: {
      dimensions: [timestamp_month]
      measures: [count]
      filters: [
        orders.age: "[0, 100]",
        orders.email_consent: "Yes",
        orders.timestamp_date: "2020/12/01 to 2022/12/16"
      ]
    }

    materialization: {
      increment_key: "orders.timestamp_date"
      increment_offset: 3
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

explore: +orders {
  aggregate_table: rollup__timestamp_day_of_month {
    query: {
      dimensions: [timestamp_day_of_month]
      measures: [count]
      filters: [
        orders.age: "[0, 100]",
        orders.email_consent: "Yes",
        orders.timestamp_date: "1 months"
      ]
    }

    materialization: {
      increment_key: "orders.timestamp_date"
      increment_offset: 3
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}
# Place in `body_fit_marketing_case_model` model
explore: +orders {
  aggregate_table: rollup__age__contact_email_address__contact_id__gender__shipping_address_country_code__sql_inactive_inactive__sql_productslast18months_product_last18_months__sql_salesbuyer_sales_buyer__surname {
    query: {
      dimensions: [
        age,
        contact_email_address,
        contact_id,
        gender,
        shipping_address_country_code,
        sql_inactive.inactive,
        sql_productslast18months.product_last18_months,
        sql_salesbuyer.sales_buyer,
        surname
      ]
      measures: [average_revenue, sum_ordered_quantity]
      filters: [
        orders.age: "[0, 100]",
        orders.email_consent: "Yes",
        orders.timestamp_date: "2020/12/01 to 2023/02/23",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
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
