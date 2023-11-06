class UsersController < ApplicationController
  layout 'application'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.name == 'admin'
      flash[:alert] = 'You cannot create an admin user. Try again with a different name'
      redirect_to root_path
    elsif @user.save
      flash[:notice] = 'User successfully created. Please log in'
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
