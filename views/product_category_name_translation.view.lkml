view: product_category_name_translation {
  sql_table_name: public.product_category_name_translation ;;

  dimension: product_category_name {
    type: string
    sql: ${TABLE}."product_category_name" ;;
  }

  dimension: product_category_name_english {
    type: string
    sql: ${TABLE}."product_category_name_english" ;;
  }

  measure: count {
    type: count
    drill_fields: [product_category_name]
  }
}
