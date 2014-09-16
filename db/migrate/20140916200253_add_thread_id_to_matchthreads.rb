class AddThreadIdToMatchthreads < ActiveRecord::Migration
  def change
    add_column :matchthreads, :thread_id, :string
  end
end
