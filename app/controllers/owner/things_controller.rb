class Owner::ThingsController < OwnerController
  before_action :thing, only: [:show, :edit, :update, :destroy]

  def edit
    render action: :edit, back_path: params[:back_path]
  end

  def update
    back_path = params[:back_path]
    if @thing.update(thing_params)
      redirect_to back_path
    else
      render action: :edit, back_path: back_path
    end
  end

  def destroy
    @thing.destroy
    redirect_to params[:back_path]
  end

  private

  def thing
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:price, :discount)
  end
end
