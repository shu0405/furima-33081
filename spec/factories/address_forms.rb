FactoryBot.define do
  factory :address_form do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    area_id { 5 }
    municipality { '横浜市緑区' }
    address_number { '青山1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
