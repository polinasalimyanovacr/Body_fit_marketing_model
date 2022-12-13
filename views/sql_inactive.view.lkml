view: sql_inactive {
  derived_table: {
    sql: SELECT t1.contactId,
          CASE WHEN (t1.inactive AND value = true) THEN true ELSE false END AS inActive,
          IFNULL(value, false) AS optIn,
                FROM
                  (
                  SELECT customer.contactId AS contactId,
                  SUM(quantityOrdered) AS quantityOrdered,
                  CASE WHEN (max(CASE WHEN ((CAST(createdTimestamp AS DateTime)) BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -24 MONTH)
                                      AND (CURRENT_DATE() - INTERVAL 6 MONTH) AND (quantityOrdered > 0))
                                THEN true ELSE false END)
                        AND min(CASE WHEN ((CAST(createdTimestamp AS DateTime)) BETWEEN DATE_ADD(CURRENT_DATE(), INTERVAL -6 MONTH)
                                      AND CURRENT_DATE() AND (quantityOrdered > 0))
                                THEN false ELSE true END))
                  THEN true ELSE false END AS inactive,
                  FROM `body-fit-test.orders.order_actual` order_actual,
                  UNNEST (order_actual.orderLines) AS orderLines
                  GROUP BY contactId
                  ) t1
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

  dimension: inactive {
    type: yesno
    sql: ${TABLE}.inactive ;;
  }

  set: detail {
    fields: [contact_id, inactive]
  }
}
