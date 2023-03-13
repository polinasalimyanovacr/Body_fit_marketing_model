view: sql_notusedcampaign {
  derived_table: {
    sql: SELECT s.contactId AS id,
      CASE WHEN ((((CAST(s.createdTimestamp AS DateTime)) > (CAST(t1.activityDate AS DateTime))) AND
      (s.quantityOrdered > 0) AND (t1.activity = 'OPENS')) OR (t1.activity != 'OPENS'))
      THEN false
      WHEN (t1.activity IS NULL) THEN NULL
      ELSE true END AS didNotBuy,
      t1.activity AS opened,
      FROM
      (SELECT
      broadcasts.broadcastId AS broadcastId,
      FROM `body-fit-test.clang.broadcasts` broadcasts) t
      INNER JOIN (SELECT activity, externalId, activityDate, broadcastId, FROM `body-fit-test.clang.activities` activities) t1 ON t1.broadcastId = t.broadcastId
      RIGHT JOIN (SELECT customer.contactId AS contactId, quantityOrdered, createdTimestamp, FROM `body-fit-test.orders.order_actual` order_actual, UNNEST (order_actual.orderLines) AS orderLines) s
      ON t1.externalId = s.contactId;;
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

  dimension: did_not_buy {
    case: {
      when: {
        sql: ${TABLE}.didNotBuy = True ;;
        label: "Yes"
      }
      when: {
        sql: ${TABLE}.didNotBuy = False ;;
        label: "No"
      }
      when: {
        sql: ${TABLE}.didNotBuy IS NULL ;;
        label: "Null"
      }
      }
    description: "Customer has received campaign email and opened it but didn’t buy anything yet"
  }

  set: detail {
    fields: [contact_id, did_not_buy]
  }
}
