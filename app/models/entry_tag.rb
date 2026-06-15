class EntryTag < ApplicationRecord
  belongs_to :entry
  belongs_to :tag
    has_many :entry_tags, dependent: :destroy
  has_many :tags, through: :entry_tags
  has_many :likes, dependent: :destroy
end
