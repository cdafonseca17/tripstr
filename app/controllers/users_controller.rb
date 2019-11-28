class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show]
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.photo = params["user"]["photo"]
    @user.update(user_params)
    redirect_to edit_user_registration_path(@user)
  end

  def user_params
    params.require(:user).permit(:photo)
  end
end

