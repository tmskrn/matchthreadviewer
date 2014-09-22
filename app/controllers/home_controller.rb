class HomeController < ApplicationController
  def index
  	Matchthread.get_matches
	@match_threads = Matchthread.where(created_at: (Time.now - 128.hour)..Time.now)

	#TODO: Put API Call in Lib
	#TODO: OAuth?
	#TODO: Tests
	#TODO: Display comments in threaded manner for each matchthread
	#TODO: Parse out kickoff
  end
end
