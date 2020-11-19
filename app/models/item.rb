class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :potage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_date

  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
  validates :image
  validates :name            
  validates :description      
  validates :category_id,      numericality: { other_than: 1 } 
  validates :condition_id,     numericality: { other_than: 1 } 
  validates :potage_id,        numericality: { other_than: 1 } 
  validates :prefecture_id,    numericality: { other_than: 1 } 
  validates :delivery_date_id, numericality: { other_than: 1 } 
  validates :price,            numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
  end
  validates :price, format: {with: /\A[0-9]+\z/}

end
