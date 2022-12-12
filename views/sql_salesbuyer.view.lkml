view: sql_salesbuyer {
  derived_table: {
    sql: SELECT t1.contactId, t1.discountQuantityPercentage, t1.SalesBuyer, t1.quantityOrdered,
      FROM
      (
      SELECT customer.contactId AS contactId,
      SUM (quantityOrdered) AS quantityOrdered,
      SUM (CASE WHEN discountAmount > 0 THEN 1 END) AS discountQuantity,
      (SUM (CASE WHEN discountAmount > 0 THEN 1 END)/SUM (quantityOrdered)) AS discountQuantityPercentage,
      IFNULL(((SUM (CASE WHEN discountAmount > 0 THEN 1 END)/SUM (quantityOrdered))>=0.75), false) AS SalesBuyer,
      FROM `body-fit-test.orders.order_actual` order_actual,
      UNNEST (order_actual.orderLines) AS orderLines WHERE (quantityOrdered > 0) AND ((CAST(createdTimestamp AS DateTime))
      BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -18 MONTH) AND CURRENT_DATE())
      GROUP BY customer.contactId) t1
      INNER JOIN `body-fit-test.contacts.contact_actual` contact_actual ON t1.contactId = contact_actual.contactId,
      UNNEST (contact_actual.opts) AS opts WHERE value = true
      ORDER BY quantityOrdered DESC
       ;;
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

  dimension: opt_in {
    type: yesno
    sql: ${TABLE}.optIn ;;
  }

  set: detail {
    fields: [
      contact_id,
      quantity_ordered,
      discount_quantity,
      discount_quantity_percentage,
      sales_buyer,
      opt_in
    ]
  }
}
