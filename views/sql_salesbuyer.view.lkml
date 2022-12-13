view: sql_salesbuyer {
  derived_table: {
    sql: SELECT t1.contactId AS Id,
      t1.discountQuantity/t1.quantityOrdered AS discountQuantityPercentage,
      IFNULL((((t1.discountQuantity/t1.quantityOrdered) >= 0.75) AND (value = true)), false) AS salesBuyer,
      value AS optIn,
      FROM
      (SELECT customer.contactId AS contactId,
      SUM (CASE WHEN ((quantityOrdered > 0) AND ((CAST(createdTimestamp AS DateTime))
            BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -18 MONTH) AND CURRENT_DATE())) THEN quantityOrdered END) AS quantityOrdered,
      SUM (CASE WHEN ((discountAmount > 0) AND ((CAST(createdTimestamp AS DateTime))
            BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -18 MONTH) AND CURRENT_DATE())) THEN 1 END) AS discountQuantity,
            FROM `body-fit-test.orders.order_actual` order_actual,
            UNNEST (order_actual.orderLines) AS orderLines
            GROUP BY contactId) t1
            INNER JOIN `body-fit-test.contacts.contact_actual` contact_actual ON t1.contactId = contact_actual.contactId,
            UNNEST (contact_actual.opts) AS opts;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contactId ;;
  }

  dimension: quantity_ordered {
    type: number
    sql: ${TABLE}.quantityOrdered ;;
  }

  dimension: discount_quantity {
    type: number
    sql: ${TABLE}.discountQuantity ;;
  }

  dimension: discount_quantity_percentage {
    type: number
    sql: ${TABLE}.discountQuantityPercentage ;;
  }

  dimension: sales_buyer {
    type: yesno
    sql: ${TABLE}.SalesBuyer ;;
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
