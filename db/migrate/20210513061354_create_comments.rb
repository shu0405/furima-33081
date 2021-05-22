class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.string     :text,       null: false
      t.references :user,       foreign_key: true
      t.references :item,       foreign_key: true  
    end
  end
end
