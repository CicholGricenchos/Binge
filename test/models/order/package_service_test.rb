require 'test_helper'

class Order::PackageServiceTest < ActiveSupport::TestCase
  test "generate packages" do
    order = orders(:pine_resin_and_ember)
    service = Order::PackageService.new(order)

    service.generate_packages
    package_items = order.reload.package_items

    component_hash = order.order_items.map do |item|
      item.listing_item.components.map do |sku, qty|
        [sku, qty * item.quantity]
      end
    end.reduce(:concat).to_h

    assert package_items.map{|x| component_hash[x.stock_keeping_unit] == x.quantity }.all?(&:itself)
  end

end
