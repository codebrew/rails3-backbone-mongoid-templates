ask "do you want to setup rvm gemsets? (yes/no)" do
  template File.expand_path("../../templates/rvmrc.erb", __FILE__), ".rvmrc"
end