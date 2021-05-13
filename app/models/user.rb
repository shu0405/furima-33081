class User < ApplicationRecord
  has_many :items
  has_many :user_items
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         with_options presence: true do
          validates :nickname
          validates :birthday
          validates :first_name 
          validates :surname_name 
          validates :katakana_first_name
          validates :katakana_surname_name
         end
         with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/,message: 'Full-width characters' } do
          validates :first_name
          validates :surname_name
         end

         with_options format: { with: /\A[ァ-ヶー－]+\z/,message: 'Full-width katakana characters' } do
          validates :katakana_first_name
          validates :katakana_surname_name
         end
         validates :password,format: {with:/\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/, message: 'Include both letters and numbers' 	}
end
