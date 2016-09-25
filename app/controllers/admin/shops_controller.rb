class Admin::ShopsController < AdminController
  def index
    @shops = Shop.page(params[:page])
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
