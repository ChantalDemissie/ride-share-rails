class Trip < ApplicationRecord
  has_many :passengers, foreign_key: "passenger_id"
  has_many :drivers, foreign_key: "driver_id"

  validates :driver_id, presence: true
  validates :passenger_id, presence: true
  validates :cost, presence: true
end
