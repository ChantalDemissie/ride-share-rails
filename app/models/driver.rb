class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true, length: {is: 17}

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

  validates_presence_of :name , :message => 'Must provide name'
  validates_presence_of :vin ,:message => 'Must provide vin'


end
