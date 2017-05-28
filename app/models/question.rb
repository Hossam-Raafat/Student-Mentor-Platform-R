class Question < ApplicationRecord
  # scope :status, -> (status) { where status: status }
  validates :title, presence: true
  validates :body, presence: true
  validates :language, presence: true
  belongs_to :student
  has_many :votes
  has_one :response

  scope :resolved, -> () { joins(:response).where("responses.status = 'true'") }
  scope :unclaimed, -> { where.not(:id => Response.select(:question_id).uniq) }
  scope :resolvedByMentor, -> (mentor_id) {joins(response: :mentor).where("responses.mentor_id = #{mentor_id}")}


end
