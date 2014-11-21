class Rover < ActiveRecord::Base
  has_many :locations
  has_many :actual_locations, -> { Location.actual }, class_name:'Location'

  def latest_location(type='LunarLocation')
    if actual_locations.empty?
      locations.build(type:type).refresh!
    else
      actual_locations.order(:updated_at).last
    end
  end

  def self.vehicle(vid)
    if vid == 'all'
      all
    else
      find_by(vehicle_id:vid)
    end
  end
end
