templates = File.expand_path("../recipes/*.rb", __FILE__)

def ask(message, &block)
  # if yes? message
  #   block.call
  # end
  
  block.call
end

#rspec, database cleaner, fabrication, cucumber capybara, backbone

%w{git rvm haml compass mongoid jquery jammit rspec}.each do | recipe|
  apply File.expand_path("../recipes/#{recipe}.rb", __FILE__)
end
