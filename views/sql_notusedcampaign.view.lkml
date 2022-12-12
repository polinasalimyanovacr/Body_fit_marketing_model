view: sql_notusedcampaign {
  derived_table: {
    sql: SELECT
      t1.externalId,
      CASE WHEN ((((CAST(createdTimestamp AS DateTime)) > (CAST(activityDate AS DateTime))) AND (quantityOrdered > 0))) THEN false ELSE true END AS didNotBuy,
      FROM
      (SELECT
      activityDate,
      activities.externalId,
      FROM `body-fit-test.clang.broadcasts` broadcasts
      INNER JOIN `body-fit-test.clang.activities` activities ON broadcasts.broadcastId = activities.broadcastId
      WHERE activity = 'OPENS') t1
      INNER JOIN `body-fit-test.orders.order_actual` order_actual ON t1.externalId = order_actual.customer.contactId,
      UNNEST (order_actual.orderLines) AS orderLines
       ;;
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
  }

  set: detail {
    fields: [external_id, did_not_buy]
  }
}
