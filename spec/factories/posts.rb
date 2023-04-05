require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    trait :author do
      association :user
    end
  end
end
