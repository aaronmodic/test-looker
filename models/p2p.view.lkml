view: p2p {

  ### Create a calendar table or use a view to build a date field for the view ###

  derived_table: {
    sql: SELECT date_trunc('day', dd)::date as full_date
          FROM generate_series
                  ( '2011-01-01'::timestamp
                  , '2022-12-31'::timestamp
                  , '1 day'::interval) dd
                     ;;
  }


##### Period over Period Comparison {

### POP Analysis
  parameter: pop_comparison{
    label: "Period over Period Comparison"
    type: string
    allowed_value: { value: "Previous Week" }
    allowed_value: { value: "Previous Month" }
    allowed_value: { value: "Previous Year" }
    allowed_value: { value: "Previous Period" }
  }

  filter: current_period_filter {
    type: date
    description: "Use this filter to define the current and previous period for analysis"
    sql: ${period} IS NOT NULL ;;
    convert_tz: no
  }


# ### This code is for PostgreSQL

  dimension: period {
    type: string
    description: "The reporting period as selected by the This Period Filter"
    sql:
          CASE
            WHEN {% date_start current_period_filter %} is not null
              AND {% date_end current_period_filter %} is not null /* date ranges or in the past x days */
              AND {% parameter pop_comparison %} = 'Previous Period'
              THEN
                CASE
                  WHEN ${full_date_raw} >= {% date_start current_period_filter %}
                    AND ${full_date_raw} < {% date_end current_period_filter %}
                    THEN 'Current [ '|| DATE({% date_start current_period_filter %}) || ' to ' || DATE( ({% date_end current_period_filter %} - (1 || ' day')::INTERVAL)) || ' ]'
                  WHEN ${full_date_raw} >= ( {% date_start current_period_filter %} - (1 * (DATE_PART('day', {% date_end current_period_filter %} - {% date_start current_period_filter %} )  ) || ' day')::INTERVAL)
                    AND ${full_date_raw} < {% date_start current_period_filter %}
                    THEN 'Previous [ '||DATE  ( {% date_start current_period_filter %} - (1 * (DATE_PART('day', {% date_end current_period_filter %} - {% date_start current_period_filter %} )  ) || ' day')::INTERVAL) ||
                          ' to ' || DATE( ({% date_start current_period_filter %} - (1 || ' day')::INTERVAL)) || ' ]'
                      END
            WHEN {% date_start current_period_filter %} is not null
              AND {% date_end current_period_filter %} is not null /* date ranges or in the past x days */
              AND {% parameter pop_comparison %} = 'Previous Week' /* date ranges or in the past x days */
            THEN
              CASE
                WHEN ${full_date_raw} >=  {% date_start current_period_filter %}
                  AND ${full_date_raw} < {% date_end current_period_filter %}
                  THEN 'Current [ '|| DATE({% date_start current_period_filter %}) || ' to ' || DATE( ({% date_end current_period_filter %}  - (1 || ' day')::INTERVAL)) || ' ]'
                WHEN ${full_date_raw} >= DATE({% date_start current_period_filter %}  - (1 || ' week')::INTERVAL)
                  AND ${full_date_raw} < DATE(({% date_start current_period_filter %}  - (1 || ' week')::INTERVAL) +
                    (  (DATE_PART('day', {% date_end current_period_filter %} - {% date_start current_period_filter %} )  ) || ' day')::INTERVAL)
                  THEN 'Previous [ ' || DATE({% date_start current_period_filter %}  - (1 || ' week')::INTERVAL) || ' to '||
                     DATE((({% date_start current_period_filter %}  - (1 || ' week')::INTERVAL) +
                    (  (DATE_PART('day', {% date_end current_period_filter %} - {% date_start current_period_filter %} )  ) || ' day')::INTERVAL) - (1 || ' day')::INTERVAL)
                    || ' ]'
              END
            WHEN {% date_start current_period_filter %} is not null
              AND {% date_end current_period_filter %} is not null /* date ranges or in the past x days */
              AND {% parameter pop_comparison %} = 'Previous Month' /* date ranges or in the past x days */
            THEN
              CASE
                WHEN ${full_date_raw} >=  {% date_start current_period_filter %}
                  AND ${full_date_raw} < {% date_end current_period_filter %}
                  THEN 'Current [ '|| DATE({% date_start current_period_filter %}) || ' to ' || DATE( ({% date_end current_period_filter %}  - (1 || ' day')::INTERVAL)) || ' ]'
                WHEN ${full_date_raw} >= DATE({% date_start current_period_filter %}  - (1 || ' month')::INTERVAL)
                  AND ${full_date_raw} < DATE(({% date_start current_period_filter %}  - (1 || ' month')::INTERVAL) +
                    (  (DATE_PART('day', {% date_end current_period_filter %} - {% date_start current_period_filter %} )  ) || ' day')::INTERVAL)
                  THEN 'Previous [ ' || DATE({% date_start current_period_filter %}  - (1 || ' month')::INTERVAL) || ' to '||
                     DATE((({% date_start current_period_filter %}  - (1 || ' month')::INTERVAL) +
                    (  (DATE_PART('day', {% date_end current_period_filter %} - {% date_start current_period_filter %} )  ) || ' day')::INTERVAL) - (1 || ' day')::INTERVAL)
                    || ' ]'
              END
            WHEN {% date_start current_period_filter %} is not null
              AND {% date_end current_period_filter %} is not null /* date ranges or in the past x days */
              AND {% parameter pop_comparison %} = 'Previous Year' /* date ranges or in the past x days */
            THEN
              CASE
                WHEN ${full_date_raw} >=  {% date_start current_period_filter %}
                  AND ${full_date_raw} < {% date_end current_period_filter %}
                  THEN 'Current [ '|| DATE({% date_start current_period_filter %}) || ' to ' || DATE( ({% date_end current_period_filter %}  - (1 || ' day')::INTERVAL)) || ' ]'
                WHEN ${full_date_raw} >= DATE({% date_start current_period_filter %}  - (1 || ' year')::INTERVAL)
                  AND ${full_date_raw} < DATE(({% date_start current_period_filter %}  - (1 || ' year')::INTERVAL) +
                    (  (DATE_PART('day', {% date_end current_period_filter %} - {% date_start current_period_filter %} )  ) || ' day')::INTERVAL)
                  THEN 'Previous [ ' || DATE({% date_start current_period_filter %}  - (1 || ' year')::INTERVAL) || ' to '||
                     DATE((({% date_start current_period_filter %}  - (1 || ' year')::INTERVAL) +
                    (  (DATE_PART('day', {% date_end current_period_filter %} - {% date_start current_period_filter %} )  ) || ' day')::INTERVAL) - (1 || ' day')::INTERVAL)
                    || ' ]'
              END
            END ;;
  }


  dimension_group: full_date {
    type: time
    timeframes: [raw, date]
    convert_tz: no
  }


}
