class RidesController < ApplicationController

  def create
    ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    flash[:notice] = "#{ride.take_ride}"
    redirect_to user_path(User.find_by(id: ride.user_id))
  end

end
