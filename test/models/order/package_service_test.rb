require 'test_helper'

class Order::PackageServiceTest < ActiveSupport::TestCase
  test "generate packages" do
    order = orders(:pine_resin_and_ember)
    service = Order::PackageService.new(order)

    service.generate_packages
    package_items = order.reload.package_items

    quantity_hash = package_items.map{|x| [x.stock_keeping_unit, x.quantity]}.to_h
    assert_equal({
      stock_keeping_units(:ember) => 3,
      stock_keeping_units(:gold_pine_resin) => 5,
      stock_keeping_units(:charcoal_pine_resin) => 2
    }, quantity_hash)
  end

end
