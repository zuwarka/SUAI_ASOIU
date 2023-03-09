class AddUniqueIndexForTrips < ActiveRecord::Migration[7.0]
  def change
    add_index :trips, :number_trip, unique: true
  end
end
