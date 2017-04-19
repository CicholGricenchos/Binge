class ListingItem < ApplicationRecord
  belongs_to :listing
  has_and_belongs_to_many :stock_keeping_units
end
