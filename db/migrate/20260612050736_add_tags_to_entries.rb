class AddTagsToEntries < ActiveRecord::Migration[8.1]
  def change
    add_column :entries, :tags, :string
  end
end
