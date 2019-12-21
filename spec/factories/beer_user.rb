FactoryBot.define do
  factory :beer_user do
    seen_at { Time.now }
    favorite { false }
    association :user, factory: :user
    association :beer, factory: :beer
  end
end
