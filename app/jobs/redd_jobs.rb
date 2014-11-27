class ReddJobs
	def self.clear_old
		@old_threads = Matchthread.where("created_at < ?", (Time.now - 7.day))
		@old_threads.each do |thread|
			fullname = 't3_' + thread.thread_id.to_s
			@old_comments = Comment.where(thread_id: fullname)
			@old_comments.each do |comment|
				comment.destroy
			end
			thread.destroy
		end
	end

	def self.update
		#OAuth2 Access. Fix this asap. Better in the long run.
		#connection = Redd::Client::OAuth2.new(ENV["REDDIT_APP_ID"], ENV["REDDIT_APP_SECRET"], "http://tmskrn.github.io/reddit-subbed-in")
		
		#@connection = Redd::Client::Authenticated.new_from_credentials ENV["REDDIT_USER"], ENV["REDDIT_PASSWORD"]
		redd = ReddJobs.new
		redd.unauthenticated_connection

		redd.update_matchthreads
		self.wait
		redd.update_comments
		self.wait
		puts "Updated matchthreads and comments successfully at: " + Time.now.to_s
	end

	def unauthenticated_connection
		@connection = Redd::Client::Unauthenticated.new
	end

	def update_matchthreads
		Matchthread.get_matches(@connection)
	end

	def update_comments
		@match_threads = Matchthread.where(created_at: (Time.now - 48.hour)..Time.now)
		@match_threads.each do |thread|
			fullname = 't3_' + thread.thread_id.to_s
			Comment.get_comments(@connection, fullname)
			self.class.wait
		end
	end

	def self.wait
		sleep 3
	end
end