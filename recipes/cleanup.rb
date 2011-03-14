ask_to_install :cleanup do
  remove_file "public/index.html"
  
  git_commit "cleaning up project"
end