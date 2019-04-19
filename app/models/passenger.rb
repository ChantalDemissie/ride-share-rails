class Passenger < ApplicationRecord

  validates_presence_of :name , :message => 'Must provide name'
  validates_presence_of :phone_num ,:message => 'Must provide phone number'

end
 