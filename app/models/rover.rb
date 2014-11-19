class Rover < ActiveRecord::Base
  has_one :location

  def get_location
  end
end
