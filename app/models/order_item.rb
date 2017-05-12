class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :listing_item

  validates_presence_of :listing_item, :unit_price, :quantity
end
