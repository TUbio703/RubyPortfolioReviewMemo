class Entry < ApplicationRecord
  belongs_to :user
  has_many :entry_tags, dependent: :destroy
  has_many :tags, through: :entry_tags, source: :tag
  has_many :likes, dependent: :destroy
end
