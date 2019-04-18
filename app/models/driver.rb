class Driver < ApplicationRecord
  #finds a list of all trips by driver id
  def trips
    Trip.where("driver_id = #{self.id}")
  end

  def average_rating
    trips = self.trips
    if trips.empty?
      return 0
    end
    return trips.sum(:rating) / trips.length
  end

  def total_earnings
    total_earnings = 0
    self.trips.each do |trip|
      earnings = (trip.cost / 100.0 - 1.65) * 0.8
      total_earnings += earnings
    end
    return total_earnings.round(2)
  end

end
