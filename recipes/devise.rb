ask_to_install :devise do
  say 'installing Devise'

  gem "devise", ">= 1.2.rc"

  run "bundle install"

  generate 'devise:install'

  #----------------------------------------------------------------------------
  # Prevent logging of password_confirmation
  #----------------------------------------------------------------------------
  gsub_file 'config/application.rb', /:password/, ':password, :password_confirmation'

  generate 'devise user'

  gsub_file 'config/initializers/devise.rb', '# config.scoped_views = false', 'config.scoped_views = true'

  generate "devise:views users -e erb"

  git_commit "added devise for authentication"
end
