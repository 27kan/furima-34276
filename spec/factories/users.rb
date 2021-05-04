FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    # password英数字混合を実現するため 1a を追加する
    password              {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Gimei.name}
    last_name             {Gimei.name.last}
    first_name            {Gimei.name.first}
    last_reading          {Gimei.name.katakana.last}
    first_reading         {Gimei.name.katakana.first}
    birthday              {Faker::Date.birthday(max_age:65)}
  end
end