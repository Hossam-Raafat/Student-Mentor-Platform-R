class Response < ApplicationRecord
  validates :answer, presence: true
  belongs_to :question
  belongs_to :mentor
end
