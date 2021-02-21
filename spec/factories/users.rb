FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = 'a1' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday {"1999-08-07"}
    first_name {"あああ"}
    surname_name {"いいい"}
    katakana_first_name {"アアア"}
    katakana_surname_name {"イイイ"}
  end
end
