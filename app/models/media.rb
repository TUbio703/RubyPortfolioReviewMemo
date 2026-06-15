class Media < ApplicationRecord
  has_many :reviews, as: :reviewable
end