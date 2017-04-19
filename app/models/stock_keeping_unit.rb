class StockKeepingUnit < ApplicationRecord
  has_and_belongs_to_many :listing_items
  has_many :stock_items
end
