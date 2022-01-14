view: users {
  sql_table_name: PUBLIC.ORDERS ;;

  dimension: customer_city {
    type: string
    sql: ${TABLE}.CUSTOMER_CITY ;;
    tags: ["subMarket2: ","market: "]
  }

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.CUSTOMER_ID ;;
    tags: ["dimensions:Sender Dimension"]
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}.CUSTOMER_STATE ;;
    tags: ["subMarket2: "]
  }

  dimension: customer_zip_code_prefix {
    type: number
    sql: ${TABLE}.CUSTOMER_ZIP_CODE_PREFIX ;;
  }

  dimension_group: order_purchase {
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
    sql: ${TABLE}.ORDER_PURCHASE_TIMESTAMP ;;
    tags: ["timeframe: "]
  }





  dimension: order_freight_value {
    type: number
    sql: ${TABLE}.ORDER_FREIGHT_VALUE ;;
  }

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ORDER_ID ;;
    tags: ["dimensions:Sender Dimension","subMarket1: "]
  }

  dimension: order_items_qty {
    type: number
    sql: ${TABLE}.ORDER_ITEMS_QTY ;;
  }

  dimension: order_products_value {
    type: number
    sql: ${TABLE}.ORDER_PRODUCTS_VALUE ;;
    tags: ["comparisonPoint: "]
  }



  dimension: order_sellers_qty {
    type: number
    sql: ${TABLE}.ORDER_SELLERS_QTY ;;
    tags: ["comparisonPoint: "]
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.ORDER_STATUS ;;
    tags: ["comparisonPoint: "]
  }

# use translated name in product_category_name_translation view
  dimension: product_category_name {
    type: string
    sql: ${TABLE}.PRODUCT_CATEGORY_NAME ;;
    hidden: yes
  }

  dimension: product_description_length {
    type: number
    sql: ${TABLE}.PRODUCT_DESCRIPTION_LENGHT ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.PRODUCT_ID ;;
  }

  dimension: product_name_lenght {
    type: number
    sql: ${TABLE}.PRODUCT_NAME_LENGHT ;;
  }

  dimension: product_photos_qty {
    type: number
    sql: ${TABLE}.PRODUCT_PHOTOS_QTY ;;
  }



  dimension: review_comment_message {
    type: string
    sql: ${TABLE}.REVIEW_COMMENT_MESSAGE ;;
  }

  dimension: review_comment_title {
    type: string
    sql: ${TABLE}.REVIEW_COMMENT_TITLE ;;
  }



  dimension: review_id {
    type: string
    sql: ${TABLE}.REVIEW_ID ;;
  }

  dimension: review_score {
    type: number
    sql: ${TABLE}.REVIEW_SCORE ;;
  }

### Measures ###

  measure: count_orders {
    type: count_distinct
    sql: ${order_id} ;;
    link: {
      label: "Link 1"
      url: "/dashboards-next/306"
    }
    link: {
      label: "Link 2"
      url: "/dashboards-next/112"
    }
  }

  measure: count_customers {
    type: count_distinct
    sql: ${customer_id} ;;
  }

  dimension_group: auditdate {
    type: time
    timeframes: [
      raw,
      date
    ]
    sql: ${TABLE}.auditdate ;;
    tags: ["timeframes:Timeframe"]
  }
}
