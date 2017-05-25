class Student < ActiveRecord::Base
  # Include default devise modules.
  attr_reader :raw_invitation_token
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :invitable
  # Validation regular expression that accepts only a Fire_up_(any digit)
  # you can try the regular expression syntax here : http://rubular.com/
  validates :program, format: { with: /\AFire_up_\d+\Z/,
    message: 'Fire_up_(number)' }
  has_many :rates
  has_many :questions
  has_many :votes
  include DeviseTokenAuth::Concerns::User
end
