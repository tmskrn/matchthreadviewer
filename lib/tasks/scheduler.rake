desc "This task is called by the Heroku scheduler add-on"
task :update_threads => :environment do
  puts "Updating matchthreads and comments..."
  ReddJobs.update
  puts "done."
end

task :clear_old => :environment do
	puts "Deleting matchthreads and comments more than a week ago."
	ReddJobs.clear_old
	puts "done."
end