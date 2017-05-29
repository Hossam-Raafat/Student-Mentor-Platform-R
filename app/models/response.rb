class Response < ApplicationRecord
  # validates :answer, precense: true
  has_one :rate
  belongs_to :question
  belongs_to :mentor
end
