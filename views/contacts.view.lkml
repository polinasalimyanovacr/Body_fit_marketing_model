view: contacts {
  derived_table: {
    sql: SELECT
        distinct contactId,
        emailHashCode,
        (SELECT value FROM t.opts WHERE name = 'generalConditions' ORDER BY confirmedTimestamp DESC LIMIT 1) as emailConsent,
        firstName,
        surnamePrefix,
        surname,
        username,
        gender,
        age,
        yearOfBirth,
        profileAddress.street AS street,
        profileAddress.houseNumber AS houseNumber,
        profileAddress.houseNumberSuffix AS houseNumberSuffix,
        profileAddress.city AS city,
        profileAddress.county AS county,
        profileAddress.postalCode AS postalCode,
        profileAddress.countryCode AS countryCode,
        preferredLocale,
        COALESCE(phoneMobile, phoneHome, phoneBusiness, null) AS phone
      FROM `body-fit-dev.contacts.contact_actual` t

      ;;
  }

  measure: count {
    type: count
    drill_fields: [count_drill*]
  }

#set the fields for drilling
  set: count_drill {
    fields: [contacts.first_name,
      surname,
      orders.count_orders,
      orders.total_revenue,
      orders.min_pruchase_date,
      phone
    ]
  }

#URL to take value and send email
  dimension: username {
    type:  string
    sql: ${TABLE}.username ;;
    link: {
      label: "Send email to the customer"
      url: "mailto: {{value}}"
    }
  }

  dimension: contact_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.contactId ;;

  }

  dimension: email_hash_code {
    type: string
    sql: ${TABLE}.emailHashCode ;;
  }

  dimension: email_consent {
    type: yesno
    sql: ${TABLE}.emailConsent ;;
    allow_fill:yes
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.firstName ;;
  }

  dimension: surname_prefix {
    type: string
    sql: ${TABLE}.surnamePrefix ;;
  }

  dimension: surname {
    type: string
    sql: ${TABLE}.surname ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: year_of_birth {
    type: number
    sql: ${TABLE}.yearOfBirth ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: house_number {
    type: string
    sql: ${TABLE}.houseNumber ;;
  }

  dimension: house_number_suffix {
    type: string
    sql: ${TABLE}.houseNumberSuffix ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postalCode ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.countryCode ;;
  }

  dimension: preferred_locale {
    type: string
    sql: ${TABLE}.preferredLocale ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

#Parameter
  parameter: select_category_parameter {
    type: unquoted
    default_value: ""
    allowed_value: {
      value: "gender"
      label: "Gender"
    }
    allowed_value: {
      value: "age"
      label: "Age"
    }
    allowed_value: {
      value: "yearOfBirth"
      label: "yearOfBirth"
    }
  }

  dimension: dynamic_parameter_category {
    label_from_parameter: select_category_parameter
    type: string
    sql:
    {% if select_category_parameter._parameter_value == 'gender' %}
    ${gender}
    {% elsif select_category_parameter._parameter_value == 'age' %}
    ${age}
    {% elsif select_category_parameter._parameter_value == 'yearOfBirth' %}
    ${year_of_birth}
    {% else %}
    "Error"
    {% endif %} ;;
  }

#dynamic dimension using templated filters - New dimention "Category" that counts selected value and OTHERS
  filter: select_category_dinamic_filter {
    type: string
    suggest_explore: contacts
    suggest_dimension: gender
  }

  dimension: category {
    type: string
    sql:
      CASE
      WHEN {% condition select_category_dinamic_filter %}
        ${gender}
        {% endcondition %}
      THEN ${gender}
      ELSE 'All Other Categories'
      END
      ;;
  }

  set: detail {
    fields: [
      contact_id,
      email_hash_code,
      email_consent,
      first_name,
      surname_prefix,
      surname,
      username,
      gender,
      age,
      year_of_birth,
      street,
      house_number,
      house_number_suffix,
      city,
      county,
      postal_code,
      country_code,
      preferred_locale,
      phone
    ]
  }
}
