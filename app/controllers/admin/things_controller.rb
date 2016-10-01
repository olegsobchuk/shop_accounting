class Admin::ThingsController < AdminController
  before_action :thing, only: [:show, :edit, :update]
  before_action :back_path, only: [:show, :update, :create]
  before_action :delivery, only: [:new, :create, :update]

  def new
    @thing = Thing.new
    @shops = Shop.pluck(:id, :name)
  end

  def show
    render action: :show, back_path: back_path
  end

  def create
    @thing = delivery.things.build(thing_params)
    if @thing.valid? && @thing.save
      redirect_to admin_delivery_path(delivery)
    else
      @shops = Shop.pluck(:id, :name)
      render action: :new, back_path: back_path
    end
  end

  def update
    if @thing.update(thing_params)
      redirect_to back_path
    else
      render action: :new, back_path: back_path
    end
  end

  private

  def thing
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:uid, :shop_id, :name, :description, :price)
  end

  def back_path
    back_path = params[:back_path]
  end

  def delivery
    @delivery ||= Delivery.find(params[:delivery_id])
  end
end
