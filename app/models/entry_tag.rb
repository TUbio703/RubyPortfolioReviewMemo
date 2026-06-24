class EntryTag < ApplicationRecord
  belongs_to :entry
  belongs_to :tag

  has_many :likes, dependent: :destroy
end
