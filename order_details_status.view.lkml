view: order_details_status {
  sql_table_name: northwind.order_details_status ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: status_name {
    type: string
    sql: ${TABLE}.status_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, status_name]
  }
}
