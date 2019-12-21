FactoryBot.define do
  factory :beer do
    sequence(:beer_id) { |n| n }
    name { Faker::Beer.unique.name }
    tagline { Faker::Beer.brand }
    description { Faker::Beer.style }
    abv { Faker::Number.decimal(l_digits: 2) }
  end
end
