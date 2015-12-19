FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.safe_email}
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
end
