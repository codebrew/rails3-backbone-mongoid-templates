templates = File.expand_path("../recipes/*.rb", __FILE__)

def ask(message, &block)
  # if yes? message
  #   block.call
  # end
  
  block.call
end

@recipe_blocks = []
@recipes_to_run = []

def ask_to_install(recipe, &block)
  if yes? "do you want to install #{recipe.to_s}? (yes/no)"
    @recipes_to_run << :recipe
    @recipe_blocks << block
  end
end

def recipes_include?(recipe)
  @recipes_to_run.include? recipe
end

def git_commit(message)
  if recipes_include? :git
    git :add => '.'
    git :commit => "-aqm '#{message}'"
  end
end

#cucumber, capybara, backbone
# %w{git rvm haml compass mongoid jquery jammit coffeescript rspec devise home cleanup}

%w{git rvm haml compass mongoid jquery jammit coffeescript rspec devise home cleanup}.each do | recipe|
  apply File.expand_path("../recipes/#{recipe}.rb", __FILE__)
end

@recipe_blocks.each {|block| block.call}

