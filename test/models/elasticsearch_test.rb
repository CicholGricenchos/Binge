require 'test_helper'

class ElasticsearchTest < ActiveSupport::TestCase
  test "index on create and update" do
    Listing.__elasticsearch__.recreate_index

    listing = Listing.create(name: 'humanity')
    assert_equal listing.name, Listing.__elasticsearch__.get_record(listing.id)["_source"]["name"]

    listing.update(name: 'ember')
    assert_equal listing.name, Listing.__elasticsearch__.get_record(listing.id)["_source"]["name"]
  end

  test 'delete index on destroy' do
    Listing.__elasticsearch__.recreate_index

    listing = Listing.create(name: 'humanity')
    assert Listing.__elasticsearch__.record_exists? listing.id

    listing.destroy
    assert_not Listing.__elasticsearch__.record_exists? listing.id
  end
end
