class ThingDecorator < ApplicationDecorator
  def sum
    currency_discount = (price * discount) / 100
    price - currency_discount
  end
end
