# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
#set :output, 'log/whenever.log'
# Example:
#
 set :output, "#{path}/log/whenever.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every :day, :at => '0:00 am' do
#    runner "Clients.gerar_senha"
# end
every 15.minutes do
    runner "Client.change_password"
 end

# Learn more: http://github.com/javan/whenever
