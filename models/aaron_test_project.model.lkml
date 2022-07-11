connection: "bytecode_postgres"

include: "/models/orders.view"
include: "/models/users.view"
include: "/models/p2p.view"
include: "/models/dt_test.view.lkml"
include: "/models/dt_view_switcher.view.lkml"
include: "/models/test.dashboard.lookml"
# include: "/_period_comparison.view.lkml"
# include all the views
explore: orders {
  view_label: "Orders"
  view_name: dt_view_switcher
  label: "Ecommerce Dataset"
  join: p2p {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dt_view_switcher.order_purchase_date} = ${p2p.full_date_date} ;;
  }
  join: dt_test {
    type: inner
    relationship: many_to_one
    sql_on:  ${dt_view_switcher.current_period_dimension} = ${dt_test.current_period_dimension} ;;
  }
}

explore: users {
  view_label: "Users"
  view_name: users
  label: "Ecommerce Dataset - Users"
}
