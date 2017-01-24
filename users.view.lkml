view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

measure: Average_age  {
  type: average
  sql: ${age} ;;
  value_format_name: decimal_1
}

dimension: age_tiered {
  type: tier
  tiers: [20,40,60,80]
  sql: ${age} ;;
  style: interval
}

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

dimension_group: created {
  type: time
  timeframes: [time, hour, date, week, month, year, time_of_day, hour_of_day, day_of_week]
  sql: ${TABLE}.created_at ;;
}

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: full_name {
    type: string          #Indicates that this is a sequence of characters. The default data type.
    sql: ${TABLE}.first_name || ' ' || ${TABLE}.last_name;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: number
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
