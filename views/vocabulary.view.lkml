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
    {% if value == "Dashboard" %}
    <p style="color: black; background-color: lightblue; font-size: 100%; text-align:left"> {{rendered_value}}</p>
    {% elsif value == "Look" %}
    <p style="color: black; background-color: lightblue; font-size: 100%; text-align:left"> {{rendered_value}}</p>
    {% elsif value == "LookML" %}
    <p style="color: black; background-color: lightblue; font-size: 100%; text-align:left"> {{rendered_value}}</p>
    {% elsif value == "Liquid parameter" %}
    <p style="color: black; background-color: lightblue; font-size: 100%; text-align:left"> {{rendered_value}}</p>
    {% elsif value == "Looker expression" %}
    <p style="color: black; background-color: lightblue; font-size: 100%; text-align:left"> {{rendered_value}}</p>
   {% else %}
    <div style="text-align:left;">{{ rendered_value }}</div>
    {% endif %}
   ;;
    link: {
      label: "Google"
      url: "https://google.com/search?q={{value}}"
      icon_url: "https://google.com/favicon.ico"
    }
  }


  dimension: definition {
    type: string
    sql: ${TABLE}.Definition ;;
  }

  set: detail {
    fields: [term, definition]
  }
}
