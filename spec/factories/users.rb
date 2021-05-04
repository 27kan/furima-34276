FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Gimei.name}
    last_name             {Gimei.name.last}
    first_name            {Gimei.name.first}
    last_reading          {Gimei.name.katakana.last}
    first_reading         {Gimei.name.katakana.first}
    birthday              {Faker::Date.birthday}
  end
end