require 'Redd'

class Matchthread < ActiveRecord::Base
	def self.get_matches
		#connection = Redd::Client::OAuth2.new(ENV["REDDIT_APP_ID"], ENV["REDDIT_APP_SECRET"], "http://tmskrn.github.io/reddit-subbed-in")
		connection = Redd::Client::Authenticated.new_from_credentials ENV["REDDIT_USER"], ENV["REDDIT_PASSWORD"]
		@hot_threads = connection.get_hot('soccer')
		match_threads = []
		@hot_threads.each do |thread|
			if thread.title.match(/match.{0,1}thread/i) and 
				!thread.title.match(/(Pre|Post)(\W{0,1}|\s{1})/i)
				@Matchthread = Matchthread.new(
					title:thread.title, 
					text:thread.selftext, 
					author:thread.author, 
					url:thread.url, 
					kickoff:DateTime.now)
				match_threads << @Matchthread
			end
		end
		return match_threads
	end

	def get_kickoff
	end
	
	def new
		@Matchthread = Matchthread.new
	end
end
