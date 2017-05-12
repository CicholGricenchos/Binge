class OrderAddress::Billing < OrderAddress

end

# == Schema Information
#
# Table name: order_addresses
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  name        :string
#  street      :string
#  country     :string
#  province    :string
#  city        :string
#  postal_code :string
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  type        :string
#
# Indexes
#
#  index_order_addresses_on_order_id  (order_id)
#
