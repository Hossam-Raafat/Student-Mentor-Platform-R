FactoryGirl.define do
  factory :student do
    email Faker::Internet.email
    password "12345678"
  end
end
