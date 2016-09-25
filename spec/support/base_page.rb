class BasePage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def wait_js_execution
    loop until page.evaluate_script('jQuery.active').zero?
  end

  def click_submit(value = nil)
    value_option = "[value='#{value}']" if value
    find("input[type='submit']#{value_option}").click
  end
end
