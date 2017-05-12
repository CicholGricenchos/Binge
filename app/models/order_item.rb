class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :listing_item

  validates_presence_of :listing_item, :unit_price, :quantity
end

# == Schema Information
#
# Table name: order_items
#
#  id              :integer          not null, primary key
#  order_id        :integer
#  listing_item_id :integer
#  quantity        :integer
#  unit_price      :decimal(8, 2)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_order_items_on_order_id  (order_id)
#
