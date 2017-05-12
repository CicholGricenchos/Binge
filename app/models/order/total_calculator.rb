class Order::TotalCalculator
  def initialize order
    @order = order
  end

  def item_total
    @order.order_items.sum{|x| x.unit_price * x.quantity}
  end

  def shipping_cost
    5
  end

  def total
    item_total + shipping_cost
  end
end