view: sql_salesbuyers {
  derived_table: {
    sql: SELECT
          order_actual.customer.contactId  AS order_actual_customer__contact_id,
          order_actual.customer.emailAddress  AS order_actual_customer__email_address,
          discountAmount  AS order_actual__order_lines_discount_amount,
          quantityOrdered  AS order_actual__order_lines_quantity_ordered,
              (DATE(order_actual.createdTimestamp )) AS order_actual_created_timestamp_date
      FROM `body-fit-test.orders.order_actual`
           AS order_actual
      LEFT JOIN UNNEST(order_actual.orderLines) as order_actual__order_lines
      WHERE ((( order_actual.createdTimestamp  ) >= (TIMESTAMP('2021-05-21 00:00:00')) AND ( order_actual.createdTimestamp  ) < (TIMESTAMP('2022-11-21 00:00:00')))) AND (discountAmount ) > 0
      GROUP BY
          1,
          2,
          3,
          4,
          5
      ORDER BY
          3
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_actual_customer__contact_id {
    type: string
    sql: ${TABLE}.order_actual_customer__contact_id ;;
  }

  dimension: order_actual_customer__email_address {
    type: string
    sql: ${TABLE}.order_actual_customer__email_address ;;
  }

  dimension: order_actual__order_lines_discount_amount {
    type: number
    sql: ${TABLE}.order_actual__order_lines_discount_amount ;;
  }

  dimension: order_actual__order_lines_quantity_ordered {
    type: number
    sql: ${TABLE}.order_actual__order_lines_quantity_ordered ;;
  }

  dimension: order_actual_created_timestamp_date {
    type: date
    datatype: date
    sql: ${TABLE}.order_actual_created_timestamp_date ;;
  }

  set: detail {
    fields: [order_actual_customer__contact_id, order_actual_customer__email_address, order_actual__order_lines_discount_amount, order_actual__order_lines_quantity_ordered, order_actual_created_timestamp_date]
  }
}
