class Address < ApplicationRecord
  belongs_to :customer

  include AddressData
end

# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  name        :string
#  street      :string
#  country     :string
#  province    :string
#  city        :string
#  postal_code :string
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_addresses_on_customer_id  (customer_id)
#
