class Student < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :invitable
  has_many :questions
  include DeviseTokenAuth::Concerns::User
end
