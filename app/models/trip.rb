class Trip < ApplicationRecord
  has_many :passengers, foreign_key: "passenger_id"
  has_many :drivers, foreign_key: "driver_id"

  validates :name, presence: true
  validates :phone_num, presence: true
end
