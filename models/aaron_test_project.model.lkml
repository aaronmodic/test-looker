connection: "bytecode_postgres"

include: "/models/orders.view"
include: "/models/users.view"
include: "/models/p2p.view"
include: "/models/dt_test.view.lkml"
# include: "/_period_comparison.view.lkml"
# include all the views
explore: orders {
  view_label: "Orders"
  view_name: orders
  label: "Ecommerce Dataset"
  join: p2p {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.order_purchase_date} = ${p2p.full_date_date} ;;
  }
  join: dt_test {
    type: inner
    relationship: many_to_one
    sql_on:  ${orders.current_period_dimension} = ${dt_test.current_period_dimension} ;;
  }
}

explore: users {
  view_label: "Users"
  view_name: users
  label: "Ecommerce Dataset - Users"
}
