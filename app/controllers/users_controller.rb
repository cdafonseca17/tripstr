class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show]
  def show
    @user = User.find_by_username(params[:username])
  end

  def update
    @user = current_user
    @user.photo = params["user"]["photo"]
    @user.update(user_params)
    redirect_to edit_user_registration_path(@user)

  end

  def user_params
    @user = current_user
    params.require("user").permit("photo")
  end
end

