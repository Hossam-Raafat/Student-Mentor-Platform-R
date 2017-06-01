class Response < ApplicationRecord

  # validates :answer, presence: true

  has_one :rate
  belongs_to :question
  belongs_to :mentor

  scope :resolvedByMentor, -> (mentor_id) { joins(:mentor).where("mentors.id = #{mentor_id}").where("responses.status = 'true'") }
  # scope :claimedByMentor, -> (mentor_id) { joins(:mentor).where("mentors.id = #{mentor_id}").where("responses.status = 'false'") }
end
