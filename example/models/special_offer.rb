class SpecialOffer
attr_accessor :total_discount

  def initialize(order)
    @order = order
    @cost = 0
    @total_discount = 0
  end

  def calculate_discount(qualifier1, cost_deduction, qualifier2, percent_decimal)
    @cost += express_bulk_discount(qualifier1, cost_deduction)
    @cost -= percent_discount(qualifier2, percent_decimal)
    @total_discount += @order.total_cost - @cost
  end

  private

  def express_bulk_discount(qualifier, cost_deduction)
    delivery_type = @order.items.map { |(_, delivery)| delivery.name.to_s }
    express_count = delivery_type.count("express")
    express_count > qualifier ? @order.total_cost - (cost_deduction * express_count) : @order.total_cost
  end

  def percent_discount(qualifier, percent_decimal)
    @order.total_cost >= qualifier ? @cost - (@cost * percent_decimal) : 0
  end
end
