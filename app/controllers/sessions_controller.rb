class SessionsController < ApplicationController
  def new; end

  def create
    username = params[:session][:name]
    user = User.find_by(name: params[:session][:name])

    if user
      if username == 'admin'
        flash[:alert] = 'You cannot log in as admin. Try again'
        redirect_to login_path
      else
        session[:user_id] = user.id
        redirect_to cars_path
      end
    else
      flash[:alert] = "The username that you entered doesn't exist in our database. Try again or create a new user."
      redirect_to root_path
    end
  end
end
