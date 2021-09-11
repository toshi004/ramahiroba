FactoryBot.define do

  factory :post do
    title { Faker::Lorem.characters(number:10) }
    text { Faker::Lorem.characters(number:30) }
    emotion {1}
    user
  end

end