class AddReferencesToUserPassenger < ActiveRecord::Migration[7.0]
  def change
    change_table :passengers do |t|
      t.references :user, null: false, foreign_key: true, default: 1
    end
  end
end
