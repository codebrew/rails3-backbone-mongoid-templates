ask_to_install :jquery do

  # remove the Prototype adapter file
  remove_file 'public/javascripts/rails.js'

  #create vendor directory
  empty_directory "public/javascripts/vendor"

  # add jQuery files
  inside "public/javascripts/vendor" do
    get "https://github.com/rails/jquery-ujs/raw/master/src/rails.js", "rails.js"
    get "http://code.jquery.com/jquery-1.5.1.js", "jquery.js"
    get "http://documentcloud.github.com/underscore/underscore.js", "underscore.js"
    get "https://github.com/documentcloud/backbone/raw/master/backbone.js", "backbone.js"
    get "http://cloud.github.com/downloads/wycats/handlebars.js/handlebars-0.9.0.pre.4.js", "handlebars.js"
  end

  # adjust the Javascript defaults
  inject_into_file 'config/application.rb', "config.action_view.javascript_expansions[:defaults] = %w(jquery rails)\n", :after => "config.action_view.javascript_expansions[:defaults] = %w()\n", :verbose => false
  gsub_file "config/application.rb", /config.action_view.javascript_expansions\[:defaults\] = \%w\(\)\n/, ""

  git_commit "jquery install"  
end