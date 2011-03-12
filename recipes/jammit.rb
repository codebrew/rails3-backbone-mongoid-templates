ask "setup jammit? (yes/no)" do
  
  gem 'jammit'
    
  template File.expand_path("../../templates/assets.yml", __FILE__), "config/assets.yml"
  
  gsub_file 'app/views/layouts/application.html.erb', "= javascript_include_tag :defaults", "= include_javascripts :common %>", :verbose => false
  
end