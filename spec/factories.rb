FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    sequence(:username) { |n| "user#{n}" }
    password "testtest"
    password_confirmation "testtest"
  end

  factory :point do
    value 50
    activity 'shot'
    user
  end
end
