class Mentor < ActiveRecord::Base
  # Include default devise modules.
  attr_reader :raw_invitation_token
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :invitable
  include DeviseTokenAuth::Concerns::User
  has_many :rates
  has_many :responses
end
