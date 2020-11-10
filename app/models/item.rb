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

  validates :name,             presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true,numericality: { other_than: 1 } 
  validates :condition_id,     presence: true,numericality: { other_than: 1 } 
  validates :potage_id,        presence: true,numericality: { other_than: 1 } 
  validates :prefecture_id,    presence: true,numericality: { other_than: 1 } 
  validates :delivery_date_id, presence: true,numericality: { other_than: 1 } 
  validates :price,            presence: true


end
