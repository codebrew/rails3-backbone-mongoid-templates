# Use RSpec instead of TestUnit
say 'Installing RSpec'

gem 'rspec-rails', '>= 2.5', :group => [:development, :test]
gem 'database_cleaner', :group => :test
gem 'fabrication', :group => :test
gem 'mongoid-rspec', ">= 1.4.1", :group => :test

run "bundle install"

generate 'rspec:install'

# remove ActiveRecord artifacts
gsub_file 'spec/spec_helper.rb', /config.fixture_path/, '# config.fixture_path'
gsub_file 'spec/spec_helper.rb', /config.use_transactional_fixtures/, '# config.use_transactional_fixtures'
  
# remove either possible occurrence of "require rails/test_unit/railtie"
gsub_file 'config/application.rb', /require 'rails\/test_unit\/railtie'/, "# require 'rails/test_unit/railtie'"
gsub_file 'config/application.rb', /require "rails\/test_unit\/railtie"/, "# require 'rails/test_unit/railtie'"

say "Removing test folder (not needed for RSpec)"
run 'rm -rf test/'
  
copy_file File.expand_path("../../templates/rspec/database_cleaner.rb", __FILE__), "spec/support/database_cleaner.rb"
copy_file File.expand_path("../../templates/rspec/mongoid.rb", __FILE__), "spec/support/mongoid.rb"
copy_file File.expand_path("../../templates/rspec/devise.rb", __FILE__), "spec/support/devise.rb"
  
git :tag => "rspec_installation"
git :add => '.'
git :commit => "-am 'Installed RSpec.'"

