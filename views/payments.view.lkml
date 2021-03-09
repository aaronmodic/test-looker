view: payments {
  sql_table_name: public.payments ;;

  dimension: installments {
    type: number
    sql: ${TABLE}."installments" ;;
  }

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."order_id" ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}."payment_type" ;;
  }

  dimension: payment_value {
    type: number
    sql: ${TABLE}."payment_value" ;;
  }

  dimension: sequential {
    type: number
    sql: ${TABLE}."sequential" ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.order_id, orders.product_category_name]
  }
}
