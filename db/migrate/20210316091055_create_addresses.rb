class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer   :area_id,        null: false
      t.string   :postal_code,     null: false
      t.string   :municipality,    null: false
      t.string   :address_number,  null: false
      t.string   :phone_number,    null: false
      t.string   :building_name
      t.references   :user_item,     foreign_key: true
      t.timestamps
    end
  end
end
