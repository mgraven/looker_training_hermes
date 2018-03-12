view: inventory_transactions {
  sql_table_name: northwind.inventory_transactions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: customer_order_id {
    type: number
    sql: ${TABLE}.customer_order_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: purchase_order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.purchase_order_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension_group: transaction_created {
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
    sql: ${TABLE}.transaction_created_date ;;
  }

  dimension_group: transaction_modified {
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
    sql: ${TABLE}.transaction_modified_date ;;
  }

  dimension: transaction_type {
    type: yesno
    sql: ${TABLE}.transaction_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.id, products.product_name, purchase_orders.id]
  }
}
