include: "_period_comparison.view.lkml"

view: p2p_exec_fin_2_daily_deepdive_final_cust_look {
  sql_table_name: `pypl-bods.prd_globalbi_product_t.p2p_exec_fin_2_daily_deepdive_final_cust_LOOK` ;;
  extends: [_period_comparison]


#############
# Used to determine date for period comparison
#############

  dimension_group: event {
    hidden: no
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.report_date ;;
  }

#############
# Used to dynamically compare measures
#############

  parameter: measure_selector {
    type: unquoted
    allowed_value: {
      value: "total_tpv"
    }
    allowed_value: {
      value: "total_value"
    }
  }

  measure: current_period_measure {
    type: sum
    sql:
      {% if measure_selector._parameter_value == 'total_tpv' %}
        ${ntpv}
      {% elsif measure_selector._parameter_value == 'total_value' %}
        ${revenue}
      {% else %}
        event
      {% endif %} ;;
    filters: [
      period: "Current Period"
    ]
  }

  measure: comparison_period_measure {
    type: sum
    sql:
      {% if measure_selector._parameter_value == 'total_tpv' %}
        ${ntpv}
      {% elsif measure_selector._parameter_value == 'total_value' %}
        ${revenue}
      {% else %}
        event
      {% endif %} ;;
    filters: [
      period: "Comparison Period"
    ]
  }

  measure: comparison_period_change_percent {
    type: number
    sql: ${current_period_measure}/NULLIF(${comparison_period_measure},0);;
    value_format_name: percent_0
  }


#############
# Dimensions
#############


  dimension: api_integration_type {
    label: "P2P Partner"
    group_label: "Dimensions"
    tags: ["dimensions: Dimension", "filter:"]
    type: string
    sql: ${TABLE}.api_integration_type ;;
  }

  dimension: asp_tran {
    label: "ASP Bucket"
    group_label: "Dimensions"
    tags: ["dimensions: Dimension", "filter:"]
    type: string
    sql: ${TABLE}.asp_tran ;;
  }

  dimension: bfx_rev {
    hidden: yes
    type: number
    sql: ${TABLE}.bfx_rev ;;
  }

  dimension: fx_rev {
    hidden: yes
    type: number
    sql: ${bfx_rev}+${sfx_rev} ;;
  }

  dimension: channel {
    label: "Channel"
    group_label: "Dimensions"
    tags: ["dimensions: Dimension"]
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: chs_fmx_alt_fndg_type_desc {
    type: string
    sql: ${TABLE}.chs_fmx_alt_fndg_type_desc ;;
  }

  dimension: corridor {
    label: "Corridor"
    group_label: "Dimensions"
    tags: ["dimensions: Dimension", "filter:"]
    type: string
    sql: ${TABLE}.corridor ;;
  }

  dimension: ff_gs_ind {
    label: "P2P Primary Flow"
    group_label: "Dimensions"
    tags: ["dimensions: Dimension", "filter:"]
    type: string
    sql: ${TABLE}.ff_gs_ind ;;
  }

  dimension: is_pmt_xbdr_y_n {
    label: "Tradeflow"
    group_label: "Dimensions"
    tags: ["dimensions: Dimension", "filter:"]
    type: string
    sql: ${TABLE}.is_pmt_xbdr_y_n ;;
  }

  dimension: ntpv {
    hidden: yes
    type: number
    sql: ${TABLE}.ntpv ;;
  }

  dimension: os {
    label: "Operating System"
    group_label: "Dimensions"
    tags: ["dimensions: Dimension", "filter:"]
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: p2p_sub_flow {
    label: "P2P Sub Flow"
    group_label: "Dimensions"
    tags: ["dimensions: Dimension", "filter:"]
    type: string
    sql: ${TABLE}.p2p_sub_flow ;;
  }

  dimension: rcvr_acct_clsfn {
    label: "Reciever Account Classification"
    group_label: "Receiver"
    tags: ["dimensions: Receiver Dimensions", "filter: Receiver Filters"]
    type: string
    sql: ${TABLE}.rcvr_acct_clsfn ;;
  }

  dimension: rcvr_acct_type {
    label: "Reciever Account Type"
    group_label: "Receiver"
    tags: ["dimensions: Receiver Dimensions", "filter: Receiver Filters"]
    type: string
    sql: ${TABLE}.rcvr_acct_type ;;
  }

  dimension: rcvr_cntry {
    label: "Reciever Country"
    group_label: "Receiver"
    tags: ["dimensions: Receiver Dimensions", "filter: Receiver Filters"]
    type: string
    sql: ${TABLE}.rcvr_cntry ;;
  }

  dimension: rcvr_cntry_code {
    hidden: yes
    type: string
    sql: ${TABLE}.rcvr_cntry_code ;;
  }

  dimension: rcvr_market {
    label: "Reciever Market"
    group_label: "Receiver"
    tags: ["dimensions: Receiver Dimensions", "filter: Receiver Filters"]
    type: string
    sql: ${TABLE}.rcvr_market ;;
  }

  dimension: rcvr_sub_market_lvl_1 {
    label: "Reciever Sub Market Lvl 1"
    group_label: "Receiver"
    tags: ["dimensions: Receiver Dimensions", "filter: Receiver Filters"]
    type: string
    sql: ${TABLE}.rcvr_sub_market_lvl_1 ;;
  }

  dimension: rcvr_sub_market_lvl_2 {
    label: "Reciever Sub Market Lvl 2"
    group_label: "Receiver"
    tags: ["dimensions: Receiver Dimensions", "filter: Receiver Filters"]
    type: string
    sql: ${TABLE}.rcvr_sub_market_lvl_2 ;;
  }

  dimension: rcvr_sub_market_lvl_3 {
    label: "Reciever Sub Market Lvl 3"
    group_label: "Receiver"
    tags: ["dimensions: Receiver Dimensions", "filter: Receiver Filters"]
    type: string
    sql: ${TABLE}.rcvr_sub_market_lvl_3 ;;
  }

  dimension_group: report {
    label: "Report"
    group_label: "Timeframes"
    tags: ["timeframes: Timeframe", "filter:"]
    type: time
    timeframes: [
      raw,
      date,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.report_date ;;
  }

  dimension: revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: revenue_wo_bfx {
    hidden: yes
    description: "revenue - bfx revenue - sfx revenue"
    type: number
    sql: ${revenue}-${bfx_rev}-${sfx_rev} ;;
  }

  dimension: margin {
    hidden: yes
    description: "revenue - txn loss - txn expn"
    type: number
    sql: ${revenue}-${txn_loss}-${txn_expn} ;;
  }

  dimension: segment {
    label: "Sender Segment"
    group_label: "Sender Dimensions"
    tags: ["dimensions: Sender Dimensions", "filter: Sender Filters"]
    type: string
    sql: ${TABLE}.segment ;;
  }

  dimension: sfx_rev {
    hidden: yes
    type: number
    sql: ${TABLE}.sfx_rev ;;
  }

  dimension: sndr_acct_clsfn {
    label: "Sender Account Classification"
    group_label: "Sender Dimensions"
    tags: ["dimensions: Sender Dimensions", "filter: Sender Filters"]
    type: string
    sql: ${TABLE}.sndr_acct_clsfn ;;
  }

  dimension: sndr_acct_type {
    label: "Sender Account Type"
    group_label: "Sender Dimensions"
    tags: ["dimensions: Sender Dimensions", "filter: Sender Filters"]
    type: string
    sql: ${TABLE}.sndr_acct_type ;;
  }

  dimension: sndr_cntry {
    label: "Sender Country"
    group_label: "Sender Dimensions"
    tags: ["dimensions: Sender Dimensions", "filter: Sender Filters"]
    type: string
    sql: ${TABLE}.sndr_cntry ;;
  }

  dimension: sndr_cntry_code {
    hidden: yes
    type: string
    sql: ${TABLE}.sndr_cntry_code ;;
  }

  dimension: sndr_market {
    label: "Sender Market"
    group_label: "Sender Dimensions"
    tags: ["dimensions: Sender Dimensions", "filter: Sender Filters"]
    type: string
    sql: ${TABLE}.sndr_market ;;
  }

  dimension: sndr_sub_market_lvl_1 {
    label: "Sender Sub Market Lvl 1"
    group_label: "Sender Dimensions"
    tags: ["dimensions: Sender Dimensions", "filter: Sender Filters"]
    type: string
    sql: ${TABLE}.sndr_sub_market_lvl_1 ;;
  }

  dimension: sndr_sub_market_lvl_2 {
    label: "Sender Sub Market Lvl 2"
    group_label: "Sender Dimensions"
    tags: ["dimensions: Sender Dimensions", "filter: Sender Filters"]
    type: string
    sql: ${TABLE}.sndr_sub_market_lvl_2 ;;
  }

  dimension: sndr_sub_market_lvl_3 {
    label: "Sender Sub Market Lvl 3"
    group_label: "Sender Dimensions"
    tags: ["dimensions: Sender Dimensions", "filter: Sender Filters"]
    type: string
    sql: ${TABLE}.sndr_sub_market_lvl_3 ;;
  }

  dimension: txn_expn {
    hidden: yes
    type: number
    sql: ${TABLE}.txn_expn ;;
  }

  dimension: txn_loss {
    hidden: yes
    type: number
    sql: ${TABLE}.txn_loss ;;
  }

  dimension: txns {
    hidden: yes
    type: number
    sql: ${TABLE}.txns ;;
  }

  dimension: ulp_flag {
    label: "ULP"
    group_label: "Dimensions"
    tags: ["dimensions: Dimension", "filter:"]
    type: string
    sql: ${TABLE}.ulp_flag ;;
  }

  dimension_group: wk_endg_dt {
    group_label: "Dimensions"
    #tags: ["timeframes: timeframes"]
    type: time
    timeframes: [
      week
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.wk_endg_dt ;;
  }

  dimension: xbdr_rev {
    hidden: yes
    type: number
    sql: ${TABLE}.xbdr_rev ;;
  }

######################
# Measures
######################

  measure: total_tpv {
    label: "TPV $"
    tags: ["measures: measure"]
    type: sum
    sql: ${ntpv} ;;
    value_format_name: usd
  }

  measure: total_transactions {
    label: "Txns#"
    tags: ["measures: measure"]
    type: sum
    sql: ${txns} ;;
    value_format_name: usd
  }

  measure: total_revenue {
    label: "Revenue"
    tags: ["measures: measure"]
    type: sum
    sql: ${revenue} ;;
    value_format_name: usd
    #value_format: "[>=1000000000]$0.00,,,\"B\";[=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
  }

  #>=1000000]$0,,\"M\";

  measure: total_revenue_wo_bfx {
    label: "Revenue W/O BFX"
    tags: ["measures: measure"]
    type: sum
    sql: ${revenue_wo_bfx}  ;;
    value_format_name: usd
  }

  measure: total_fx_revenue {
    label: "FX Revenue"
    tags: ["measures: measure"]
    type: sum
    sql: ${fx_rev} ;;
    value_format_name: usd
  }

  measure: average_txn_value {
    label: "Average Transaction Value"
    tags: ["measures: measure"]
    type: number
    sql: ${total_revenue}/${total_transactions} ;;
    value_format_name: usd
  }

  measure: total_margin {
    label: "Total Margin"
    type: sum
    sql: ${margin} ;;
    value_format_name: usd
  }

  measure: txn_margin {
    label: "Txn Margin"
    tags: ["measures: measure"]
    type: number
    sql: ${total_margin}/${total_revenue} ;;
    value_format_name: usd
  }

  measure: total_txn_expense {
    label: "Total Txn Expense"
    type: sum
    sql: ${txn_expn} ;;
    value_format_name: usd
  }

  measure: total_transaction_expense {
    label: "Txn Expense"
    description: "total txn_exp / total ntpv"
    tags: ["measures: measure"]
    type: number
    sql: ${total_txn_expense}/${total_tpv} ;;
    value_format_name: usd
  }

  measure: total_txn_loss {
    label: "Total Txn Loss"
    type: sum
    sql: ${txn_loss} ;;
    value_format_name: usd
  }

  measure: total_transaction_loss {
    label: "Txn Loss"
    description: "total txn_loss / total ntpv"
    tags: ["measures: measure"]
    type: number
    sql: ${total_txn_loss}/${total_tpv} ;;
    value_format_name: usd
  }

}
