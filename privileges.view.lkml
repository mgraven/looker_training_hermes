view: privileges {
  sql_table_name: northwind.privileges ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: privilege_name {
    type: string
    sql: ${TABLE}.privilege_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, privilege_name, employee_privileges.count]
  }
}
