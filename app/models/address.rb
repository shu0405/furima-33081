class Address < ApplicationRecord
  belongs_to :user_item

  #  with_options presence: true do
  #    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }
  #    validates :address_number
  #    validates :phone_number, format: { with: /\A\d{11}\z/ ,"is invalid. Input half-width numbers."}
  #    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  #    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  #  end
  #  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
end
