require "test_helper"

describe DriversController do
  let (:driver) {
    Driver.create name: 'chantal', vin: '12345678901234567'
  }

  describe "index" do
    it "can get the index path" do
      get drivers_path
      must_respond_with :success
    end

    it "works with no drivers" do
      driver.destroy
      get drivers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "can get a valid driver" do
      get drivers_path(driver.id)
      must_respond_with :success
    end
  end

  describe "edit" do
    it "can edit an existing driver" do
      get edit_driver_path(driver.id)
      must_respond_with :success
    end
  end

  describe "update" do
    it "can update an existing driver" do
      driver_hash = {
        driver: {
          name: 'percy',
          vin: '12345678901234568'
        }
      }
      patch driver_path(driver.id), params: driver_hash

      updated_driver = Driver.find_by(name: driver_hash[:driver][:name])
      expect(updated_driver.vin).must_equal driver_hash[:driver][:vin]

      must_respond_with :redirect
      must_redirect_to drivers_path
    end

    it "flashes an error if the driver does not exist" do
      driver_id = 123456789

      patch driver_path(driver_id), params: {}

      must_respond_with :redirect
      expect(flash[:error]).must_equal "Could not find driver with id: #{driver_id}"
    end
  end

  describe "new" do
    it "returns status code 200" do
      get new_driver_path
      must_respond_with :ok
    end
  end

  describe "create" do
    it "can create a new driver" do
      driver_hash = {
        driver: {
          name: "lavender",
          vin: '12345678901234569'
        },
      }

      post drivers_path, params: driver_hash

      new_driver = Driver.find_by(vin: driver_hash[:driver][:vin])
      expect(new_driver.name).must_equal driver_hash[:driver][:name]

      must_respond_with :redirect
      must_redirect_to drivers_path
    end
  end

  describe "destroy" do
    it "removes the driver from the database" do
        delete driver_path(driver.id)

      must_respond_with :redirect
      must_redirect_to drivers_path

      after_driver = Driver.find_by(id: driver.id)
      expect(after_driver).must_be_nil
    end

    it "flashes an error if the driver does not exist" do
      driver_id = 123456789

      expect {
        delete driver_path(driver_id)
      }.wont_change "Driver.count"

      must_respond_with :redirect
      expect(flash[:error]).must_equal "Could not find driver with id: #{driver_id}"
    end
  end
end
