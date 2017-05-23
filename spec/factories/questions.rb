FactoryGirl.define do
  factory :question do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraph
    language 'ruby'
    student_id 1
  end

  factory :unresolved_question, class: Question do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraph
    language 'ruby'
    student_id 1
    status false
  end

  factory :resolved_question, class: Question do
     title Faker::Lorem.sentence
    body Faker::Lorem.paragraph
    language 'ruby'
    student_id 1
    status true
  end
end
