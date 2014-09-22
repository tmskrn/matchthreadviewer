class RenameThreadCommentsToComments < ActiveRecord::Migration
  def change
  	rename_table :thread_comments, :comments
  end
end
