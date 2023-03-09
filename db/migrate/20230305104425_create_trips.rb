class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.integer :number_trip, null: false
      t.string :arrival_time
      t.string :departure_time
      t.references :service_type, null: false, foreign_key: true
      t.references :train_type, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
