
desc 'new'
task new: :environment do
  puts "starting update..."
  Scrape.new
  puts "update completed."
end


