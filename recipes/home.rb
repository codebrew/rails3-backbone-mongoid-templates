generate(:controller, "home index")
gsub_file 'config/routes.rb', /get \"home\/index\"/, 'root :to => "home#index"'

git :tag => "home_page"
git :add => '.'
git :commit => "-am 'Create a home controller and view.'"