class PackageItem < ApplicationRecord
  belongs_to :package
  belongs_to :stock_keeping_unit
end
