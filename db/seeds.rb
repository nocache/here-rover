
Rover.delete_all if Rails.env.test?

# there should be six rovers, the vehicle_id is defined by the
# external locator system, so can't be the primary key
(0..5).each do |vid|
  Rover.find_or_create_by(vehicle_id:vid)
end


apollo11site = LunarLocation.find_or_create_by(lat:0.681400, long: 23.460550)

['CND Command Centre','Apollo 11 Landing Site'].each do |name|
  PointOfInterest.find_or_create_by(name:name) do |poi|
    poi.location = apollo11site
    poi.save
  end
end
