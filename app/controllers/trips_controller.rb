class TripsController < ApplicationController
  def show
    passenger_id = params[:id]
    @passenger = Passenger.find_by(id: passenger_id)
    # redirect_to tasks_path unless @task
  end

end
