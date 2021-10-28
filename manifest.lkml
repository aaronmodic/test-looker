project_name: "aaron_test"

application: framework_app_test {
  label: "Framework App Test"
  #url: "http://localhost:8080/bundle.js"
  file: "bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes"]
    oauth2_urls: ["https://*.looker.com", "https://*.bytecode.io"]
    external_api_urls: ["https://*.looker.com", "https://*.bytecode.io", "https://*.amazonaws.com/"]
  }
}

application: framework_app_cisco {
  label: "Cisco Framework"
  url: "http://localhost:8080/bundle.js"
  #file: "cisco_bundle.js"
  #url: "https://looker-bundle-bucket.s3.amazonaws.com/bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes", "folder_looks","dashboard_dashboard_elements","look","folder_dashboards"]
    oauth2_urls: ["https://*.looker.com", "https://*.bytecode.io", "https://looker.*.com"]
    external_api_urls: ["https://*.looker.com", "https://*.bytecode.io", "https://*.amazonaws.com/","https://looker.*.com"]
  }
}

application: framework_app_vibes {
  label: "Vibes Framework"
  url: "http://localhost:8080/bundle.js"
  #file: "cisco-bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes", "folder_looks","dashboard_dashboard_elements","look","folder_dashboards", "all_roles"]
    oauth2_urls: ["https://*.looker.com", "https://*.bytecode.io"]
    external_api_urls: ["https://*.looker.com", "https://*.bytecode.io", "https://*.amazonaws.com/"]
  }
}

application: framework_app_paypal {
  label: "Paypal Framework"
  url: "http://localhost:8080/bundle.js"
  #file: "bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes", "lookml_model"]
    oauth2_urls: ["https://*.looker.com", "https://*.bytecode.io"]
    external_api_urls: ["https://*.looker.com", "https://*.bytecode.io", "https://*.amazonaws.com/"]
  }
}

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
