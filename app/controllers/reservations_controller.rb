class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @car = Car.find(params[:car_id]) # You need to fetch the specific car for reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = 'Car reserved successfully'
      redirect_to cars_path
    else
      render 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :car_id)
  end
end
