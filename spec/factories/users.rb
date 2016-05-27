FactoryGirl.define do
  factory :user do
    email "admin@test.com"
    password "password"
    password_confirmation "password"
  end
end
