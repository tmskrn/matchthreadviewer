desc "This task is called by the Heroku scheduler add-on"
task :update_threads => :environment do
  puts "Updating matchthreads and comments..."
  ReddJobs.update
  puts "done."
end