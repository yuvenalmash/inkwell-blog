require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    bio { Faker::Lorem.paragraph }
    photo { Faker::Avatar.image }
  end
end
