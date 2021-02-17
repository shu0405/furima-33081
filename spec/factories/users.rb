FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday {"1999-08-07"}
    first_name {Faker::Name.first_name}
    surname_name {Faker::Name.last_name}
    katakana_first_name {"アアア"}
    katakana_surname_name {"イイイ"}
  end
end
