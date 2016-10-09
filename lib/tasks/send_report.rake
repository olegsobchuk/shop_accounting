namespace :send_report do
  desc 'Send daily report'
  task daily: :enironment do
    OwnerMailer.daily_report_email.deliver_now
  end
end
