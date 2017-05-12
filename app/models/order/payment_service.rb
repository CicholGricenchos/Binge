class Order::PaymentService
  Response = Class.new GeneralResponse

  def initialize order
    @order = order
  end

  def perform

    Response.new(:success)
  end
end