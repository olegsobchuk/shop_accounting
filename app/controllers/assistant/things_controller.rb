class Assistant::ThingsController < AssistantController
  before_action :thing, only: [:show, :edit, :update]

  def index
    respond_to do |format|
      format.html do
        @things = things.existing.page(params[:page]).decorate
      end
      format.js do
        @things = things.existing_with_uid(params[:uid]).page(params[:page]).decorate
      end
    end
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

  def things
    @things = current_assistant.things
  end
end
