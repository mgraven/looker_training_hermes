view: orders_tax_status {
  sql_table_name: northwind.orders_tax_status ;;

  dimension: id {
    primary_key: yes
    type: yesno
    sql: ${TABLE}.id ;;
  }

  dimension: tax_status_name {
    type: string
    sql: ${TABLE}.tax_status_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, tax_status_name]
  }
}
