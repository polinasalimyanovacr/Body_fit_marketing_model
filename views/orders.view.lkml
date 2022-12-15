view: orders {
  derived_table: {
    sql: SELECT  IFNULL(s.age, 0) AS age,
        transactionId,
        customer.contactId AS contactId,
        customer.languageCode AS contactLanguageCode,
        customer.emailAddress AS contactEmailAddress,
        shippingAddress.street AS shippingAddressStreet,
        CONCAT(COALESCE(shippingAddress.houseNumber, ''), COALESCE(shippingAddress.houseNumberSuffix, '')) AS shippingAddressHouseNumber,
        shippingAddress.city AS shippingAddressCity,
        shippingAddress.postalCode AS shippingAddressPostalCode,
        shippingAddress.countryCode AS shippingAddressCountryCode,
        totalAmountInclTax AS totalOrderRevenue,
        currency,
        timestamp,
        totalOrderedQuantity,
        COALESCE(totalCancelledQuantity, 0) AS totalCancelledQuantity, FROM (SELECT
        *
      FROM
        `body-fit-test.orders.order_actual`) t
        LEFT JOIN ( SELECT contactId, age, FROM `body-fit-test.contacts.contact_actual` contact_actual) s
            ON t.customer.contactId = s.contactId
      WHERE
        t.customer.contactId IS NOT NULL;;
  }

  measure: count {
    type: count
  }

  measure: Count_Distinct_contacts {
    type: count_distinct
    sql: ${contact_id} ;;
    value_format_name: id
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
    sql: sum(${total_order_revenue}) over() ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transactionId ;;
  }

  dimension: contact_id {
    type: string
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
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
    drill_fields: [revenue_drill*]
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

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
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
