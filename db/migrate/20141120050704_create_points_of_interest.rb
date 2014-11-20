class CreatePointsOfInterest < ActiveRecord::Migration
  def change
    create_table :points_of_interest do |t|
      t.string :name, null:false
      t.integer :location_id

      t.timestamps
    end
    add_index :points_of_interest, :name
    add_index :points_of_interest, :location_id
  end
end
