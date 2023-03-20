connection: "body-fit-test"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: cltv{}

explore: cltv_pred {
  from:  cltv_pred
  join: orders_simple {
    type: left_outer
    sql_on: ${cltv_pred.customer_email}=${orders_simple.contact_email_address};${cltv_pred.country}=${orders_simple.shipping_address_country_code};${cltv_pred.currency}=${orders_simple.currency};${orders_simple.timestamp_date}=${cltv_pred.timestamp_date} ;;
    relationship: many_to_one
  }
}
