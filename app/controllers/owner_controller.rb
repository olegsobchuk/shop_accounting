class OwnerController < ApplicationController
  layout 'layouts/owner'

  before_action :require_owner

  def current_owner
    @owner ||= Owner.find_by(id: session[:user_id])&.decorate
  end
  helper_method :current_owner

  private

  def require_owner
    unless current_owner
      reset_session
      redirect_to root_path
    end
  end
end
