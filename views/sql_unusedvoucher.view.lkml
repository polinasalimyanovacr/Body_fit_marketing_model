view: sql_unusedvoucher {
  derived_table: {
    sql: SELECT referral_actual.refereeContactID AS contactId,
      referral_actual.voucherCode NOT IN (
      SELECT order_actual.voucherCode
      FROM `body-fit-test.referrals.referral_order_actual` order_actual) AS unused,
      referral_actual.voucherCode AS voucherCode,
      FROM `body-fit-test.referrals.referral_contact_actual` referral_actual
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

  dimension: unused {
    type: yesno
    sql: ${TABLE}.unused ;;
  }

  dimension: voucher_code {
    type: string
    sql: ${TABLE}.voucherCode ;;
  }

  set: detail {
    fields: [contact_id, unused, voucher_code]
  }
}
