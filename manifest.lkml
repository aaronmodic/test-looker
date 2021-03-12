#project_name: "aaron_test_project"

application: workflow_test {
  label: "Play Q Test"
  url: "http://localhost:8080/bundle.js"
  #file: "dev-playq-bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    allow_forms: yes
    allow_same_origin: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models"]
    oauth2_urls: ["https://*.looker.com", "https://*.bytecode.io"]
    external_api_urls: ["https://*.looker.com", "https://*.bytecode.io"]
  }
}

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
