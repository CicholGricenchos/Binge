class ListingItemComponent < ApplicationRecord
  belongs_to :listing_item
  belongs_to :stock_keeping_unit
end
