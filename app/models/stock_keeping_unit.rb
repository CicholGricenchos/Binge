class StockKeepingUnit < ApplicationRecord
  has_and_belongs_to_many :listing_items
  has_many :stock_items

  def stock_on_hand
    stock_items.sum{|x| x.on_hand}
  end
end
