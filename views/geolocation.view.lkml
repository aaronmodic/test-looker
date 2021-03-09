view: geolocation {
  sql_table_name: public.geolocation ;;

  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}."lat" ;;
  }

  dimension: lng {
    type: number
    sql: ${TABLE}."lng" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: zip_code_prefix {
    type: number
    sql: ${TABLE}."zip_code_prefix" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
