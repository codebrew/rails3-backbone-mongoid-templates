ask "set up git? (yes/no) " do
  say "setting up git....."

  remove_file '.gitignore'
  get File.expand_path("../../templates/gitignore.txt", __FILE__), ".gitignore"

  # Initialize new Git repo
  git :init
  git :add => '.'
  git :commit => "-aqm 'Initial commit of new Rails app'"

  # say_wizard "Creating a git working_branch (to follow the stream of development)."
  # git :checkout => ' -b working_branch'
  # git :add => '.'
  # git :commit => "-m 'Initial commit of working_branch (to establish a clean base line).'"
end

# say_recipe 'Git'

# Git should ignore some files