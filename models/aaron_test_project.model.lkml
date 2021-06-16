connection: "bytecode_postgres"

include: "/models/orders.view"

# include all the views
explore: orders {
  view_label: "Orders"
  view_name: orders
  label: "Ecommerce Dataset"
}
