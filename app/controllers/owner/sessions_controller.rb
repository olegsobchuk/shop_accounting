class Owner::SessionsController < ApplicationController
  layout false

  def new
    @owner = Owner.new
  end

  def create
    if user.try(:authenticate, user_params[:password])
      session[:user_id] = user.id
      redirect_to owner_deliveries_path
    else
      redirect_to root_path, notice: 'Invalid password or username.'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    @user_params ||= params.require(:owner).permit(:email, :password)
  end

  def user
    @user ||= Owner.find_by(email: user_params[:email])
  end
end
