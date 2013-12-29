FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    sequence(:username) { |n| "#{n}" }
    password "foobar"
    password_confirmation "foobar"
  end
end
