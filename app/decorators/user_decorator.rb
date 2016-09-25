class UserDecorator < ApplicationDecorator
  # Use `object` or `o` to access object
  # Use `helper` or `h` to access helpers
  #
  # Example:
  #
  # def created_at
  #   h.content_tag :span, o.created_at.to_s(:long)
  # end

  def full_name
    "#{first_name} #{last_name}"
  end
end
