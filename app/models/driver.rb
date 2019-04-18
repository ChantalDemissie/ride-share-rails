class Driver < ApplicationRecord
  #finds a list of all trips by driver id
  def trips
    #Trip.find_all_by(driver_id: @id)
  end
end
