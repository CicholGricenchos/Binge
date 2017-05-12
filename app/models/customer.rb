class Customer < ApplicationRecord
  has_many :orders
  has_many :addresses
end

# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
