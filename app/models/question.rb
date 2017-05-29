class Question < ApplicationRecord
  # scope :status, -> (status) { where status: status }
  scope :resolved, -> () { joins(:response).where("responses.status = 'true'") }
  validates :title, presence: true
  validates :body, presence: true
  validates :language, presence: true
  belongs_to :student
  has_many :votes
  has_one :response



end
