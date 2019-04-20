require "test_helper"

describe TripsController do
  let(:trip) do
    Trip.create driver_id: 'sample trip', passenger_id: '111-222-3333', 
    date: 'hdjsav', rating: 'fjadbv', cost: '2080'
  end

  # describe "index" do
    # it 'can get the index path' do
    #   get trips_path

    #   must_respond_with :success
    # end

  #   it "works with no passengers" do
  #     trip.destroy
  #     get trips_path
  #     must_respond_with :success
  #   end
  # end

  # describe "show" do
    # it 'can get a valid trip' do
    #   get trips_path(trip.id)

    #   must_respond_with :success
    # end
  # end

  # describe "edit" do
    # it 'can get the edit page for an existing trip' do
    #   get edit_trip_path(trip)

    #   must_respond_with :success
    # end
  # end

  # describe "update" do
  #   it 'can update an existing trip' do
  #     trip = Trip.create!(driver_id: 'Do dishes', passenger_id: '123-456-7890', date: '2736', rating: 4, cost: 432)
  #     trip_hash = {
  #       trip: {
  #         driver_id: 345,
  #         passenger_id: 123,
  #         date: '098-765-4321',
  #         rating: 3,
  #         cost: '2080'
  #       }
  #     }
  #     patch trip_path(trip), params: trip_hash

  #     must_respond_with :redirect
  #     must_redirect_to trip_path(trip)

  #     trip.reload
  #     expect(trip.driver_id).must_equal(trip_hash[:trip][:driver_id])
  #   end

    # it "flashes an error if the passenger does not exist" do
    #   trip_id = 123456789

    #   patch trip_path(trip_id), params: {}

    #   must_respond_with :redirect
    #   expect(flash[:error]).must_equal "Could not find trip with id: #{trip_id}"
    # end
  # end

  describe "update_rating" do
    it 'can update a rating if it does not already exist for a trip' do
      trip = Trip.create!(driver_id: 'Do dishes', passenger_id: '123-456-7890', date: '2736', rating: nil, cost: 432)
      trip_hash = {
        trip: {
          driver_id: "Don't do dishes",
          passenger_id: '098-765-4321',
          date: '098-765-4321',
          rating: 5,
          cost: '2080'
        }
      }
      patch trip_path(trip), params: trip_hash

      must_respond_with :redirect
      must_redirect_to trip_path(trip)

      trip.reload
      expect(trip.rating).must_equal(trip_hash[:trip][:rating])
    end
  end


  # describe "new" do
  #   it 'can get the new trip page' do
  #     get new_trip_path

  #     must_respond_with :success
  #   end
  # end

  # describe "create" do
  #   it 'can create a new trip' do
  #     trip_hash = {
  #       trip: {
  #         driver_id: 384,
  #         passenger_id: 364,
  #         date: 'July 13 1987',
  #         rating: 'fjadbv',
  #         cost: '2080',
  #       }
  #     }

  #     expect do
  #       post trips_path, params: trip_hash
  #     end.must_change 'Trip.count', 1

  #     new_trip = Trip.find_by(driver_id: trip_hash[:trip][:driver_id])
  #     expect(new_trip.passenger_id).must_equal trip_hash[:trip][:passenger_id]

  #     must_respond_with :redirect
  #     must_redirect_to trip_path(new_trip.id)
  #   end
  # end

  # describe "destroy" do
    # it 'removes the trip from the database' do
    #   trip = Trip.create!(driver_id: 'sample trip', passenger_id:'111-222-3333', 
    #   date: 'hdjsav', rating: 'fjadbv', cost: '2080')

    #   expect do
    #     delete trip_path(trip)
    #   end.must_change 'Trip.count', -1

    #   must_respond_with :redirect
    #   must_redirect_to trips_path

    #   after_trip = Trip.find_by(id: trip.id)
    #   expect(after_trip).must_be_nil
    # end

    # it 'returns a 404 if the trip does not exist' do
    #   trip_id = 123_456

    #   expect(Trip.find_by(id: trip_id)).must_be_nil

    #   expect do
    #     delete trip_path(trip_id)
    #   end.wont_change 'Trip.count'

    #   must_respond_with :not_found
    # end
  # end
end
