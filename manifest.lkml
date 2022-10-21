project_name: "aaron_test"

application: framework_app_test {
  label: "Framework App Test"
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
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes", "create_query", "all_roles"]
    oauth2_urls: ["https://*.looker.com", "https://*.bytecode.io"]
    external_api_urls: ["https://*.looker.com", "https://*.bytecode.io", "https://*.amazonaws.com/"]
  }
}

constant: Test {value:"hey"}
application: framework_app_cisco {
  label: "Cisco Framework"
  #url: "http://localhost:8080/bundle.js"
  file: "cisco_bundle.js"
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
  #url: "http://localhost:8080/bundle.js"
  file: "vibes_bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models",
      "search_dashboard_elements", "run_query", "dashboard","all_user_attributes",
      "folder_looks","dashboard_dashboard_elements","look","folder_dashboards", "create_query", "all_roles","create_dashboard_render_task", "render_task","render_task_results"]
    oauth2_urls: ["https://*.looker.com", "https://*.bytecode.io"]
    external_api_urls: ["https://*.looker.com", "https://*.bytecode.io", "https://*.amazonaws.com/"]
  }
}

application: framework_app_paypal {
  label: "Paypal Framework"
  #url: "http://localhost:8080/bundle.js"
  file: "paypal_bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_iframes:  yes
    use_embeds: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes"
      , "create_query", "all_roles"]
    oauth2_urls: ["https://*.looker.com", "https://*.bytecode.io"]
    external_api_urls: ["https://*.looker.com", "https://*.bytecode.io", "https://*.amazonaws.com/"]
  }
}

application: manhattan_admin_app {
  label: "Manhattan - Admin App"
  #url: "http://localhost:8080/bundle.js"
  file: "/manhattan/admin-bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes","create_sso_embed_url"
      ,"login","logout","all_roles"]
    oauth2_urls: ["https://*.looker.com"]
    external_api_urls: ["https://*.looker.com"]
  }
}

application: manhattan_framework_app {
  label: "Manhattan - App"
  #url: "http://localhost:8080/bundle.js"
  file: "/manhattan/ma-bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    use_iframes: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes","create_sso_embed_url"
      ,"folder_dashboards","user","all_roles"]
    oauth2_urls: ["https://*.looker.com"]
    external_api_urls: ["https://*.looker.com"]
  }
}

application: bytecode_firebolt-extension {
  label: "Bytecode - Firebolt Extension"
  #url: "http://localhost:8080/bundle.js"
  file: "fire_bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    use_iframes: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes","create_sso_embed_url"
      ,"folder_dashboards","user","all_roles"]
    oauth2_urls: ["https://*.looker.com"]
    external_api_urls: ["https://*.looker.com"]
  }
}


application: example {
  label: "Qventus Extension"
  url: "https://localhost:8080/bundle.js"
  # file: "qventus_bundle.js"
  entitlements: {
    local_storage: no
    navigation: no
    new_window: no
    use_form_submit: no
    use_embeds: no
    use_iframes: no
    core_api_methods: []
    oauth2_urls: []
    external_api_urls: ["https://api.github.com/*"]
  }
}

application: nabc_framework_app {
  label: "NABC App"
  url: "http://localhost:8080/bundle.js"
  #file: "/manhattan/ma-bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    use_iframes: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes","create_sso_embed_url"
      ,"folder_dashboards","user","all_roles"]
    oauth2_urls: ["https://*.looker.com"]
    external_api_urls: ["https://*.looker.com"]
  }
}

visualization: {
  id: "html_freeform"
  label: "Html Freeform"
  #url: "https://localhost:8443/html_freeform.js"
  file: "html_freeform.js"
}

visualization: {
  id: "hello world"
  label: "Hello World Viz"
  #url: "https://localhost:8443/hello_world.js"
  file: "hello_world.js"
}

application: viz_workflow_framework {
  label: "Toyota Viz Workflow"
  url: "http://localhost:8080/bundle.js"
  #file: "/manhattan/ma-bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    use_iframes: yes
    core_api_methods: ["all_connections","all_projects","all_groups"
      , "all_users", "all_folders"
      , "search_folders", "run_inline_query", "me"
      , "lookml_model_explore", "all_lookml_models", "search_dashboard_elements", "run_query", "dashboard","all_user_attributes","create_sso_embed_url"
      ,"folder_dashboards","user","all_roles", "copy_dashboard", "create_dashboard_element","update_dashboard_element", "create_query", "dashboard_layout_dashboard_layout_components","update_dashboard_layout_component","render_task_results"]
    oauth2_urls: ["https://*.looker.com"]
    external_api_urls: ["https://*.looker.com"]
    new_window_external_urls: ["https://*.looker.com","blob:*"]
  }
}

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
