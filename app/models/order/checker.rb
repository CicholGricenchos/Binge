class Order::Checker
  def initialize order
    @order = order
  end

  def out_of_stock_items
    @order.order_items.select{|item| item.quantity > item.listing_item.stock_on_hand }
  end

end