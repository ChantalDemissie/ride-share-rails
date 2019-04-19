require "test_helper"

describe TripsController do
  let(:trip) do
    Trip.create driver_id: 'sample trip', passenger_id:'111-222-3333', 
    date: 'hdjsav', rating: 'fjadbv', cost: '2080'
  end

  describe "index" do
    it 'can get the index path' do
      get trips_path

      must_respond_with :success
    end

    it 'can get the root path' do
      get root_path

      must_respond_with :success
    end
  end

  describe "show" do
    it 'can get a valid trip' do
      get trip_path(trip.id)

      must_respond_with :success
    end

    it 'will redirect for an invalid trip' do
      get trip_path(-1)

      must_respond_with :redirect
    end
  end

  describe "edit" do
    it 'can get the edit page for an existing trip' do
      get edit_trip_path(trip)

      must_respond_with :success
    end

    it 'will respond with redirect when attempting to edit a nonexistant trip' do
      get edit_trip_path(-1)

      must_respond_with :redirect
    end
  end

  describe "update" do
    it 'can update an existing trip' do
      trip = Trip.create!(driver_id: 'sample trip', passenger_id:'111-222-3333', 
      date: 'hdjsav', rating: 'fjadbv', cost: '2080')
      trip_hash = {
        trip: {
          driver_id: "Don't do dishes",
          passenger_id: '098-765-4321',
          date: '098-765-4321',
          rating: 'fjadbv',
          cost: '2080'
        }
      }

      patch trip_path(trip), params: trip_hash

      must_respond_with :redirect
      must_redirect_to trip_path(trip)

      trip.reload
      expect(trip.driver_id).must_equal(trip_data[:trip][:driver_id])
    end

    it 'will redirect to the root page if given an invalid id' do
      get trip_path(-1)

      must_respond_with :redirect
      must_redirect_to trips_path
    end
  end

    describe "update_rating" do
    it 'can update a rating if it does not already exist for a trip' do
      trip = Trip.create!(driver_id: 'sample trip', passenger_id:'111-222-3333', 
      date: 'hdjsav', rating: nil, cost: '2080')
      trip_hash = {
        trip: {
          driver_id: "Don't do dishes",
          passenger_id: '098-765-4321',
          date: '098-765-4321',
          rating: nil,
          cost: '2080'
        }
      }

      patch trip_path(trip), params: (trip_hash[:trip][:rating])

      must_respond_with :redirect
      must_redirect_to trip_path(trip)

      trip.reload
      expect(trip.rating).must_equal(trip_hash[:trip][:rating])
    end

    it 'will redirect to the root page if given an invalid id' do
      get trip_path(-1)

      must_respond_with :redirect
      must_redirect_to trips_path
    end
  end


  describe "new" do
    it 'can get the new trip page' do
      get new_trip_path

      must_respond_with :success
    end
  end

  describe "create" do
    it 'can create a new trip' do
      trip_hash = {
        trip: {
          driver_id: "Don't do dishes",
          passenger_id: '098-765-4321',
          date: '098-765-4321',
          rating: 'fjadbv',
          cost: '2080'
        }
      }

      expect do
        post trips_path, params: trip_hash
      end.must_change 'Trip.count', 1

      new_trip = Trip.find_by(name: trip_hash[:trip][:driver_id])
      expect(new_trip.passenger_id).must_equal passenger_hash[:trip][:passenger_id]

      must_respond_with :redirect
      must_redirect_to trip_path(new_trip.id)
    end
  end

  describe "destroy" do
    it 'removes the trip from the database' do
      trip = Trip.create!(driver_id: 'sample trip', passenger_id:'111-222-3333', 
      date: 'hdjsav', rating: 'fjadbv', cost: '2080')

      expect do
        delete trip_path(trip)
      end.must_change 'Trip.count', -1

      must_respond_with :redirect
      must_redirect_to trips_path

      after_trip = Trip.find_by(id: trip.id)
      expect(after_trip).must_be_nil
    end

    it 'returns a 404 if the trip does not exist' do
      trip_id = 123_456

      expect(Trip.find_by(id: trip_id)).must_be_nil

      expect do
        delete trip_path(passenger_id)
      end.wont_change 'Trip.count'

      must_respond_with :not_found
    end
  end
end
