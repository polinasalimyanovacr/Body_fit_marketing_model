connection: "body-fit-test"

# include all the views
include: "/views/**/*.view"

# include all the dashboards by name (as '/dashboards/**/*.dashboard.lookml' does not work)
#include: "/dashboards/audience_overlap.dashboard.lookml"
#include: "/dashboards/audience_performance.dashboard.lookml"
#include: "/dashboards/campaign_performance.dashboard.lookml"

datagroup: body_fit_marketing_case_model_default_datagroup {
  sql_trigger: SELECT FORMAT_TIMESTAMP('%F',
  CURRENT_TIMESTAMP(), 'Europe/Amsterdam');;
  max_cache_age: "24 hour"
}

persist_with: body_fit_marketing_case_model_default_datagroup

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

explore: vocabulary {}


#MASTER VIEW with joins
explore:  orders {
  from:  orders
  #Explore shotcut to make Quick start panel
    query: Orders {
    dimensions: [contact_id, email_consent, email_hash_code, shipping_address_postal_code ]
    measures: [total_order_revenue, total_ordered_quantity ]
    label: "Contacts by country code"
    description: "The query helps to start the analysis of contacts in sections Revenue, Country code, Ordered quantity. "
    #pivots: [dimension1, dimension2, ... ]
    #sorts: [field1: asc, field2: desc, ... ]
    #filters: [field1: "value1", field2: "value2", ... ]
    limit: 100}

  query: contacts_sql_inactive {
    dimensions: [contact_id, email_consent, email_hash_code]
    measures: []
    label: "Inactive contacts"
    description: "The query helps to analyze inactive contacts that haven't made a purchase in a while"
    #pivots: [dimension1, dimension2, ... ]
    #sorts: [field1: asc, field2: desc, ... ]
    #filters: [field1: "value1", field2: "value2", ... ]
    limit: 100}

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

#I have skipped it at the moment as it cases warnings at the dashboard. You can copy paste the main explore of orders and include your model inside the new explore.
#  join: cltv_pred {
#    type:  left_outer
#    sql_on: ${cltv_pred.customer_id}=${orders.contact_id} ;;
#    relationship: many_to_one
#  }
  }

explore: segments_test {
  #Repeated nested object
  join: segments_test_copy {
    view_label: "Nested content"
    sql: LEFT JOIN UNNEST(orderLines.discountAmount) as discountAmount ;;
    relationship: one_to_many
  }

}


