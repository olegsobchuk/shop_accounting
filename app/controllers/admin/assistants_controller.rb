class Admin::AssistantsController < AdminController
  before_action :assistant, only: [:edit, :update, :show, :destroy]

  def index
    @assistants = Assistant.page(params[:page])
  end

  def new
    @assistant = Assistant.new
  end

  def edit
    render :new
  end

  def update
    if @assistant.update(assistant_params)
      redirect_to admin_assistants_path
    else
      render :new
    end
  end

  def create
    @assistant = Assistant.new(assistant_params)
    if @assistant.valid? && @assistant.save
      redirect_to admin_assistants_path
    else
      render :new
    end
  end

  def destroy
    assistant.destroy
    redirect_to admin_assistants_path
  end

  private

  def assistant_params
    params.require(:assistant).permit!
  end

  def assistant
    @assistant = Assistant.find_by(id: params[:id])
  end
end
