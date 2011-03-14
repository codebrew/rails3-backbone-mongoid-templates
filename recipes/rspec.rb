# Use RSpec instead of TestUnit
ask_to_install :rspec do
  say 'Installing RSpec'

  gem 'rspec-rails', '>= 2.5', :group => [:development, :test]
  gem 'database_cleaner', :group => [:development, :test]
  gem 'fabrication', :group => [:development, :test]
  
  if recipes_include? :mongoid
    gem 'mongoid-rspec', ">= 1.4.1", :group => [:development, :test]
  end

  run "bundle install"

  generate 'rspec:install'
  
  # remove either possible occurrence of "require rails/test_unit/railtie"
  gsub_file 'config/application.rb', /require 'rails\/test_unit\/railtie'/, "# require 'rails/test_unit/railtie'"
  gsub_file 'config/application.rb', /require "rails\/test_unit\/railtie"/, "# require 'rails/test_unit/railtie'"

  inject_into_file 'config/application.rb', :after => "class Application < Rails::Application\n" do
    <<-RUBY
      config.generators do |g|
        g.test_framework      :rspec, :fixture => true
        g.fixture_replacement :fabrication
      end
    RUBY
  end

  say "Removing test folder (not needed for RSpec)"
  run 'rm -rf test/'
  
  if recipes_include? :mongoid
    # remove ActiveRecord artifacts
    gsub_file 'spec/spec_helper.rb', /config.fixture_path/, '# config.fixture_path'
    gsub_file 'spec/spec_helper.rb', /config.use_transactional_fixtures/, '# config.use_transactional_fixtures'
    
    copy_file File.expand_path("../../templates/rspec/database_cleaner.rb", __FILE__), "spec/support/database_cleaner.rb"
    copy_file File.expand_path("../../templates/rspec/mongoid.rb", __FILE__), "spec/support/mongoid.rb"
  else
    # using active record
    copy_file File.expand_path("../../templates/rspec/ar_database_cleaner.rb", __FILE__), "spec/support/database_cleaner.rb"
  end

  if recipes_include? :devise
    copy_file File.expand_path("../../templates/rspec/devise.rb", __FILE__), "spec/support/devise.rb"
  end
  
  git_commit "rspec install"
  
end

