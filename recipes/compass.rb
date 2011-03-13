say "setting up compass with 960.gs"

gem 'compass'
gem 'compass-960-plugin'

run "bundle install"

run "compass init rails . -r ninesixty --using 960 --sass-dir app/stylesheets --css-dir public/stylesheets/compiled/ -q"

remove_file 'app/stylesheets/grid.scss'
remove_file 'app/stylesheets/text.scss'

directory File.expand_path("../../templates/stylesheets", __FILE__), "app/stylesheets"