class CreateTrainTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :train_types do |t|
      t.string :name_train_type

      t.timestamps
    end
  end
end
