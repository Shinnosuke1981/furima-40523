class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :shipping_fee_responsibility
  belongs_to :shipping_origin
  belongs_to :estimated_shipping_date

  validates :image, presence: true
  validates :title, presence: true
  validates :item_price, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :shipping_fee_responsibility_id, numericality: { other_than: 1 } 
  validates :comment, presence: true
  validates :item_category_id, numericality: { other_than: 1 } 
  validates :item_condition_id, numericality: { other_than: 1 } 
  validates :shipping_origin_id, numericality: { other_than: 1 } 
  validates :estimated_shipping_date_id, numericality: { other_than: 1 } 
end