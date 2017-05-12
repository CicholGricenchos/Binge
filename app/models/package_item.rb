class PackageItem < ApplicationRecord
  belongs_to :package
  belongs_to :stock_keeping_unit
end

# == Schema Information
#
# Table name: package_items
#
#  id                    :integer          not null, primary key
#  stock_keeping_unit_id :integer
#  package_id            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  quantity              :integer
#
# Indexes
#
#  index_package_items_on_package_id  (package_id)
#
