class Order::PackageService
  def initialize order
    @order = order
  end

  def generate_packages
    Package.transaction do
      package = @order.packages.new
      @order.order_items.each do |item|
        item.listing_item.components.each do |sku, qty|
          package.package_items.new(stock_keeping_unit: sku, quantity: qty * item.quantity)
        end
      end
      package.save!
    end
  end
end