require "faker"

FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.paragraph }
    trait :post_id do
      association :post
    end
    trait :author do
      association :user
    end
  end
end
