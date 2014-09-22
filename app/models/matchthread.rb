class Matchthread < ActiveRecord::Base
	def self.get_matches
		#OAuth2 Access. Fix this asap. Better in the long run.
		#connection = Redd::Client::OAuth2.new(ENV["REDDIT_APP_ID"], ENV["REDDIT_APP_SECRET"], "http://tmskrn.github.io/reddit-subbed-in")
		
		#@connection = Redd::Client::Authenticated.new_from_credentials ENV["REDDIT_USER"], ENV["REDDIT_PASSWORD"]
		@connection = Redd::Client::Unauthenticated.new
		@hot_threads = @connection.get_hot('soccer')

		@hot_threads.each do |thread|
			if thread.title.match(/match.{0,1}thread/i) and 
				!thread.title.match(/(Pre|Post)(\W{0,1}|\s{1})/i)
				puts thread.id
				if Matchthread.exists?(:thread_id => thread.id)
					@Matchthread = Matchthread.find_by(thread_id: thread.id)
					@Matchthread.text = thread.selftext
					@Matchthread.save
				else
					@Matchthread = Matchthread.create(
					thread_id:thread.id,
					title:thread.title,
					text:thread.selftext, 
					author:thread.author, 
					url:thread.url, 
					kickoff:DateTime.now)
				end
			end
		end
	end

	# def get_kickoff(thread) # currently, most match threads don't have the kickoff info included
	# 	kickoff_line = thread.selftext[/Kick\s?Off\W?.+$/i] # find the line that contains the kickoff time
	# 	kickoff_times = kickoff_line.scan(/\d{2}\W?\d{2}\s?\w{3}/i) # get all the kickoff times
	# 	kickoff_times.each do |time|
	# 		kickoff_time = DateTime.parse(time[/\d{2}\W?\d{2}/i])
	# 		kickoff_datetime = Time.parse(time)
	# 	end
	# end

	def create
	  @Matchthread = Matchthread.new(article_params)
	 
	  @article.save
	  redirect_to @article
	end
	
	def new
		@Matchthread = Matchthread.new
	end
end