class Confession < ApplicationRecord
  has_one :reply
  
  validates :username, presence: true, length: { maximum: 10 }
  validates :text, presence: true, length: { maximum: 30 }
end
