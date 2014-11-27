class HomeController < ApplicationController
  def index
		@match_threads = Matchthread.where(created_at: (Time.now - 48.hour)..Time.now).order('score DESC')
  end
end
