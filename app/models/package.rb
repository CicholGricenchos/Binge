class Package < ApplicationRecord
  belongs_to :order
  has_many :package_items, autosave: true
end
