class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :language, presence: true
  has_many :votes
  has_one :response
end
