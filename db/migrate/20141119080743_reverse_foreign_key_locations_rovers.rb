class ReverseForeignKeyLocationsRovers < ActiveRecord::Migration
  def change
    announce 'this is a destructive migration'
    raise 'can not run unless locations and rovers are empty!' unless Location.count == 0 and Rover.count == 0

    add_column    :locations, :rover_id, :integer
    add_index     :locations, [:rover_id, :updated_at]
    remove_column :rovers, :locations_id
  end
end
