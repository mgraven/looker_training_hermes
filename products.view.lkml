view: products {
  sql_table_name: northwind.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: attachments {
    type: string
    sql: ${TABLE}.attachments ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discontinued {
    type: yesno
    sql: ${TABLE}.discontinued ;;
  }

  dimension: list_price {
    type: number
    sql: ${TABLE}.list_price ;;
  }

  dimension: minimum_reorder_quantity {
    type: number
    sql: ${TABLE}.minimum_reorder_quantity ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: quantity_per_unit {
    type: string
    sql: ${TABLE}.quantity_per_unit ;;
  }

  dimension: reorder_level {
    type: number
    sql: ${TABLE}.reorder_level ;;
  }

  dimension: standard_cost {
    type: number
    sql: ${TABLE}.standard_cost ;;
  }

  dimension: supplier_ids {
    type: string
    # hidden: yes
    sql: ${TABLE}.supplier_ids ;;
  }

  dimension: target_level {
    type: number
    sql: ${TABLE}.target_level ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      product_name,
      suppliers.id,
      suppliers.last_name,
      suppliers.first_name,
      inventory_transactions.count,
      order_details.count,
      purchase_order_details.count
    ]
  }
}
