connection: "bytecode_postgres"

# include all the views
include: "/views/**/*.view"

datagroup: aaron_test_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aaron_test_project_default_datagroup
explore: customers {}
