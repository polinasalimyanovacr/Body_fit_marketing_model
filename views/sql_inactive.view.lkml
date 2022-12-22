view: sql_inactive {
  derived_table: {
    sql: SELECT t1.contactId AS id,
          IFNULL((CASE WHEN (t1.inactive AND s.opts.value = true) THEN true ELSE false END), false)  AS inActive,
          IFNULL(s.opts.value, false) AS optIn,
                FROM
                  (
                  SELECT customer.contactId AS contactId,
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
                  LEFT JOIN (SELECT opts, contactId, FROM `body-fit-test.contacts.contact_actual` contact_actual, UNNEST (contact_actual.opts) AS opts) s
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

  dimension: inactive {
    type: yesno
    primary_key: yes
    sql: ${TABLE}.inactive ;;
    description: "Customers that purchased in the past 24 months but did not place any order in last 6 months
AND gave consent (are contactable by email and gave cookie consent for the session where the purchase was made) "
  }

  set: detail {
    fields: [contact_id, inactive]
  }
}
