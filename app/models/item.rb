class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :burden
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :state
  has_one_attached :image
  has_one :user_item
  has_many :comments


  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :state_id  
    validates :burden_id 
    validates :area_id
    validates :day_id
    validates :price
    validates :image
   end

   with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :state_id  
    validates :burden_id 
    validates :area_id
    validates :day_id
   end
   validates :price,format: {with:/\A[0-9]+\z/}
   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }

   
end
