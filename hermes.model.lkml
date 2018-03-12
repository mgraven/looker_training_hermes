connection: "northwind_mysql"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: hermes_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hermes_default_datagroup

explore: customers {}

explore: employee_privileges {
  join: employees {
    type: left_outer
    sql_on: ${employee_privileges.employee_id} = ${employees.id} ;;
    relationship: many_to_one
  }

  join: privileges {
    type: left_outer
    sql_on: ${employee_privileges.privilege_id} = ${privileges.id} ;;
    relationship: many_to_one
  }
}

explore: employees {}

explore: inventory_transaction_types {}

explore: inventory_transactions {
  join: products {
    type: left_outer
    sql_on: ${inventory_transactions.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: purchase_orders {
    type: left_outer
    sql_on: ${inventory_transactions.purchase_order_id} = ${purchase_orders.id} ;;
    relationship: many_to_one
  }

  join: suppliers {
    type: left_outer
    sql_on: ${products.supplier_ids} = ${suppliers.id} ;;
    relationship: many_to_one
  }
}

explore: invoices {
  join: orders {
    type: left_outer
    sql_on: ${invoices.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: employees {
    type: left_outer
    sql_on: ${orders.employee_id} = ${employees.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: shippers {
    type: left_outer
    sql_on: ${orders.shipper_id} = ${shippers.id} ;;
    relationship: many_to_one
  }
}

explore: order_details {
  join: orders {
    type: left_outer
    sql_on: ${order_details.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${order_details.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: purchase_orders {
    type: left_outer
    sql_on: ${order_details.purchase_order_id} = ${purchase_orders.id} ;;
    relationship: many_to_one
  }

  join: employees {
    type: left_outer
    sql_on: ${orders.employee_id} = ${employees.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: shippers {
    type: left_outer
    sql_on: ${orders.shipper_id} = ${shippers.id} ;;
    relationship: many_to_one
  }

  join: suppliers {
    type: left_outer
    sql_on: ${products.supplier_ids} = ${suppliers.id} ;;
    relationship: many_to_one
  }
}

explore: order_details_status {}

explore: orders {
  join: employees {
    type: left_outer
    sql_on: ${orders.employee_id} = ${employees.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: shippers {
    type: left_outer
    sql_on: ${orders.shipper_id} = ${shippers.id} ;;
    relationship: many_to_one
  }
}

explore: orders_status {}

explore: orders_tax_status {}

explore: privileges {}

explore: products {
  join: suppliers {
    type: left_outer
    sql_on: ${products.supplier_ids} = ${suppliers.id} ;;
    relationship: many_to_one
  }
}

explore: purchase_order_details {
  join: purchase_orders {
    type: left_outer
    sql_on: ${purchase_order_details.purchase_order_id} = ${purchase_orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${purchase_order_details.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: suppliers {
    type: left_outer
    sql_on: ${purchase_orders.supplier_id} = ${suppliers.id} ;;
    relationship: many_to_one
  }
}

explore: purchase_order_status {}

explore: purchase_orders {
  join: suppliers {
    type: left_outer
    sql_on: ${purchase_orders.supplier_id} = ${suppliers.id} ;;
    relationship: many_to_one
  }
}

explore: sales_reports {}

explore: shippers {}

explore: strings {}

explore: suppliers {}
