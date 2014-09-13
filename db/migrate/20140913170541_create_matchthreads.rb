class CreateMatchthreads < ActiveRecord::Migration
  def change
    create_table :matchthreads do |t|
      t.string :title
      t.text :text
      t.string :author

      t.timestamps
    end
  end
end
