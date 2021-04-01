class AddressForm

  include ActiveModel::Model
  attr_accessor :area_id, :address_number, :municipality, :postal_code, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }
    validates :address_number
    validates :phone_number, format: { with: /\A\d{11}\z/ ,message: "is invalid. Input half-width numbers."}
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :token, presence: true
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, municipality: municipality, phone_number: phone_number,address_number: address_number, building_name: building_name,area_id: area_id, user_item_id: user_item.id)
  end
end