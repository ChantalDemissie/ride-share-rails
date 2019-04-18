class DriversController < ApplicationController

  def new
  end

  def create
    #TODO: validate 17-digit VIN
    @driver = Driver.new(
      name: params[:driver][:name],
      vin: params[:driver][:vin]
    )
    @driver.save
    #error validation required
    redirect_to drivers_path
  end

  def index
     @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  #edit a driver
  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])

    begin
      result = @driver.update({
        name: params[:driver][:name],
        vin: params[:driver][:vin]
      })
      redirect_to drivers_path
    rescue
      render :new
      return
    end
  end

  #delete driver
  def destroy
    driver = Driver.find(params[:id])
    driver.destroy
    redirect_to drivers_path
  end

end 
