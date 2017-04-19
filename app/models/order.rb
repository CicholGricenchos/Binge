class Order < ApplicationRecord
  has_many :order_items
  has_many :order_payments
  belongs_to :customer
end
