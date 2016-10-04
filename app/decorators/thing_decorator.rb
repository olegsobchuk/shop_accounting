class ThingDecorator < ApplicationDecorator
  def sum
    disc = discount.to_i > 0 ? discount : 0.0000000000000000001
    currency_discount = (price * disc) / 100
    (price - currency_discount).round(2)
  end
end
