class Assistant::ThingsController < AssistantController
  before_action :thing, only: [:show, :edit, :update]

  def index
    @things = current_assistant.things.existing.page(params[:page]).decorate
  end

  def show
    @thing = @thing.decorate
  end

  def update
    @thing.sold!
    redirect_to assistant_things_path
  end

  private

  def thing
    @thing = current_assistant.things.find(params[:id])
  end
end
