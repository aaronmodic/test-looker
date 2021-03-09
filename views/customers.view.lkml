view: customers {
  sql_table_name: public.customers ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."customer_id" ;;
  }

  dimension: customer_unique_id {
    type: string
    sql: ${TABLE}."customer_unique_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_id, orders.count]
  }
}
