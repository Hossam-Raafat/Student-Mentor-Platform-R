class Response < ApplicationRecord
  has_one :rate
  belongs_to :question
  belongs_to :mentor

  scope :resolvedByMentor, -> (mentor_id) { joins(:mentor).where("mentors.id = #{mentor_id}").where("responses.status = 'true'") }

end
