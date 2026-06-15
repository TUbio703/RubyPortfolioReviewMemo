class RemoveTagsFromEntries < ActiveRecord::Migration[8.1]
  def change
    remove_column :entries, :tags, :string
  end
end
