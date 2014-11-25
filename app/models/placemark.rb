require 'forwardable'

class Placemark
  extend Forwardable

  attr_accessor :place
  def_delegator :@place, :vehicle_id, :id

  def initialize(place = nil, command_centre_poi = nil)
    @place = place
    @command_centre_poi = command_centre_poi
  end

  def self.build_list(places = [], command_centre_poi = nil)
    Array(places).collect do |place|
      new(place, command_centre_poi)
    end
  end

  def coords
    lat, long = 0.0, 0.0
    if @place.respond_to? :latest_location
      lat = @place.latest_location.try :lat
      long = @place.latest_location.try :long
    end
    "#{long},#{lat}"
  end

  def name
   "#{@place.class.name} #{self.id}"
  end
end

