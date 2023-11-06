class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @car = Car.find(params[:car_id])
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @car = Car.find(@reservation.car_id)

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
