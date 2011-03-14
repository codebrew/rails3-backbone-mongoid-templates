ask_to_install :haml do
  gem 'haml', '>= 3.0.0'
  gem 'haml-rails'

  remove_file 'app/views/layouts/application.html.erb'

  template File.expand_path("../../templates/application.html.haml", __FILE__), 'app/views/layouts/application.html.haml'

  git_commit "Haml installation."  
end

