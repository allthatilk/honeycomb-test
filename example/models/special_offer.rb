class SpecialOffer
attr_accessor :total_cost

def initialize(order)
  @order = order
end

def percent_discount(qualifier, percent_decimal)
  @order.total_cost >= qualifier ? discount = @order.total_cost - (@order.total_cost * percent_decimal) : 0
end

end
