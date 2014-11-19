class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :body, limit: 16, default: 'luna'
      t.timestamps
    end

    add_index :locations, :body
    add_index :locations, [:latitude, :longitude]
  end
end
