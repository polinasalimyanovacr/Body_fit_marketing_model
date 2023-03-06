view: orders {
  derived_table: {
    sql: SELECT  CONCAT ("Age: ", {{ _filters['orders.age_tier'] | sql_quote  }},
        ", Email HashCode: ", {{_filters['orders.email_hash_code'] | sql_quote}},
        ", Email consent: " ,{{ _filters['orders.email_consent'] | sql_quote }},
        ", City: " ,{{ _filters['orders.shipping_address_city'] | sql_quote }},
        ", Timestamp Date: " ,{{ _filters['orders.timestamp_date'] | sql_quote }},
        ", Gender: " ,{{ _filters['orders.gender'] | sql_quote }},
        ", Country Code: " ,{{ _filters['orders.shipping_address_country_code'] | sql_quote }},
        ", Inactive: " ,{{ _filters['sql_inactive.inactive'] | sql_quote  }},
        ", Did Not Buy: " ,{{ _filters['sql_notusedcampaign.did_not_buy'] | sql_quote }},
        ", Product Last18 Months: " ,{{ _filters['sql_productslast18months.product_last18_months'] | sql_quote }},
        ", Sales Buyer: " ,{{ _filters['sql_salesbuyer.sales_buyer'] | sql_quote }},
        ", Discount Quantity Percentage: " ,{{ _filters['sql_salesbuyer.discount_quantity_percentage'] | sql_quote }},
        ", Unused: " ,{{ _filters['sql_unusedvoucher.unused'] | sql_quote }},
        ", Product Type: " ,{{ _filters['sql_productslast18months.product_type'] | sql_quote }}) AS filter,
        s.age AS age,
        IFNULL(s.gender, "Null") AS gender,
        s.surname AS surname,
        transactionId,
        s.emailHashCode AS emailHashCode,
        (SELECT value FROM s.opts WHERE name = 'generalConditions' ORDER BY confirmedTimestamp DESC LIMIT 1) AS emailConsent,
        customer.contactId AS contactId,
        customer.languageCode AS contactLanguageCode,
        customer.emailAddress AS contactEmailAddress,
        shippingAddress.street AS shippingAddressStreet,
        CONCAT(COALESCE(shippingAddress.houseNumber, ''), COALESCE(shippingAddress.houseNumberSuffix, '')) AS shippingAddressHouseNumber,
        COALESCE(NULLIF(shippingAddress.city, ''), 'Null') AS shippingAddressCity,
        shippingAddress.postalCode AS shippingAddressPostalCode,
        COALESCE(NULLIF(shippingAddress.countryCode, ''), 'Null') AS shippingAddressCountryCode,
        totalAmountInclTax AS totalOrderRevenue,
        currency,
        timestamp,
        totalOrderedQuantity,
        COALESCE(totalCancelledQuantity, 0) AS totalCancelledQuantity, FROM (SELECT
        *
      FROM
        `body-fit-test.orders.order_actual`) t
        LEFT JOIN ( SELECT contactId, age, opts, gender, surname, emailHashCode FROM `body-fit-test.contacts.contact_actual` contact_actual) s
            ON t.customer.contactId = s.contactId
      WHERE
        t.customer.contactId IS NOT NULL;;
  }
  filter: null_values {
    type: string
    suggest_dimension: contact_id
    sql: ((${age_tier} = 'Undefined') OR (${gender} = 'Null') OR (${email_consent} IS NULL) OR (${shipping_address_city} = 'Null')
    OR (${shipping_address_country_code} = 'Null'));;
  }

  measure: count {
    type: count
    value_format: "#,##0"
  }

  measure: Count_Distinct_contacts {
    type: count_distinct
    sql: ${contact_id} ;;
    value_format_name: id
  }

  dimension: filter {
    type: string
    sql: ${TABLE}.filter ;;
  }

  dimension: email_consent {
    case: {
      when: {
        sql: ${TABLE}.emailConsent = False ;;
        label: "No"
      }
      when: {
        sql: ${TABLE}.emailConsent = True ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.emailConsent IS NULL ;;
        label: "Null"
      }
    }
  }

  dimension: surname {
    type: string
    sql: ${TABLE}.surname ;;
  }

  dimension: email_hash_code {
    type: string
    sql: ${TABLE}.emailHashCode ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }



#CONCAT(sql_inactive.inactive, " , " , sql_salesbuyer.SalesBuyer)
  dimension: Button_2 {
    type:  string
    sql:   ${TABLE}.contactId ;;
    html: <a href="https://crystalloids.eu.looker.com/looks/88?
          &f[orders.age_tier]={{ _filters['orders.age_tier'] | url_encode }}
          &f[orders.email_hash_code]={{ _filters['orders.email_hash_code'] | url_encode }}
          &f[orders.email_consent]={{ _filters['orders.email_consent'] | url_encode }}
          &f[orders.shipping_address_city]={{ _filters['orders.shipping_address_city'] | url_encode }}
          &f[orders.timestamp_date]={{ _filters['orders.timestamp_date'] | url_encode }}
          &f[orders.gender]={{ _filters['orders.gender'] | url_encode }}
          &f[orders.shipping_address_country_code]={{ _filters['orders.shipping_address_country_code'] | url_encode }}
          &f[sql_inactive.inactive]={{ _filters['sql_inactive.inactive'] | url_encode }}
          &f[sql_notusedcampaign.did_not_buy]={{ _filters['sql_notusedcampaign.did_not_buy'] | url_encode }}
          &f[sql_productslast18months.product_last18_months]={{ _filters['sql_productslast18months.product_last18_months'] | url_encode }}
          &f[sql_salesbuyer.sales_buyer]={{ _filters['sql_salesbuyer.sales_buyer'] | url_encode }}
          &f[sql_salesbuyer.discount_quantity_percentage]={{ _filters['sql_salesbuyer.discount_quantity_percentage'] | url_encode }}
          &f[sql_unusedvoucher.unused]={{ _filters['sql_unusedvoucher.unused'] | url_encode }}
          &f[sql_productslast18months.product_type]={{ _filters['sql_productslast18months.product_type'] | url_encode }}"><button>Click to Send</button></a>
            ;;
  }

  dimension: Button_3 {
    type:  string
    sql:   ${TABLE}.contactId ;;
    html: <a href="https://crystalloids.eu.looker.com/dashboards/69?
          &Timestamp+Date={{ _filters['orders.timestamp_date'] | url_encode}}
          &Age+Tier={{ _filters['orders.age_tier'] | url_encode }}%2C{{'Undefined'}}
          &Gender={{ _filters['orders.gender'] | url_encode }}%2C{{'%22Null%22'}}
          &Email+Consent={{ _filters['orders.email_consent'] | url_encode }}%2C{{'%22Null%22'}}
          &Shipping+Address+City={{ _filters['orders.shipping_address_city'] | url_encode }}
          &Shipping+Address+Country+Code={{ _filters['orders.shipping_address_country_code'] | url_encode }}
          &Inactive={{ _filters['sql_inactive.inactive'] | url_encode }}
          &Did+Not+Buy={{ _filters['sql_notusedcampaign.did_not_buy'] | url_encode }}
          &Product+Last18+Months={{ _filters['sql_productslast18months.product_last18_months'] | url_encode }}
          &Sales+Buyer={{ _filters['sql_salesbuyer.sales_buyer'] | url_encode }}
          &Discount+Quantity+Percentage={{ _filters['sql_salesbuyer.discount_quantity_percentage'] | url_encode }}
          &Unused={{ _filters['sql_unusedvoucher.unused'] | url_encode }}
          &Product+Type={{ _filters['sql_productslast18months.product_type'] | url_encode }}"><button>Inspect Null values</button></a>
            ;;
  }

#set the fields for drilling
  set: revenue_drill {
    fields: [contact_email_address,
      transaction_id,
      shipping_address_postal_code,
      currency,
      total_ordered_quantity,
      total_cancelled_quantity]
  }

  measure: total_revenue {
    type: sum
    sql: ${total_order_revenue} ;;
    value_format: "\"€\"#,##0.00"
    sql_distinct_key: ${TABLE}.transactionId;;
    drill_fields: [revenue_drill*]
  }

  measure: average_revenue {
    type: average
    sql: ${total_order_revenue} ;;
    value_format: "\"€\"#,##0.00"
    sql_distinct_key: ${TABLE}.transactionId;;
    drill_fields: [revenue_drill*]
  }

  measure: sum_ordered_quantity {
    type: sum
    sql: ${total_ordered_quantity} ;;
    sql_distinct_key: ${TABLE}.transactionId;;
    drill_fields: [revenue_drill*]
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transactionId ;;
  }

  dimension: contact_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.contactId ;;
  }

  dimension: contact_language_code {
    type: string
    sql: ${TABLE}.contactLanguageCode ;;
  }

  dimension: contact_email_address {
    type: string
    sql: ${TABLE}.contactEmailAddress ;;
    link: {
      label: "Send email to the customer"
      url: "mailto: {{value}}"
    }
  }

  dimension: shipping_address_street {
    type: string
    sql: ${TABLE}.shippingAddressStreet ;;
  }

  dimension: shipping_address_house_number {
    type: string
    sql: ${TABLE}.shippingAddressHouseNumber ;;
  }

  dimension: shipping_address_city {
    type: string
    sql: ${TABLE}.shippingAddressCity ;;
  }

  dimension: shipping_address_postal_code {
    type: string
    sql: ${TABLE}.shippingAddressPostalCode ;;
  }

  dimension: shipping_address_country_code {
    type: string
    sql: ${TABLE}.shippingAddressCountryCode ;;
  }

  dimension: total_order_revenue {
    type: number
    sql: ${TABLE}.totalOrderRevenue ;;
    value_format: "\"€\"#,##0.00"
    html:
    {% if value > 100 %}
    <p style="color: black; background-color: lightblue; font-size: 100%; text-align:center"> {{rendered_value}}</p>
    {% else %}
    <span stype="color:darkred;"> {{rendered_value}} </span>
    {% endif %};;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  dimension: total_ordered_quantity {
    type: number
    sql: ${TABLE}.totalOrderedQuantity ;;
  }

  dimension: total_cancelled_quantity {
    type: number
    sql: ${TABLE}.totalCancelledQuantity ;;
  }

  dimension: orders.age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [18, 25, 35, 45, 55, 65, 75, 90]
    style: integer
    sql: ${age} ;;
  }

  set: detail {
    fields: [
      transaction_id,
      age,
      contact_id,
      contact_language_code,
      contact_email_address,
      shipping_address_street,
      shipping_address_house_number,
      shipping_address_city,
      shipping_address_postal_code,
      shipping_address_country_code,
      total_order_revenue,
      currency,
      timestamp_time,
      total_ordered_quantity,
      total_cancelled_quantity,
      Count_Distinct_contacts
    ]
  }
}
