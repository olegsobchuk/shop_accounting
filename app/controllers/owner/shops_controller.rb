class Owner::ShopsController < OwnerController
  before_action :shop, only: [:edit, :update, :show]

  def index
    @shops = Shop.page(params[:page])
  end

  def new
    @shop = Shop.new
  end

  def show
    @things = @shop.things
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.valid? && @shop.save
      redirect_to owner_shops_path
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @shop.update(shop_params)
      redirect_to owner_shops_path
    else
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit!
  end

  def shop
    @shop = Shop.find_by(id: params[:id])
  end
end
