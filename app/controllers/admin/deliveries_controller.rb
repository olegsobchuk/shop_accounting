class Admin::DeliveriesController < AdminController
  before_action :delivery, only: [:edit, :update, :show]

  def index
    @deliveries = Delivery.by_create.page(params[:page])
  end

  def show
    @things = @delivery.things.page(params[:page])
  end

  def update
    if @delivery.update(delivery_params)
      redirect_to admin_deliveries_path
    else
      render :new
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:arrival)
  end

  def delivery
    @delivery = Delivery.find_by(id: params[:id])
  end
end
