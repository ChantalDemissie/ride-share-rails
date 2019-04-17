# frozen_string_literal: true

class PassengersController < ApplicationController
  def create
    @passenger = Passenger.new(task_params)
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
    @trips = Trip.find_by(id: passenger_id)
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

    passenger.update(task_params)
    # redirect_to task_path(task.id)
  end


  def delete
    # error validation required
  end

  # add new trip for specific passenger
  def new
    @passenger = Passenger.new
  end
end

private

def task_params
    params.require(:task).permit(
      :name,
      :phone_num
    )
  end
