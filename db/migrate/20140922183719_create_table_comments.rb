class CreateTableComments < ActiveRecord::Migration
  def change
    create_table :table_comments do |t|
      t.references :parent_id
      t.string :title
      t.text :content
      t.string :author
      t.integer :score
      t.string :thread_id
      t.timestamps
    end
  end
end
