class Package < ApplicationRecord
  belongs_to :order
  has_many :package_items, autosave: true
end

# == Schema Information
#
# Table name: packages
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_packages_on_order_id  (order_id)
#
