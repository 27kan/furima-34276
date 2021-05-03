FactoryBot.define do
  factory :user do
    email                 {'test@test.com'}
    password              {'test1111'}
    password_confirmation {password}
    nickname              {'test'}
    last_name             {'てすと'}
    first_name            {'たろう'}
    last_reading          {'テスト'}
    first_reading         {'タロウ'}
    birthday              {'2000年5月3日'}
  end
end