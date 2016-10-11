class OwnerDecorator < UserDecorator
  def full_name
    if first_name.empty? || last_name.empty?
      'Профайл'
    else
      "#{first_name} #{last_name}"
    end
  end
end
