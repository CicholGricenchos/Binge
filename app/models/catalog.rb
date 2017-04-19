class Catalog < ApplicationRecord
  has_many :listings

  has_closure_tree
end
