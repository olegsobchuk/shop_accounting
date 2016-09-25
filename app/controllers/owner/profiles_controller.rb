class Owner::ProfilesController < OwnerController
  def update
    if current_owner.update(owner_params)
      redirect_to owner_deliveries_path
    else
      render :edit
    end
  end

  private

  def owner_params
    params.require(:owner).permit!
  end
end
