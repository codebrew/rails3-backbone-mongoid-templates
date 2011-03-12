templates = File.expand_path("../recipes/*.rb", __FILE__)

def ask(message, &block)
  if yes? message
    block.call
  end
end

%w{git mongoid jquery}.each do | recipe|
  apply File.expand_path("../recipes/#{recipe}.rb", __FILE__)
end
