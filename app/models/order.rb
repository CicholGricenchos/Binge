class Order < ApplicationRecord
  has_many :order_items
  has_many :order_payments
  belongs_to :customer, optional: true
  has_many :packages
  has_many :package_items, through: :packages

  has_one :shipping_address, class_name: 'OrderAddress::Shipping'
  has_one :billing_address, class_name: 'OrderAddress::Billing'
end
