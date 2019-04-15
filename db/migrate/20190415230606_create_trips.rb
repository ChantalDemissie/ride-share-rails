class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :id
      t.string :integer,
      t.string :driver_id
      t.string :integer,
      t.string :passenger_id
      t.string :integer,
      t.string :date
      t.string :date,
      t.integer, :rating
      t.float, :cost

      t.timestamps
    end
  end
end
