class ListingItem < ApplicationRecord
  belongs_to :listing
  has_many :listing_item_components
  has_many :stock_keeping_units, through: :listing_item_components
end
