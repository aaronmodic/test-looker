connection: "bytecode_postgres"

# include all the views
include: "/views/**/*.view"

datagroup: aaron_test_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aaron_test_project_default_datagroup

explore: awsdms_ddl_audit {}

explore: customers {}

explore: geolocation {}

explore: orders {
  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: payments {
  join: orders {
    type: left_outer
    sql_on: ${payments.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: product_category_name_translation {}

explore: test_payments {
  join: orders {
    type: left_outer
    sql_on: ${test_payments.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}
