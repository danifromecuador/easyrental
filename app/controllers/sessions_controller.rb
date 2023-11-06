class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])

    if user
      redirect_to cars_path
    else
      flash[:alert] = "The username that you entered doesn't exist in our database"
      redirect_to login_path
    end
  end
end
