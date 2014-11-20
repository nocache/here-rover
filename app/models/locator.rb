require 'faraday'

module Locator
  def refresh!
    unless rover && rover.vehicle_id
      raise 'No rover found'
    else
      response = Faraday.get locator_url
      location_data = MultiJson.load(response.body)
      update(location_data.slice(*self.class.column_names)) unless location_data.empty?
    end
    self
  end
end
