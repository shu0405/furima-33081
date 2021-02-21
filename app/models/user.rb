class User < ApplicationRecord
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

         validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/,message: 'Full-width characters' }
         validates :surname_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/,message: 'Full-width characters' }
         validates :katakana_first_name, format: { with: /\A[ァ-ヶー－]+\z/,message: 'Full-width katakana characters' }
         validates :katakana_surname_name, format: { with: /\A[ァ-ヶー－]+\z/,message: 'Full-width katakana characters' }
         validates :password,format: {with:/\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/, message: 'Include both letters and numbers' 	}
end
