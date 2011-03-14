remove_file "public/index.html"

git :tag => "cleanup"
git :add => '.'
git :commit => "-am 'cleaning up project'"