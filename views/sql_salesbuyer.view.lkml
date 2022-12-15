view: sql_salesbuyer {
  derived_table: {
    sql: SELECT t1.contactId AS id,
      IFNULL(((t1.discountQuantity/t1.quantityOrdered) * 100), 0) AS discountQuantityPercentage,
      CASE WHEN (IFNULL((((t1.discountQuantity/t1.quantityOrdered) * 100) >= 75), false) AND (s.opts.value = true)) THEN true ELSE false END AS salesBuyer,
      IFNULL(s.opts.value, false) AS optIn,
      FROM
      (SELECT customer.contactId AS contactId,
      SUM (CASE WHEN ((quantityOrdered > 0) AND ((CAST(createdTimestamp AS DateTime))
            BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -18 MONTH) AND CURRENT_DATE())) THEN quantityOrdered END) AS quantityOrdered,
      SUM (CASE WHEN ((discountAmount > 0) AND (quantityOrdered > 0) AND ((CAST(createdTimestamp AS DateTime))
            BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -18 MONTH) AND CURRENT_DATE())) THEN 1 END) AS discountQuantity,
            FROM `body-fit-test.orders.order_actual` order_actual,
            UNNEST (order_actual.orderLines) AS orderLines
            GROUP BY contactId) t1
            LEFT JOIN ( SELECT contactId, opts, FROM `body-fit-test.contacts.contact_actual` contact_actual, UNNEST (contact_actual.opts) AS opts) s
            ON t1.contactId = s.contactId
            ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: contact_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: quantity_ordered {
    type: number
    primary_key: yes
    sql: ${TABLE}.quantityOrdered ;;
    description: "Calculation of product quantity bought by customer"
  }

  dimension: discount_quantity {
    type: number
    primary_key: yes
    sql: ${TABLE}.discountQuantity ;;
    description: "Flag if customer bought products on discounts"
  }

  dimension: discount_quantity_percentage {
    type: number
    primary_key: yes
    sql: ${TABLE}.discountQuantityPercentage ;;
    description: "Calculation what percentage of the total number of bought quantity are discounted purchases"
  }

  dimension: sales_buyer {
    type: yesno
    primary_key: yes
    sql: ${TABLE}.SalesBuyer ;;
    description: "Customers with that purchased at least once in the last 18 months and have at least 75% of the purchased items discounted.
AND gave consent (are contactable by email)"
  }

  set: detail {
    fields: [
      contact_id,
      quantity_ordered,
      discount_quantity,
      discount_quantity_percentage,
      sales_buyer,
    ]
  }
}
