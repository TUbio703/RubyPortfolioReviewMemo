class CreateEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :media_type
      t.integer :rating
      t.text :body

      t.timestamps
    end
  end
end
