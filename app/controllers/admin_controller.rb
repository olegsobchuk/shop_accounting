class AdminController < ApplicationController
  layout 'layouts/admin'

  before_action :require_admin

  def current_admin
    @owner ||= Admin.find_by(id: session[:user_id])&.decorate
  end
  helper_method :current_admin

  private

  def require_admin
    unless current_admin
      reset_session
      redirect_to root_path
    end
  end
end
