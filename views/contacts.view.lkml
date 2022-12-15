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
        age AS age,
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
      FROM `body-fit-test.contacts.contact_actual` t
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

  dimension: email_hash_code {
    type: string
    sql: ${TABLE}.emailHashCode ;;
  }

  dimension: email_consent {
    type: yesno
    sql: ${TABLE}.emailConsent ;;
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

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
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

  dimension: Button_1 {
    type:  string
   sql:  ${age} ;;
    drill_fields: [count]
    html: <a href="https://crystalloids.eu.looker.com/looks/73?f[sql_salesbuyer.sales_buyer]={{value}}&f[sql_inactive.inactive]={{sql_inactive.inactive._value}}"><button>Send the audience</button></a>

      ;;
      }

      #  html: <a href="https://crystalloids.eu.looker.com/looks/73?f[sql_salesbuyer.sales_buyer]={{value}}&f[orders.shipping_address_country_code]={{value}}&f[sql_inactive.inactive]={{value}}"><button>Send the audience</button></a>

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
