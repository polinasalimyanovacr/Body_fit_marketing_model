view: sql_productslast18months {
  derived_table: {
    sql: SELECT t1.contactId,
      t1.productLast18Months,
      productType,
      reportingCategory,
      reportingProductType,
          FROM
            (
            SELECT customer.contactId AS contactId,
            product.sku AS sku,
            ((CAST(createdTimestamp AS DateTime)) BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -18 MONTH) AND CURRENT_DATE()) AS productLast18Months,
            FROM `body-fit-test.orders.order_actual` order_actual,
            UNNEST (order_actual.orderLines) AS orderLines
            ) t1
            INNER JOIN `body-fit-test.products.product_actual` product_actual ON t1.sku IN UNNEST(product_actual.items.sku)
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

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: product_last18_months {
    type: yesno
    sql: ${TABLE}.productLast18Months ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.productType ;;
  }

  dimension: reporting_category {
    type: string
    sql: ${TABLE}.reportingCategory ;;
  }

  dimension: reporting_product_type {
    type: string
    sql: ${TABLE}.reportingProductType ;;
  }

  set: detail {
    fields: [
      contact_id,
      sku,
      product_last18_months,
      product_type,
      reporting_category,
      reporting_product_type
    ]
  }
}
