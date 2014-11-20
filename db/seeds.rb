# there should be six rovers, the vehicle_id is defined by the
# external locator system, so can't be the primary key
Rover.delete_all if Rails.env.test?
(1..6).each do |vid|
  Rover.find_or_create_by(vehicle_id:vid)
end
