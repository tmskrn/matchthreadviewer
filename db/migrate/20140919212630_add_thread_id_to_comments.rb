class AddThreadIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :thread_id, :string
  end
end
