FactoryGirl.define do
  factory :question do
    description Faker::Lorem.paragraph
    done false
  end

  factory :invalid_question, class: Question do
    description ""
    done false
  end

  factory :question_updated, class: Question do
    description Faker::Lorem.paragraph
    done true
  end
end
