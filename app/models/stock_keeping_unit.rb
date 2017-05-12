class StockKeepingUnit < ApplicationRecord
  has_and_belongs_to_many :listing_items
  has_many :stock_items

  def stock_on_hand
    stock_items.sum{|x| x.on_hand}
  end
end

# == Schema Information
#
# Table name: stock_keeping_units
#
#  id         :integer          not null, primary key
#  name       :string
#  model      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
