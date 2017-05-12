class Order::CheckoutService
  Response = Class.new GeneralResponse

  def initialize order
    @order = order
  end

  def add_item(listing_item_id: nil, quantity: nil)
    raise if listing_item_id.nil? || quantity.nil?
    listing_item = ListingItem.find_by_id listing_item_id

    return Response.new(:cannot_find_listing_item) if listing_item.nil?

    if current_item = @order.order_items.find_by_listing_item_id(listing_item.id)
      current_item.update!(quantity: current_item.quantity + quantity.to_i)
    else
      @order.order_items.create!(listing_item: listing_item, quantity: quantity, unit_price: listing_item.price)
    end

    recalculate_total
    return Response.new(:success)
  end

  def update_item(order_item_id: nil, quantity: nil)
    raise if order_item_id.nil? || quantity.nil?
    item = @order.order_items.find_by_id(order_item_id)

    return Response.new(:cannot_find_order_item) if item.nil?

    if quantity.to_i == 0
      item.destroy!
    else
      item.update!(quantity: quantity)
    end

    recalculate_total
    return Response.new(:success)
  end

  def recalculate_total
    @order.reload
    calc = Order::TotalCalculator.new(@order)
    @order.update!(item_total: calc.item_total, shipping_cost: calc.shipping_cost, total: calc.total)
  end
end