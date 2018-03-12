view: inventory_transaction_types {
  sql_table_name: northwind.inventory_transaction_types ;;

  dimension: id {
    primary_key: yes
    type: yesno
    sql: ${TABLE}.id ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}.type_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, type_name]
  }
}
