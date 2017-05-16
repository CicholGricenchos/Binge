require 'test_helper'

class Order::CheckoutServiceTest < ActiveSupport::TestCase
  test "add item" do
    order = Order.create
    service = Order::CheckoutService.new(order)
    response = service.add_item(listing_item_id: 'NaN', quantity: 1)
    assert_not response.success?
    assert_equal :cannot_find_listing_item, response.status

    response = service.add_item(listing_item_id: listing_items(:pine_resin_pack).id, quantity: 2)
    assert response.success?
    added_item = order.order_items.find_by(listing_item: listing_items(:pine_resin_pack))
    assert added_item.present?
    assert_equal 2, added_item.quantity

    assert_equal 2 * listing_items(:pine_resin_pack).price, order.item_total

    response = service.add_item(listing_item_id: listing_items(:pine_resin_pack).id, quantity: 3)
    assert response.success?
    added_item = order.order_items.find_by(listing_item: listing_items(:pine_resin_pack))
    assert_equal 5, added_item.quantity

    assert_equal 5 * listing_items(:pine_resin_pack).price, order.item_total
  end

  test "update item" do
    order = Order.create
    service = Order::CheckoutService.new(order)

    response = service.add_item(listing_item_id: listing_items(:pine_resin_pack).id, quantity: 2)
    assert response.success?

    added_item = order.order_items.find_by(listing_item: listing_items(:pine_resin_pack))

    response = service.update_item(order_item_id: added_item.id, quantity: 5)
    assert_equal 5, added_item.reload.quantity

    assert_equal 5 * listing_items(:pine_resin_pack).price, order.item_total

    response = service.update_item(order_item_id: added_item.id, quantity: 0)
    assert_raise ActiveRecord::RecordNotFound do
      added_item.reload
    end

    assert_equal 0, order.item_total
  end

  test "set shipping address" do
    order = Order.create(customer: customers(:ashen_one))
    service = Order::CheckoutService.new(order)

    response = service.set_shipping_address(address_id: 0)
    assert_not response.success?

    response = service.set_shipping_address(address_id: addresses(:gz).id)
    assert response.success?

    assert_equal addresses(:gz).to_address_data, order.reload.shipping_address.to_address_data
  end
end
