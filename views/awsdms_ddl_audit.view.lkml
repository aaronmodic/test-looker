view: awsdms_ddl_audit {
  sql_table_name: public.awsdms_ddl_audit ;;

  dimension: c_ddlqry {
    type: string
    sql: ${TABLE}."c_ddlqry" ;;
  }

  dimension: c_key {
    type: number
    sql: ${TABLE}."c_key" ;;
  }

  dimension: c_name {
    type: string
    sql: ${TABLE}."c_name" ;;
  }

  dimension: c_oid {
    type: number
    value_format_name: id
    sql: ${TABLE}."c_oid" ;;
  }

  dimension: c_schema {
    type: string
    sql: ${TABLE}."c_schema" ;;
  }

  dimension: c_tag {
    type: string
    sql: ${TABLE}."c_tag" ;;
  }

  dimension_group: c {
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
    sql: ${TABLE}."c_time" ;;
  }

  dimension: c_txn {
    type: string
    sql: ${TABLE}."c_txn" ;;
  }

  dimension: c_user {
    type: string
    sql: ${TABLE}."c_user" ;;
  }

  measure: count {
    type: count
    drill_fields: [c_name]
  }
}
