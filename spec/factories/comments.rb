require 'faker'

FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.paragraph }
    association :author, factory: :user
    association :post, factory: :post
  end
end
