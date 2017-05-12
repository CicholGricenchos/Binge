class ListingItem < ApplicationRecord
  belongs_to :listing
  has_many :listing_item_components
  has_many :stock_keeping_units, through: :listing_item_components

  def components
    listing_item_components.map do |x|
      [x.stock_keeping_unit, x.quantity]
    end
  end

  def stock_on_hand
    components.map do |sku, qty|
      sku.stock_on_hand / qty
    end.min
  end
end

# == Schema Information
#
# Table name: listing_items
#
#  id         :integer          not null, primary key
#  name       :string
#  listing_id :integer
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_listing_items_on_listing_id  (listing_id)
#
