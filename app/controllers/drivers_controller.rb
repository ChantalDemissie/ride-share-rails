class DriversController < ApplicationController

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(
      name: params[:driver][:name],
      vin: params[:driver][:vin]
    )
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def index
     @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    begin
      @driver = Driver.find(params[:id])
    rescue
      flash[:error] = "Could not find driver with id: #{params['id']}"
      redirect_to drivers_path
      return
    end
    result = @driver.update({
        name: params[:driver][:name],
        vin: params[:driver][:vin]
    })
    if result
      redirect_to drivers_path
    else
      render :new
    end
  end

  def destroy
    begin
      driver = Driver.find(params[:id])
    rescue
      flash[:error] = "Could not find driver with id: #{params['id']}"
      redirect_to drivers_path
      return
    end
    driver.destroy
    redirect_to drivers_path
  end

end
