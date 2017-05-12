class OrderPayment < ApplicationRecord
  belongs_to :order
end

# == Schema Information
#
# Table name: order_payments
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  success     :boolean
#  description :string
#  amount      :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_order_payments_on_order_id  (order_id)
#
