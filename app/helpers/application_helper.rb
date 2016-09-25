module ApplicationHelper
  def readable_date(date)
    date ? date.strftime('%d/%m/%Y') : nil
  end
end
