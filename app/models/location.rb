class Location < ActiveRecord::Base
  belongs_to :rover
  include Locator

  private

  def locator_url
    @locator_url ||= Settings.locator.vehicle.gsub(/\{\{.+\}\}/, rover.vehicle_id.to_s)
  end
end
