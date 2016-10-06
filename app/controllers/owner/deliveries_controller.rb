class Owner::DeliveriesController < OwnerController
  before_action :delivery, only: [:edit, :update, :show]

  def index
    @deliveries = Delivery.page(params[:page])
  end

  def new
    @delivery = Delivery.new
  end

  def show
    @things = @delivery.things
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.valid? && @delivery.save
      redirect_to owner_deliveries_path
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @delivery.update(delivery_params)
      redirect_to owner_deliveries_path
    else
      render :new
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit!
  end

  def delivery
    @delivery = Delivery.find_by(id: params[:id])
  end
end
