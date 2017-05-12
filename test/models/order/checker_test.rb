require 'test_helper'

class Order::CheckerTest < ActiveSupport::TestCase
  test "check item stock" do
    order = orders(:pine_resin_and_ember)
    checker = Order::Checker.new(order)

    assert_empty checker.out_of_stock_items

    item = order.order_items.first
    item.update(quantity: item.listing_item.stock_on_hand + 1)

    checker = Order::Checker.new(order.reload)
    assert_includes checker.out_of_stock_items, item
  end

end
