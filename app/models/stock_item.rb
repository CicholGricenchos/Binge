class StockItem < ApplicationRecord
  belongs_to :stock_keeping_unit
  belongs_to :warehouse
end

# == Schema Information
#
# Table name: stock_items
#
#  id                    :integer          not null, primary key
#  warehouse_id          :integer
#  stock_keeping_unit_id :integer
#  on_hand               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_stock_items_on_stock_keeping_unit_id_and_warehouse_id  (stock_keeping_unit_id,warehouse_id)
#
