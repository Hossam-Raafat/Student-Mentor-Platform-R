class Question < ApplicationRecord
  # scope :status, -> (status) { where status: status }
  validates :title, presence: true
  validates :body, presence: true
  validates :language, presence: true
  belongs_to :student
  has_many :votes
  has_one :response
end
