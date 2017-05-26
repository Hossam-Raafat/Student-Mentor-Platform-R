class Rate < ApplicationRecord
  validates_numericality_of :star, :in => 1..5
  belongs_to :response
  belongs_to :student
  belongs_to :mentor
end
