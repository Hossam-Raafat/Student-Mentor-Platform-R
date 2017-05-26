class Response < ApplicationRecord
  has_one :rate
  belongs_to :question
  belongs_to :mentor
end
