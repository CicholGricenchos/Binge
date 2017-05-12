class Listing < ApplicationRecord
  has_many :listing_items

  include Elasticsearch::Model
  include Listing::Searchable
end
