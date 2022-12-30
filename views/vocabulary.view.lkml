view: vocabulary {
  derived_table: {
    sql: SELECT * FROM `body-fit-test.tmp.vocabulary`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: term {
    type: string
    sql: ${TABLE}.Term ;;
  }

  dimension: definition {
    type: string
    sql: ${TABLE}.Definition ;;
  }

  set: detail {
    fields: [term, definition]
  }
}
