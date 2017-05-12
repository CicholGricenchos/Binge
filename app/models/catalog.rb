class Catalog < ApplicationRecord
  has_many :listings

  has_closure_tree
end

# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  name       :string
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_catalogs_on_parent_id  (parent_id)
#
