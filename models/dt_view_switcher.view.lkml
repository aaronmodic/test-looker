view: dt_view_switcher {
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
    # add as many allowed_values as you have tables
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
  measure: count_order_items_qty {
    type: sum
    sql: ${order_items_qty};;
  }
}
