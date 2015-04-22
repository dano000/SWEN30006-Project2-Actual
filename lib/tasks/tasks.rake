
desc 'new_bom'
task new_bom: :environment do
  puts "starting update BOM..."
  Scrape.new
  puts "update BOM completed."
end

desc 'new_fio'
task new_fio: :environment do
  puts "Starting update FIO..."
  Scrape.new_fio
  puts "update FIO completed."
end


