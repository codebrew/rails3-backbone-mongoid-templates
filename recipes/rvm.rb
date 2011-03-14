ask_to_install :rvm_gemset do
  template File.expand_path("../../templates/rvmrc.erb", __FILE__), ".rvmrc"
  
  git_commit 'Initial commit of new Rails app'
end