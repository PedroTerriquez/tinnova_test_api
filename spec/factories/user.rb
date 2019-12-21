FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    username { Faker::Name.first_name }
    password {'123456'}
  end
end
