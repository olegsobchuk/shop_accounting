module ApplicationHelper
  def readable_date(date)
    date ? date.strftime('%d/%m/%Y') : nil
  end

  def total_incoming(things)
    things.inject(0) { |sum, thing| sum + thing.sum }
  end

  def total_weight(things)
    things.inject(0) { |sum, thing| sum + thing.weight }
  end
end