## list of aggregated tables to increase model performance

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
  aggregate_table: rollup__timestamp_year {
    query: {
      dimensions: [timestamp_year]
      measures: [count]
      filters: [
        orders.email_consent: "Yes",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
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

# Section to count number of selection
explore: +orders {
  aggregate_table: rollup__Count_Distinct_contacts__count {
    query: {
      measures: [Count_Distinct_contacts, count]
      filters: [
        orders.email_consent: "Yes",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

# Section ordered entitity in the past year
explore: +orders {
  aggregate_table: rollup__Count_Distinct_contacts__count__sum_ordered_quantity {
    query: {
      measures: [Count_Distinct_contacts, count, sum_ordered_quantity]
      filters: [
        orders.email_consent: "Yes",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        orders.timestamp_year: "2 years",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}



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
        orders.email_consent: "Yes",
        orders.timestamp_date: "2020/12/01 to 2023/02/23",
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

# Contact facet search
explore: +orders {
  aggregate_table: rollup__age__contact_id__email_hash_code__gender__shipping_address_country_code__sql_inactive_inactive__sql_productslast18months_product_last18_months__sql_salesbuyer_sales_buyer__surname {
    query: {
      dimensions: [
        age,
        contact_id,
        email_hash_code,
        gender,
        shipping_address_country_code,
        sql_inactive.inactive,
        sql_productslast18months.product_last18_months,
        sql_salesbuyer.sales_buyer,
        surname
      ]
      measures: [average_revenue, sum_ordered_quantity]
      filters: [
        orders.email_consent: "Yes",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_productslast18months.product_type: "beauty",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}



#Button to sent the selection
explore: +orders {
  aggregate_table: rollup__Button_2 {
    query: {
      dimensions: [Button_2]
      filters: [
        orders.email_consent: "Yes",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}


# The following aggregate tables should improve dashboard performance.
#MAIN DASHBOARD

explore: +orders {
  aggregate_table: rollup__email_hash_code__total_order_revenue__0 {
    query: {
      dimensions: [email_hash_code, total_order_revenue]
      measures: [sum_ordered_quantity]
      filters: [
        # "orders.email_consent" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.email_consent: "Yes",
        # "orders.timestamp_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        # "sql_salesbuyer.discount_quantity_percentage" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        sql_salesbuyer.discount_quantity_percentage: "[0,100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__Count_Distinct_contacts__average_revenue__count__total_revenue__1 {
    query: {
      measures: [Count_Distinct_contacts, average_revenue, count, total_revenue]
      filters: [
        # "orders.email_consent" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.email_consent: "Yes",
        # "orders.timestamp_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        # "sql_salesbuyer.discount_quantity_percentage" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        sql_salesbuyer.discount_quantity_percentage: "[0,100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__Count_Distinct_contacts__average_revenue__count__total_revenue__2 {
    query: {
      measures: [Count_Distinct_contacts, average_revenue, count, total_revenue]
      filters: [
        # "orders.email_consent" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.email_consent: "Yes",
        # "orders.timestamp_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        orders.timestamp_year: "2 years",
        # "sql_salesbuyer.discount_quantity_percentage" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        sql_salesbuyer.discount_quantity_percentage: "[0,100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__Count_Distinct_contacts__average_revenue__count__total_revenue__3 {
    query: {
      measures: [Count_Distinct_contacts, average_revenue, count, total_revenue]
      filters: [
        orders.email_consent: "Yes",
        orders.timestamp_year: "2 years",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__Count_Distinct_contacts__average_revenue__count__total_revenue__4 {
    query: {
      measures: [Count_Distinct_contacts, average_revenue, count, total_revenue]
      filters: [
        # "orders.email_consent" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.email_consent: "Yes",
        # "orders.timestamp_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        orders.timestamp_year: "2 years",
        # "sql_salesbuyer.discount_quantity_percentage" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        sql_salesbuyer.discount_quantity_percentage: "[0,100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__age_tier__email_consent__email_hash_code__gender__shipping_address_city__shipping_address_country_code__timestamp_date__total_order_revenue__5 {
    query: {
      dimensions: [
        age_tier,
        email_consent,
        email_hash_code,
        gender,
        shipping_address_city,
        shipping_address_country_code,
        timestamp_date,
        total_order_revenue
      ]
      measures: [sum_ordered_quantity]
      filters: [sql_salesbuyer.discount_quantity_percentage: "[0, 100]"]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__age__contact_id__email_hash_code__gender__shipping_address_country_code__surname__6 {
    query: {
      dimensions: [
        age,
        contact_id,
        email_hash_code,
        gender,
        shipping_address_country_code,
        surname
      ]
      measures: [average_revenue, sum_ordered_quantity]
      filters: [
        # "orders.email_consent" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.email_consent: "Yes",
        # "orders.timestamp_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_productslast18months.product_type: "beauty",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

# The following aggregate tables should improve dashboard performance.
# TRANSACTION VIEWER
explore: +orders {
  aggregate_table: rollup__timestamp_day_of_week__0 {
    query: {
      dimensions: [timestamp_day_of_week]
      measures: [count]
      filters: [
        orders.email_consent: "Yes",
        orders.shipping_address_country_code: "NL,LU,IE,FR",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__timestamp_day_of_month__1 {
    query: {
      dimensions: [timestamp_day_of_month]
      measures: [count]
      filters: [
        orders.email_consent: "Yes",
        orders.shipping_address_country_code: "NL,LU,IE,FR",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__timestamp_month__2 {
    query: {
      dimensions: [timestamp_month]
      measures: [count]
      filters: [
        orders.email_consent: "Yes",
        orders.shipping_address_country_code: "NL,LU,IE,FR",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__timestamp_year__3 {
    query: {
      dimensions: [timestamp_year]
      measures: [count]
      filters: [
        orders.email_consent: "Yes",
        orders.shipping_address_country_code: "NL,LU,IE,FR",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__timestamp_quarter__4 {
    query: {
      dimensions: [timestamp_quarter]
      measures: [count]
      filters: [
        orders.email_consent: "Yes",
        orders.shipping_address_country_code: "NL,LU,IE,FR",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__timestamp_month__5 {
    query: {
      dimensions: [timestamp_month]
      measures: [count]
      filters: [
        orders.email_consent: "Yes",
        orders.shipping_address_country_code: "NL,LU,IE,FR",
        orders.timestamp_date: "2020/12/01 to 2022/12/16",
        sql_salesbuyer.discount_quantity_percentage: "[0, 100]"
      ]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}

#CAMPAIGN PERFORMANCE DASHBOARD

explore: +audience_performance_daily {
  aggregate_table: rollup__audience__audience_size__campaign__0 {
    query: {
      dimensions: [audience, audience_size, campaign]
      measures: [audience_size_sum, avg_CPC_a, clicks_sum, conv_rate_avg, conv_rate_sum, conv_value_per_cost_sum, conv_value_sum, conversion_sum, cost_sum, ctr_sum, impressios_sum]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__campaign__campaign_history_campaign__campaign_history_date_date__1 {
    query: {
      dimensions: [campaign, campaign_history.campaign, campaign_history.date_date]
      measures: [avg_CPC_a, campaign_history.click, campaign_history.conversion, campaign_history.impression, clicks_sum, conv_rate_avg, conv_rate_sum, conv_value_per_cost_sum, conv_value_sum, conversion_sum, cost_sum, ctr_sum]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__campaign__campaign_history_audience__2 {
    query: {
      dimensions: [campaign, campaign_history.audience]
      measures: [campaign_history.total_ordered_quantity, campaign_history.total_ordered_revenue]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__campaign__cost__3 {
    query: {
      dimensions: [campaign, cost]
      measures: [cost_sum]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }

  aggregate_table: rollup__campaign__clicks__4 {
    query: {
      dimensions: [campaign, clicks]
      measures: [clicks_sum]
    }

    materialization: {
      datagroup_trigger: body_fit_marketing_case_model_default_datagroup
    }
  }
}
