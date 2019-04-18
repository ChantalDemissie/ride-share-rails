# frozen_string_literal: true

class PassengersController < ApplicationController
  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passenger_path(@passenger.id)
    else
      render :new
    end
  end

  # def list_passenger
  def index
    @passengers = Passenger.all.sort_by(&:id)
  end

  # def show_passenger
  def show
    passenger_id = params[:id]
    @trips = Trip.where(passenger_id: passenger_id.to_i)
    @earnings = @trips.map { |trip| trip.cost }.sum 
    # redirect_to tasks_path unless @task
  end

  def edit
    passenger_id = params[:id]
    @passenger = Passenger.find_by(id: passenger_id)

    # redirect_to tasks_path if @task.nil?

  end

  def update
    passenger_id = params[:id]
    passenger = Passenger.find(task_id)

    passenger.update(passenger_params)
    # redirect_to task_path(task.id)
  end


  def delete
    passenger_id = params[:id]

    passenger = Passenger.find_by(id: passenger_id)

    unless passenger
      head :not_found
      return
    end

    passenger.destroy

    redirect_to passengers_path
    # error validation required
  end

  # add new trip for specific passenger
  def new
    @passenger = Passenger.new
  end
  
end

private

def passenger_params
    params.require(:task).permit(
      :name,
      :phone_num
    )
  end
