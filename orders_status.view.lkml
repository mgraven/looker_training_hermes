view: orders_status {
  sql_table_name: northwind.orders_status ;;

  dimension: id {
    primary_key: yes
    type: yesno
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
