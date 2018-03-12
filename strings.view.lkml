view: strings {
  sql_table_name: northwind.strings ;;

  dimension: string_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.string_id ;;
  }

  dimension: string_data {
    type: string
    sql: ${TABLE}.string_data ;;
  }

  measure: count {
    type: count
    drill_fields: [string_id]
  }
}
