view: base_parameters {

  extension: required
  parameter: dimension_selector {
    type: string
    allowed_value: {value:"order_id"}
    allowed_value: {value:"customer_id"}
  }
  parameter: measure_selector {
    type: unquoted
    allowed_value: {
      value: "sum_order_products_value"
    }
    allowed_value: {
      value: "count_customers"
    }
    }
}
