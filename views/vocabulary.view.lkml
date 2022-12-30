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
    html:
    {% if value == "dashboard" %}
    <p style="color: black; background-color: lightblue; font-size: 100%; text-align:center"> {{rendered_value}}</p>
    {% endif %};;
  }

  dimension: definition {
    type: string
    sql: ${TABLE}.Definition ;;
  }

  set: detail {
    fields: [term, definition]
  }
}
