include: "/models/base_parameters.view.lkml"

view: dt_test {
  extends: [base_parameters]
    derived_table: {
      explore_source: orders {
        column: current_period_dimension {}
        column: current_period_measure {}
        derived_column: rank {
          sql: rank() over (order by current_period_measure desc);;
        }
        # filters: {
        #   field: orders.dimension_selector
        #   value: "customer^_id"
        # }
        # filters: {
        #   field: orders.measure_selector
        #   value: "sum^_order^_products^_value"
        # }
        filters: {
          field: p2p.current_period_filter
          value: "2018/01/01 to 2018/12/31"
        }
        filters: {
          field: p2p.pop_comparison
          value: "Previous Year"
        }

        bind_filters: {
          from_field: dt_test.dimension_selector
          to_field: orders.dimension_selector
        }
        bind_filters: {
          from_field: dt_test.measure_selector
          to_field: orders.measure_selector
        }
      }
    }
    dimension: current_period_dimension {
      primary_key: yes
    }
    dimension: current_period_measure {
      type: number
      hidden: no
    }
    dimension: rank {
      type: number
    }
    measure: dynamic_measure {
      type: number
      sql: ${current_period_measure} ;;
    }
  }
