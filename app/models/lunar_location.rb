class LunarLocation < Location
  RADIUS = 1737.4.freeze  # assume this is the radius of the Moon in km

  def distance_to(other)
    # using Spherical Law of Cosines formula to calculate 'great circle' distance
    # http://www.movable-type.co.uk/scripts/latlong.html
    # assumes a spherical moon
    # result in is metres
    lat1_r = to_rad(self.lat)
    lat2_r = to_rad(other.lat)
    delta = to_rad(other.lon - self.lon)
    Math.acos(
      Math.sin(lat1_r) * Math.sin(lat2_r) +
      Math.cos(lat1_r) * Math.cos(lat2_r) * Math.cos(delta)
    ) * RADIUS
  end

  def to_rad(f)
    f / 180 * Math::PI
  end
end
