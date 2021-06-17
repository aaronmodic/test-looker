connection: "bytecode_postgres"

include: "/models/orders.view"
include: "/models/users.view"

# include all the views
explore: orders {
  view_label: "Orders"
  view_name: orders
  label: "Ecommerce Dataset"
}

explore: users {
  view_label: "Users"
  view_name: users
  label: "Ecommerce Dataset - Users"
}
