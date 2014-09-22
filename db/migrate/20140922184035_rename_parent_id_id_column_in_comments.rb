class RenameParentIdIdColumnInComments < ActiveRecord::Migration
  def change
  	rename_column :table_comments, :parent_id_id, :parent_id
  end
end
