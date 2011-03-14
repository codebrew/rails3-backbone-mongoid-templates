gem 'barista', '~> 1.0'

run 'bundle install'

generate "barista:install"

gsub_file 'config/initializers/barista_config.rb', "# c.output_root = Rails.root.join(\"public\", \"coffeescripts\")", "c.output_root = Rails.root.join(\"public/javascripts\", \"app\")"

directory File.expand_path("../../templates/coffeescripts", __FILE__), "app/coffeescripts"