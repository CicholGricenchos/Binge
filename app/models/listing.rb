class Listing < ApplicationRecord
  has_many :listing_items

  include Elasticsearch::Model
  include Listing::Searchable
end

# == Schema Information
#
# Table name: listings
#
#  id           :integer          not null, primary key
#  name         :string
#  introduction :text
#  catalog_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_listings_on_catalog_id  (catalog_id)
#
