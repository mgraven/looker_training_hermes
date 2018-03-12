view: orders {
  sql_table_name: northwind.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.employee_id ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension_group: order {
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
    sql: ${TABLE}.order_date ;;
  }

  dimension_group: paid {
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
    sql: ${TABLE}.paid_date ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: ship_address {
    type: string
    sql: ${TABLE}.ship_address ;;
  }

  dimension: ship_city {
    type: string
    sql: ${TABLE}.ship_city ;;
  }

  dimension: ship_country_region {
    type: string
    sql: ${TABLE}.ship_country_region ;;
  }

  dimension: ship_name {
    type: string
    sql: ${TABLE}.ship_name ;;
  }

  dimension: ship_state_province {
    type: string
    sql: ${TABLE}.ship_state_province ;;
  }

  dimension: ship_zip_postal_code {
    type: string
    sql: ${TABLE}.ship_zip_postal_code ;;
  }

  dimension_group: shipped {
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
    sql: ${TABLE}.shipped_date ;;
  }

  dimension: shipper_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shipper_id ;;
  }

  dimension: shipping_fee {
    type: number
    sql: ${TABLE}.shipping_fee ;;
  }

  dimension: status_id {
    type: yesno
    sql: ${TABLE}.status_id ;;
  }

  dimension: tax_rate {
    type: number
    sql: ${TABLE}.tax_rate ;;
  }

  dimension: tax_status_id {
    type: yesno
    sql: ${TABLE}.tax_status_id ;;
  }

  dimension: taxes {
    type: number
    sql: ${TABLE}.taxes ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      ship_name,
      employees.id,
      employees.last_name,
      employees.first_name,
      customers.id,
      customers.last_name,
      customers.first_name,
      shippers.id,
      shippers.last_name,
      shippers.first_name,
      invoices.count,
      order_details.count
    ]
  }
}
