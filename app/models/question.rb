class Question < ApplicationRecord
  # scope :status, -> (status) { where status: status }
  acts_as_votable
  validates :title, presence: true
  validates :body, presence: true
  validates :language, presence: true
  belongs_to :student
  has_one :response
  has_one :mentor, through: :response
  has_one :rate, through: :response

  scope :resolved, -> () { joins(:response).where("responses.status = 'true'").includes(:response).includes(:student) }
  scope :claimed, -> () { joins(:response).where("responses.status = 'false'").includes(:response).includes(:student) }
  scope :unclaimed, -> { where.not(:id => Response.select(:question_id).uniq).includes(:response).includes(:student) }
  scope :resolvedByMentor, -> (mentor_id) {joins(response: :mentor).where("responses.mentor_id = #{mentor_id}").includes(:response).includes(:rate).includes(:student)}
  scope :submittedByStudent, -> (student_id) {joins(response: :mentor).where("questions.student_id = #{student_id}").includes(:response).includes(:rate).includes(:student)}

  mount_uploader :screenshot, ScreenshotUploader

  def status
      if response
        if response.status == true
          'resolved'
        else
          'claimed'
        end
      else
        'unclaimed'
      end
  end


end
