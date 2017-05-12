class Warehouse < ApplicationRecord
  has_many :stock_items
end

# == Schema Information
#
# Table name: warehouses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
