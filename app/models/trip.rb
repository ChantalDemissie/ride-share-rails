class Trip < ApplicationRecord
  has_many :passengers, foreign_key: "passenger_id"
  has_many :drivers, foreign_key: "driver_id"
end
