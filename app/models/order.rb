class Order < ApplicationRecord
  has_many :order_items
  has_many :order_payments
  belongs_to :customer, optional: true
  has_many :packages
  has_many :package_items, through: :packages

  has_one :shipping_address, class_name: 'OrderAddress::Shipping'
  has_one :billing_address, class_name: 'OrderAddress::Billing'
end

# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  item_total    :decimal(8, 2)
#  shipping_cost :decimal(8, 2)
#  total         :decimal(8, 2)
#  customer_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_orders_on_customer_id  (customer_id)
#
