class TripsController < ApplicationController

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      render :new
    end
  end

  # def list_passenger
  def index
    @trips = Trip.all.sort_by(&:id)
  end

  def show
    @trips = Trip.find_by_id(params[:id])
  end

  def edit
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)

    # redirect_to tasks_path if @task.nil?

  end

  def update
    trip_id = params[:id]
    trip = Trip.find(task_id)

    trip.update(trip_params)
    # redirect_to task_path(task.id)
  end


  def delete
    trip_id = params[:id]

    trip = Trip.find_by(id: trip_id)

    unless trip
      head :not_found
      return
    end

    trip.destroy

    redirect_to trips_path
    # error validation required
  end

  # add new trip for specific passenger
  def new
    @trip = Trip.new
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