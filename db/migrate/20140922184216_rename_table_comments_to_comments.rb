class RenameTableCommentsToComments < ActiveRecord::Migration
  def change
  	rename_table :table_comments, :thread_comments
  end
end
