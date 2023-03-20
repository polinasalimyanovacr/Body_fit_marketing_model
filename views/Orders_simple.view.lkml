view: orders_simple {
  derived_table: {

    sql: SELECT

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



  measure: count {
    type: count
    value_format: "#,##0"
  }

  measure: Count_Distinct_contacts {
    type: count_distinct
    sql: ${contact_id} ;;
    value_format: "#,##0"
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
    value_format: "\"€\"#,##0"
    sql_distinct_key: ${TABLE}.transactionId;;
    drill_fields: [revenue_drill*]
  }

  measure: average_revenue {
    type: average
    sql: ${total_order_revenue} ;;
    value_format: "\"€\"#,##0"
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


  set: detail {
    fields: [
      transaction_id,

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
