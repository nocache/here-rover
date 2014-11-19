class CreateRovers < ActiveRecord::Migration
  def change
    create_table :rovers do |t|
      t.integer :vehicle_id
      t.references :locations
      t.timestamps
    end

    add_index :rovers, :vehicle_id
  end
end
