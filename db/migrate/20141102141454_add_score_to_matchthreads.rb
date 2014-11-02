class AddScoreToMatchthreads < ActiveRecord::Migration
  def change
  	add_column :matchthreads, :score, :integer
  end
end
