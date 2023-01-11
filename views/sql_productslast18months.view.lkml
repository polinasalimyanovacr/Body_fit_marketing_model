view: sql_productslast18months {
  derived_table: {
    sql: SELECT t1.contactId AS id,
      t1.productLast18Months,
      productType,
      reportingCategory,
      reportingProductType,
      sku
          FROM
            (
            SELECT customer.contactId AS contactId,
            product.sku AS sku,
            (((CAST(createdTimestamp AS DateTime)) BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -18 MONTH) AND CURRENT_DATE()) AND (quantityOrdered > 0)) AS productLast18Months,
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
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
    description: "SKU is unique identifier of the product"
  }

  dimension: product_last18_months {
    type: yesno
    sql: ${TABLE}.productLast18Months ;;
    description: "Customers that purchased a specific type of product at least once in the last 18 months."
    html:
    {% if value == "Yes" %}
    <p><img src="https://drive.google.com/uc?id=1N6m__CVFw4PXK05QADJ9gHFH8wSPplAh" width="20" height="20"/> {{rendered_value}} </p>
    {% endif %};;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.productType ;;
    description: "Possible values: Accessory, book, clothing etc"
  }

  dimension: reporting_category {
    type: string
    sql: ${TABLE}.reportingCategory ;;
    description: "Possible values: Beauty, clothing, Acrtive food etc"
  }

  dimension: reporting_product_type {
    type: string
    sql: ${TABLE}.reportingProductType ;;
    description: "Possible values: Bag, backery, bath&shower etc"
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
