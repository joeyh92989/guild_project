FactoryBot.define do
  factory :message do
    message { Faker::Lorem.paragraph_by_chars(number: 100) }
  end
end