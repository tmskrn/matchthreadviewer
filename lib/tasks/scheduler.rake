desc "This task is called by the Heroku scheduler add-on"
task :update_threads => :production do
  puts "Updating matchthreads and comments..."
  ReddJobs.update
  puts "done."
end