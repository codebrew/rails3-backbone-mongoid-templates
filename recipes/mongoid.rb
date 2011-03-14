ask_to_install :mongoid do
  
  say "installing mongoid 2.0.0"
  
  gem 'mongoid', '>= 2.0.0.rc.7'
  gem 'bson_ext', '>= 1.2.4'

  #----------------------------------------------------------------------------
  # Resolve issue 17: https://github.com/fortuity/rails3-mongoid-devise/issues#issue/17
  # Change YAML Engine to accommodate Ruby 1.9.2p180 yaml parser problem.
  # Rubygems 1.5.0 changes the yaml parsing default from syck 
  # to psych and psych doesn't like the ":<<" in yaml files.
  # This is a workaround until the next version of Ruby is published.
  # http://groups.google.com/group/mongoid/browse_thread/thread/9213a17a73d3c422
  # http://redmine.ruby-lang.org/issues/show/4300
  #----------------------------------------------------------------------------                         
  inject_into_file 'config/environment.rb', "\nrequire 'yaml'\nYAML::ENGINE.yamler= 'syck'\n", :after => "require File.expand_path('../application', __FILE__)", :verbose => false

  # generate mongoid configuration
  run "bundle install"

  generate 'mongoid:config'

  # note: the mongoid generator automatically modifies the config/application.rb file
  # to remove the ActiveRecord dependency by commenting out "require active_record/railtie'"

  # remove unnecessary 'config/database.yml' file
  remove_file 'config/database.yml'

  git_commit "mongoid install"
end