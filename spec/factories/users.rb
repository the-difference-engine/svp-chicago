FactoryGirl.define do
  factory :user do
    email "admin@test.com"
    password "password"
    password_confirmation "password"
  end

  factory :question do
    question "How old are you?"
  end

  factory :answer do
    question_id 1
    loi_id 1
    answer "this is an answer"
  end
end
