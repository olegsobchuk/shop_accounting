class Owner::AssistantsController < OwnerController
  before_action :assistant, only: :show

  def index
    @assistants = Assistant.page(params[:page])
  end

  private

  def assistant
    @assistant = Assistant.find_by(id: params[:id])
  end
end
