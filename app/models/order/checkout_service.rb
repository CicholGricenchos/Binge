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

  def set_shipping_address(address_id: nil)
    raise if address_id.nil?

    address = @order.customer.addresses.find_by_id(address_id)
    return Response.new(:cannot_find_address) if address.nil?

    shipping_address = @order.shipping_address || @order.build_shipping_address
    shipping_address.update(address.to_address_data)

    return Response.new(:success)
  end

  def perform_payment
    payment_service = Order::PaymentService.new(@order)
    response = payment_service.perform

    if response.success?
      Order::PackageService.new(@order).generate_packages
    end

    response
  end

end