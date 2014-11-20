class ModifyLocations < ActiveRecord::Migration
  def change
    rename_column :locations, :body, :type
    change_column_default :locations, :type, 'LunarLocation'
    remove_index :locations, [:latitude, :longitude]
    rename_column :locations, :latitude, :lat
    rename_column :locations, :longitude, :long
    add_index :locations, [:lat, :long]
  end
end
