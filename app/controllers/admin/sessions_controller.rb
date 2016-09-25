class Admin::SessionsController < ApplicationController
  layout false

  def new
    @admin = Admin.new
  end

  def create
    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to admin_deliveries_path
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
    @user_params ||= params.require(:admin).permit(:email, :password)
  end

  def user
    @user ||= Admin.find_by(email: user_params[:email])
  end
end
