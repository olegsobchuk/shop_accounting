class AssistantController < ApplicationController
  layout 'layouts/assistant'

  before_action :require_assistant

  def current_assistant
    @assistant ||= Assistant.find_by(id: session[:user_id])&.decorate
  end
  helper_method :current_assistant

  private

  def require_assistant
    unless current_assistant
      reset_session
      redirect_to root_path
    end
  end
end
