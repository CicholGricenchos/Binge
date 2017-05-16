class Order::PackageService
  def initialize order
    @order = order
  end

  def generate_packages
    Package.transaction do
      component_hash = @order.order_items.map{|item| item.listing_item.components.map{|sku, qty| [sku, qty * item.quantity]}}.inject(:concat).group_by(&:first)

      sku_list = component_hash.map do |sku, components|
        [sku, components.reduce(0){|acc, x| acc += x[1]}]
      end

      packages = split_into_packages sku_list
      packages.map(&:save!)
    end
  end

  def split_into_packages sku_list
    package = @order.packages.new
    sku_list.map do |sku, qty|
      package.package_items.new(stock_keeping_unit: sku, quantity: qty)
    end
    [package]
  end
end