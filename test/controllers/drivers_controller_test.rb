require "test_helper"

describe DriversController do
      describe "index" do
        it "can get the index path" do
          get index_path
          must_respond_with :success
        end
    end

    it "works with no drivers" do
     @driver.destroy
     get drivers_path
     must_respond_with :ok
   end
 end
  end

    describe "show" do
      it "can get a valid driver" do
        get drivers_path(driver.id)
        must_respond_with :success
      end
  end

    describe "edit" do
      it "can get to the edit page for an existing driver" do
        get edit_driver_path(driver.id)
        must_respond_with :success
      end
  end

    describe "update" do
    it "works for a driver that exists" do
      get driver_path(@driver.id)

      must_respond_with :ok
    end

  
