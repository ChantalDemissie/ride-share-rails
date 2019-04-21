# frozen_string_literal: true

class TripsController < ApplicationController

  def new
    @trip = Trip.new

    # Pick a random driver.
    @driver_id = Driver.all.sample.id
  end

  def create
    @trip = Trip.new(
      driver_id: params[:trip][:driver],
      passenger_id: params[:trip][:passenger],
      date: params[:trip][:date],
      cost: (params[:trip][:cost].to_f * 100.0).to_i,
      rating: nil
    )

    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      render :new
    end
  end

  def index
      @trips = Trip.all.sort_by(&:id)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
    redirect_to trip_path if @trip.nil?
  end

  def update
    begin
      trip_id = params[:id]
      trip = Trip.find(trip_id)
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
    begin
      trip_id = params[:id]
      @trip = Trip.find(trip_id)
    rescue
      flash[:error] = "Could not find trip with id: #{params['id']}"
      redirect_to trip_path(trip_id)
      return
    end

    rating = params[:rating]
    @trip.update(rating: rating)
    redirect_to trip_path(trip_id)
  end

  def destroy
    begin
      trip = Trip.find(params[:id])
    rescue
      flash[:error] = "Could not find trip with id: #{params['id']}"
      redirect_to trips_path
      return
    end
    trip.destroy
    redirect_to trips_path
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
