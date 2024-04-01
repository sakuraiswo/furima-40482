FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6)+'1a' }
    password_confirmation { password }
    last_name { Faker::Name.last_name+'ミョう字' }
    first_name { Faker::Name.first_name+'ナま絵' }
    last_name_kana { 'ミョウジ' }
    first_name_kana { 'ナマエ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2019-12-31') }
  end
end
