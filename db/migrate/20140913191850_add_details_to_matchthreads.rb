class AddDetailsToMatchthreads < ActiveRecord::Migration
  def change
    add_column :matchthreads, :url, :string
    add_column :matchthreads, :kickoff, :datetime
  end
end
