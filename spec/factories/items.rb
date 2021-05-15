FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    info { Faker::Lorem.word }
    category_id { Faker::Number.within(range: 1..2) }
    item_status_id { Faker::Number.within(range: 1..2) }
    shipping_id { Faker::Number.within(range: 1..2) }
    area_id { Faker::Number.within(range: 1..2) }
    schedule_id { Faker::Number.within(range: 3..6) }
    price { Faker::Number.number(digits: 4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'test_image.png')
    end
  end
end
