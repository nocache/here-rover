class Rover < ActiveRecord::Base
  has_many :locations

  def latest_location(type='LunarLocation')
    if locations.empty?
      locations.build(type:type).refresh!
    else
      self.locations.order(:updated_at).last
    end
  end

  def self.vehicle(vid)
    find_by(vehicle_id:vid)
  end
end
