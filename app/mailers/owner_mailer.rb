class OwnerMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  def daily_report_email
    @owner = Owner.last
    @things = Thing.includes(:shop).sold_in(Date.yesterday, Date.yesterday).decorate

    mail(to: @owner.email, subject: 'ShopAccounting: Daily report')
  end
end
