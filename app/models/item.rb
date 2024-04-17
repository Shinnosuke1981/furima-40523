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






end
