class Admin::ProfilesController < AdminController
  def update
    if current_admin.update(admin_params)
      redirect_to admin_deliveries_path
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit!
  end
end
