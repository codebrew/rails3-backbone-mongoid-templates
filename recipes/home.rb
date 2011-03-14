ask_to_install :home_controller do
  generate(:controller, "home index")
  gsub_file 'config/routes.rb', /get \"home\/index\"/, 'root :to => "home#index"'

  git_commit "created homepage controller and index view"
end