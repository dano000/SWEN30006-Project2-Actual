# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :environment, :development

# On the fifth minute (to account for lag from the Bureau's website) of very 10 minutes within an hour, update the data

#((24 hours * 21 stations )/ 1000 API calls)* 60 minutes (minutes/hour) number of minutes between each call

every '3/60 * * * *' do
  rake 'new_bom'
end

every '*/30.24 * * * *' do

  rake 'new_fio'

end
