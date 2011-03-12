say "setting up compass with 960.gs"

gem 'compass'
gem 'compass-960-plugin'

run "bundle install"

run "compass init rails .  -r ninesixty --using 960 --sass-dir app/stylesheets --css-dir public/stylesheets/compiled/ -q"