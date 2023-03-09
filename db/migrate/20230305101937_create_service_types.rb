class CreateServiceTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :service_types do |t|
      t.string :name_service_type

      t.timestamps
    end
  end
end
