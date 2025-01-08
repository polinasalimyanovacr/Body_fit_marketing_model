connection: "body-fit-test"

# include all the views
include: "/views/**/*.view"

# include all the dashboards by name (as '/dashboards/**/*.dashboard.lookml' does not work)
#include: "/dashboards/audience_overlap.dashboard.lookml"
#include: "/dashboards/audience_performance.dashboard.lookml"
#include: "/dashboards/campaign_performance.dashboard.lookml"

# datagroup: body_fit_marketing_case_model_default_datagroup {
#   sql_trigger: SELECT FORMAT_TIMESTAMP('%F',
#   CURRENT_TIMESTAMP(), 'Europe/Amsterdam');;
#   max_cache_age: "24 hour"
# }

# persist_with: body_fit_marketing_case_model_default_datagroup

explore: test_partition {}

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
