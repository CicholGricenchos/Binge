class StockItem < ApplicationRecord
  belongs_to :stock_keeping_unit
  belongs_to :warehouse
end
