class ListingItemComponent < ApplicationRecord
  belongs_to :listing_item
  belongs_to :stock_keeping_unit
end

# == Schema Information
#
# Table name: listing_item_components
#
#  id                    :integer          not null, primary key
#  listing_item_id       :integer
#  stock_keeping_unit_id :integer
#  quantity              :integer
#
# Indexes
#
#  index_listing_item_components_on_listing_item_id        (listing_item_id)
#  index_listing_item_components_on_stock_keeping_unit_id  (stock_keeping_unit_id)
#
