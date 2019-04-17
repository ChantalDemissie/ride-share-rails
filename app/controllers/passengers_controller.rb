# frozen_string_literal: true

class PassengersController < ApplicationController
  # def add_passenger
  def create
    # error validation required
  end

  # def list_passenger
  def index
    @passengers = Passenger.all.sort_by(&:id)
  end

  # def show_passenger
  def show
    passenger_id = params[:id]
    @passenger = Passenger.find_by(id: passenger_id)
    # redirect_to tasks_path unless @task
  end

  def edit; end

  def delete
    # error validation required
  end

  # add new trip for specific passenger
  def new
    # select driver automatically
    # starts with no rating
  end
end
