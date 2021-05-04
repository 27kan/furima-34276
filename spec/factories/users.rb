FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.name}
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    last_reading          {Gimei.name.katakana}
    first_reading         {Gimei.name.katakana}
    birthday              {Faker::Date.birthday}
  end
end