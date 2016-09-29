class Assistant::ThingsController < AssistantController
  before_action :thing, only: [:show, :edit, :update]

  def show
    @thing = @thing.decorate
  end

  def index
    @things = current_assistant.can_sell.page(params[:page]).decorate
  end

  def update
    @thing.sold!
    redirect_to assistant_things_path
  end

  private

  def thing
    @thing = Thing.find(params[:id])
  end
end
