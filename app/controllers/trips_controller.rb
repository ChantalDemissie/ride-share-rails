class TripsController < ApplicationController

  def show
    trip_id = params[:id]
    @trips = Trip.find_by(id: trip_id.to_i)
  end

end 

private

def trip_params
  params.require(:task).permit(
    :id,
    :driver_id,
    :passenger_id,
    :date,
    :rating,
    :cost
  )
  end