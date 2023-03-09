class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birth_date
      t.string :passport_id
      t.string :citizenship

      t.timestamps
    end
  end
end
