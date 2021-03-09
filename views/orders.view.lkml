view: orders {
  sql_table_name: public.orders ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."order_id" ;;
  }

  dimension: customer_city {
    type: string
    sql: ${TABLE}."customer_city" ;;
  }

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."customer_id" ;;
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}."customer_state" ;;
  }

  dimension: customer_zip_code_prefix {
    type: number
    sql: ${TABLE}."customer_zip_code_prefix" ;;
  }

  dimension_group: order_aproved {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."order_aproved_at" ;;
  }

  dimension_group: order_delivered_customer {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."order_delivered_customer_date" ;;
  }

  dimension_group: order_estimated_delivery {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."order_estimated_delivery_date" ;;
  }

  dimension: order_freight_value {
    type: number
    sql: ${TABLE}."order_freight_value" ;;
  }

  dimension: order_items_qty {
    type: number
    sql: ${TABLE}."order_items_qty" ;;
  }

  dimension: order_products_value {
    type: number
    sql: ${TABLE}."order_products_value" ;;
  }

  dimension_group: order_purchase_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."order_purchase_timestamp" ;;
  }

  dimension: order_sellers_qty {
    type: number
    sql: ${TABLE}."order_sellers_qty" ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}."order_status" ;;
  }

  dimension: product_category_name {
    type: string
    sql: ${TABLE}."product_category_name" ;;
  }

  dimension: product_description_lenght {
    type: number
    sql: ${TABLE}."product_description_lenght" ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}."product_id" ;;
  }

  dimension: product_name_lenght {
    type: number
    sql: ${TABLE}."product_name_lenght" ;;
  }

  dimension: product_photos_qty {
    type: number
    sql: ${TABLE}."product_photos_qty" ;;
  }

  dimension_group: review_answer_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."review_answer_timestamp" ;;
  }

  dimension: review_comment_message {
    type: string
    sql: ${TABLE}."review_comment_message" ;;
  }

  dimension: review_comment_title {
    type: string
    sql: ${TABLE}."review_comment_title" ;;
  }

  dimension_group: review_creation {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."review_creation_date" ;;
  }

  dimension: review_id {
    type: string
    sql: ${TABLE}."review_id" ;;
  }

  dimension: review_score {
    type: number
    sql: ${TABLE}."review_score" ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id, product_category_name, customers.customer_id, payments.count, test_payments.count]
  }
}
