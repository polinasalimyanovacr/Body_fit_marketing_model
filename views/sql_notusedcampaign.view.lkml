view: sql_notusedcampaign {
  derived_table: {
    sql: SELECT s.contactId,
      min (CASE WHEN ((((CAST(s.createdTimestamp AS DateTime)) > (CAST(t2.activityDate AS DateTime))) AND
      (s.quantityOrdered > 0)) OR (IFNULL(t2.opened, false) = false))
      THEN false ELSE true END) AS didNotBuy,
      max(IFNULL(t2.opened, false)) AS opened,
      FROM
      (SELECT
      t1.activityDate AS activityDate,
      t1.externalId AS id,
      ((t1.activity = 'OPENS') AND (IFNULL((t1.broadcastId = t.broadcastId), false)))AS opened,
      FROM
      (SELECT
      broadcasts.broadcastId AS broadcastId,
      FROM `body-fit-test.clang.broadcasts` broadcasts) t
      RIGHT JOIN (SELECT activity, externalId, activityDate, broadcastId, FROM `body-fit-test.clang.activities` activities) t1 ON t1.broadcastId = t.broadcastId) t2
      RIGHT JOIN (SELECT customer.contactId AS contactId, quantityOrdered, createdTimestamp, FROM `body-fit-test.orders.order_actual` order_actual, UNNEST (order_actual.orderLines) AS orderLines) s
      ON t2.id = s.contactId
      GROUP BY s.contactId;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.externalId ;;
  }

  dimension: did_not_buy {
    type: yesno
    sql: ${TABLE}.didNotBuy ;;
    description: "Customer has received campaign email and opened it but didn’t buy anything yet"
  }

  set: detail {
    fields: [external_id, did_not_buy]
  }
}
