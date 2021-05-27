FactoryBot.define do
  factory :order_address do
    postal_code   { Faker::Number.number(digits: 7).to_s.insert(3, "-") }
    area_id       { Faker::Number.within(range: 1..47 )}
    city          { Gimei.city.kanji }
    house_number  { Gimei.town.kanji }
    building_name { Gimei.town.kanji }
    phone         { Faker::Number.number(digits: 11)}
    token         { "tok_abcdefghijk00000000000000000" }
  end
end
