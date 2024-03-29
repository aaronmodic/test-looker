include: "/models/base_parameters.view.lkml"
view: dt_view_switcher {
  extends: [base_parameters]
  sql_table_name:
  {% if tablename._parameter_value == 'orders' %}
  ${orders.SQL_TABLE_NAME}
  {% else %}
  ${orders.SQL_TABLE_NAME}
  {% endif %} ;;

  parameter: tablename {
    type: unquoted
    allowed_value: {
      label: "orders"
      value: "orders"
    }
    allowed_value: {
      label: "orders1"
      value: "orders1"
    }
    tags: ["Executive:tablenameDimension"]
    # add as many allowed_values as you have tables
  }

  dimension: customer_city {
    type: string
    sql: ${TABLE}.CUSTOMER_CITY ;;
    tags: ["Executive:submarket2Filter", "ActiveCohort:primaryFlowFilter", "TwoMonthRetention:sidebarFilter"]
  }

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.CUSTOMER_ID ;;
    tags: ["dimensions: ", "dimensions:Executive Subsection", "ActiveCohort:accountTypeFilter", "TwoMonthRetention:sidebarFilter"]
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}.CUSTOMER_STATE ;;
    tags: ["dimensions:Sender Dimension","filter:Sender Filter", "Executive:marketFilter", "ActiveCohort:locationFilter", "TwoMonthRetention:sidebarFilter"]
  }

  dimension: customer_zip_code_prefix {
    type: number
    sql: ${TABLE}.CUSTOMER_ZIP_CODE_PREFIX ;;
    tags: ["dimensions:Executive Subsection", "ActiveCohort:locationFilter"]
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
    tags: ["timeframes:Timeframe", "Executive:timeframeFilter", "ActiveCohort:activeMonthFilter"]
  }


  dimension: order_freight_value {
    type: number
    sql: ${TABLE}.ORDER_FREIGHT_VALUE ;;
  }

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ORDER_ID ;;
    tags: ["dimensions:Sender Dimension"]
    action: {
      label: "Send to BigQuery"
      url: "https://hooks.zapier.com/hooks/catch/10435599/b35dzls/"
      param: {
        name: "order_id"
        value: "{{value}}"
      }
    }
    action: {
      label: "Action Hub Test"
      url: "https://a65217tgmh.execute-api.us-west-2.amazonaws.com/dev"
      param: {
        name: "slug"
        value: "ST3ubtHKIgUqyVUJJchhQr"
      }
    }
    link: {
      label: "Dashboards"
      url: "https://bytecodeef.looker.com/dashboards-next/91"
    }
  }


  dimension: order_items_qty {
    type: number
    sql: ${TABLE}.ORDER_ITEMS_QTY ;;
  }

  dimension: order_products_value {
    type: number
    sql: ${TABLE}.ORDER_PRODUCTS_VALUE ;;
  }



  dimension: order_sellers_qty {
    type: number
    sql: ${TABLE}.ORDER_SELLERS_QTY ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.ORDER_STATUS ;;
    tags:["dimensions:Sender Dimension","filter:Sender Filter", "submarket1: ", "Executive:submarket1Filter", "ActiveCohort:locationFilter", "ActiveCohort:inputBarMetric", "TwoMonthRetention:sidebarFilter"]
  }
  dimension: order_status_delivered {
    type: yesno
    sql: ${order_status} = 'delivered' ;;
    tags:["dimensions:Sender Dimension","filter:Sender Filter", "submarket1: "]
  }
# use translated name in product_category_name_translation view
  dimension: product_category_name {
    type: string
    sql: ${TABLE}.PRODUCT_CATEGORY_NAME ;;
    hidden: yes
    tags: ["ActiveCohort:locationFilter"]
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


  dimension: review_answer_timestamp {
    type: string
    sql: ${TABLE}.review_answer_timestamp ;;
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
    tags: ["dimensions:Executive Subsection", "Executive:graphDimension", "ActiveCohort:consumerMerchantFilter"]
  }
  # parameter: dimension_selector {
  #   type: string
  #   allowed_value: {value:"order_id"}
  #   allowed_value: {value:"customer_id"}
  # }
  dimension: current_period_dimension{
    type: string
    label_from_parameter: dimension_selector
    sql: case
          when {% parameter dimension_selector %} = 'order_id' then ${order_id}
          when {% parameter dimension_selector %} = 'customer_id' then ${customer_id}
           when {% parameter dimension_selector %} = 'order_status' then ${order_status}
          else null
          end

          ;;
  }
### Measures ###

  measure: count_orders {
    type: count_distinct
    sql: ${order_id} ;;
    tags: ["measures:Executive Subsection", "Executive:topGraphMeasure"]
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
    tags: ["measures:measure", "measures:Executive Subsection", "Executive:topGraphMeasure", "Executive:bottomGraphMeasure"]
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

  measure: count_order_items_qty {
    type: sum
    sql: ${order_items_qty};;
    tags: ["measures:measure", "measures:Executive Subsection", "Executive:topGraphMeasure"]
  }

  measure: sum_order_products_value {
    type: sum
    sql: ${order_products_value};;
    tags: ["measures:measure", "measures:Executive Subsection", "Executive:bottomGraphMeasure"]
  }
  # parameter: measure_selector {
  #   type: unquoted
  #   allowed_value: {
  #     value: "sum_order_products_value"
  #   }
  #   allowed_value: {
  #     value: "count_customers"
  #   }
  # }

  measure: current_period_measure {
    type: number
    sql:
      {% if measure_selector._parameter_value == 'sum_order_products_value' %}
        ${sum_order_products_value}
      {% elsif measure_selector._parameter_value == 'count_customers' %}
        ${count_customers}
      {% else %}
        null
      {% endif %} ;;
  }
}
