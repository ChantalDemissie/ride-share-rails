require "test_helper"

describe PassengersController do
  let(:passenger) do
    Passenger.create name: 'sample task', phone_num: '111-222-3333'
  end

  describe "index" do
    it 'can get the index path' do
      get passengers_path

      must_respond_with :success
    end

    it 'can get the root path' do
      get root_path

      must_respond_with :success
    end
  end

  describe "show" do
    it 'can get a valid passenger' do
      get passenger_path(passenger.id)

      must_respond_with :success
    end

    it 'will redirect for an invalid passenger' do
      get passenger_path(-1)

      must_respond_with :redirect
    end
  end

  describe "edit" do
    it 'can get the edit page for an existing passenger' do
      get edit_passenger_path(passenger)

      must_respond_with :success
    end

    it 'will respond with redirect when attempting to edit a nonexistant passenger' do
      get edit_passenger_path(-1)

      must_respond_with :redirect
    end
  end

  describe "update" do
    it 'can update an existing passenger' do
      passenger = Passenger.create!(name: 'Do dishes', phone_num: '123-456-7890')
      passenger_data = {
        passenger: {
          name: "Don't do dishes",
          phone_num: '098-765-4321'
        }
      }

      patch passenger_path(passenger), params: passenger_data

      must_respond_with :redirect
      must_redirect_to passenger_path(passenger)

      passenger.reload
      expect(passenger.name).must_equal(passenger_data[:passenger][:name])
    end

    it 'will redirect to the root page if given an invalid id' do
      get passenger_path(-1)

      must_respond_with :redirect
      must_redirect_to passengers_path
    end
  end

  describe "new" do
    it 'can get the new passenger page' do
      get new_passenger_path

      must_respond_with :success
    end
  end

  describe "create" do
    it 'can create a new passenger' do
      passenger_hash = {
        passenger: {
          name: 'New Passenger',
          phone_num: '123-234-5443',
        }
      }
      expect do
        post passengers_path, params: passenger_hash
      end.must_change 'Passenger.count', 1

      new_passenger = Passenger.find_by(name: passenger_hash[:passenger][:name])
      expect(new_passenger.phone_num).must_equal passenger_hash[:passenger][:phone_num]

      must_respond_with :redirect
      must_redirect_to passenger_path(new_passenger.id)
    end
  end

  describe "destroy" do
    it 'removes the passenger from the database' do
      passenger = Passenger.create!(name: 'Test Passenger', phone_num: '111-222-3333')

      expect do
        delete passenger_path(passenger)
      end.must_change 'Passenger.count', -1

      must_respond_with :redirect
      must_redirect_to passengers_path

      after_passenger = Passenger.find_by(id: passenger.id)
      expect(after_passenger).must_be_nil
    end

    it 'returns a 404 if the passenger does not exist' do
      passenger_id = 123_456

      expect(Passenger.find_by(id: passenger_id)).must_be_nil

      expect do
        delete passenger_path(passenger_id)
      end.wont_change 'Passenger.count'

      must_respond_with :not_found
    end
  end
end
