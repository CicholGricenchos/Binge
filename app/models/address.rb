class Address < ApplicationRecord
  belongs_to :customer

  include AddressData
end
