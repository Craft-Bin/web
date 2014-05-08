desc 'Copy images to Rails public/images/minecraft'
task :images do
  require 'mc-schematic'

  dir = "#{Rake.original_dir}/public/images/minecraft"
  images = MCSchematic.resource_path('images/minecraft')

  puts 'hi'

  `mkdir -p #{dir}`
  `cp -Rp #{images}/blocks #{dir}/blocks`
  `cp -Rp #{images}/items #{dir}/items`

end