class UsersController < ApplicationController
  layout 'application'

  def new
    @user = User.new
  end

  def create
    username = params[:user][:name]
    pp username

    if User.exists?(name: username)
      flash[:alert] = "The username '#{username}' is already in use. Please choose a different username."
      @user = User.new # Initialize @user to avoid the 'nil' error
      redirect_to signup_path
    else
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'User successfully created, now please log in'
        redirect_to login_path
      else
        render 'new'
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
