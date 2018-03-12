view: purchase_order_details {
  sql_table_name: northwind.purchase_order_details ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: date_received {
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
    sql: ${TABLE}.date_received ;;
  }

  dimension: inventory_id {
    type: number
    sql: ${TABLE}.inventory_id ;;
  }

  dimension: posted_to_inventory {
    type: yesno
    sql: ${TABLE}.posted_to_inventory ;;
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

  dimension: unit_cost {
    type: number
    sql: ${TABLE}.unit_cost ;;
  }

  measure: count {
    type: count
    drill_fields: [id, purchase_orders.id, products.id, products.product_name]
  }
}
