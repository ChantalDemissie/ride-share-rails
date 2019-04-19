# frozen_string_literal: true

class TripsController < ApplicationController
  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      render :new
    end
  end

  def index
    if params[:passenger_id]
      passenger = Trip.find_by(id: params[:passenger_id])
      if passenger
        @trips = passenger.trips
      else
        head :not_found
        return
      end
    else
      @trips = Trip.all.sort_by(&:id)
    end
  end

  def show
    @trip = Trip.find_by_id(params[:trip_id])
  end

  def edit
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  def update
    begin
      trip_id = params[:id]
      trip = Passenger.find(trip_id)
    rescue
      flash[:error] = "Could not find trip with id: #{params['id']}"
      redirect_to trip_path(trip_id)
      return
    end

    if trip.update(trip_params)
      redirect_to trip_path(trip_id)
    else
      render :new
    end  
  end

  def update_rating
    trip_id = params[:id]
    trip = Trip.find_by(id: trip_id)

    trip.update(rating: params[:rating])
    redirect_to trip_path(trip)
  end

  def destroy
    trip_id = params[:id]

    trip = Trip.find_by(id: trip_id)

    unless trip
      head :not_found
      return
    end

    trip.destroy
    redirect_to trips_path
  end

  def new
    @trip = Trip.new
  end
end

private

def trip_params
  params.require(:trip).permit(
    :driver_id,
    :passenger_id,
    :date,
    :rating,
    :cost
  )
end
