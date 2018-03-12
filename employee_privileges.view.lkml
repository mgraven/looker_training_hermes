view: employee_privileges {
  sql_table_name: northwind.employee_privileges ;;

  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.employee_id ;;
  }

  dimension: privilege_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.privilege_id ;;
  }

  measure: count {
    type: count
    drill_fields: [employees.id, employees.last_name, employees.first_name, privileges.id, privileges.privilege_name]
  }
}
