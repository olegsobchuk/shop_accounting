class OwnerDecorator < UserDecorator
  def full_name
    if first_name.present? || last_name.present?
      "#{first_name} #{last_name}"
    else
      'Профайл'
    end
  end
end
