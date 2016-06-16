FactoryGirl.define do
  factory :user do
    email "admin@test.com"
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end

    factory :super_admin do
      admin true
      super_admin true
    end
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
