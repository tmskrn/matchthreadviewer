class HomeController < ApplicationController

  def index
	@match_threads = Matchthread.get_matches

	#TODO: Put API Call in Lib
	#TODO: OAuth?
	#TODO: Tests
	#TODO: Display comments in threaded manner for each matchthread
	#TODO: Parse out kickoff
  end
end
