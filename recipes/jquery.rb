ask "use jQuery? (yes/no) " do

  # remove the Prototype adapter file
  remove_file 'public/javascripts/rails.js'

  #create vendor directory
  empty_directory "public/javascripts/vendor"

  # add jQuery files
  inside "public/javascripts/vendor" do
    get "https://github.com/rails/jquery-ujs/raw/master/src/rails.js", "rails.js"
    get "http://code.jquery.com/jquery-1.5.min.js", "jquery.js"
  end

  # adjust the Javascript defaults
  inject_into_file 'config/application.rb', "config.action_view.javascript_expansions[:defaults] = %w(jquery rails)\n", :after => "config.action_view.javascript_expansions[:defaults] = %w()\n", :verbose => false
  gsub_file "config/application.rb", /config.action_view.javascript_expansions\[:defaults\] = \%w\(\)\n/, ""

  git :tag => "jquery_installation"
  git :add => '.'
  git :commit => "-am 'jQuery installation.'"
  
end