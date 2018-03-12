view: sales_reports {
  sql_table_name: northwind.sales_reports ;;

  dimension: default {
    type: yesno
    sql: ${TABLE}.`default` ;;
  }

  dimension: display {
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: filter_row_source {
    type: string
    sql: ${TABLE}.filter_row_source ;;
  }

  dimension: group_by {
    type: string
    sql: ${TABLE}.group_by ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
