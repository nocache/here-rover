class Location < ActiveRecord::Base
  belongs_to :rover
  include Locator

  scope :actual, ->{ where('lat IS NOT NULL AND long IS NOT NULL') }

  private

  def locator_url
    @locator_url ||= Settings.locator.vehicle.gsub(/\{\{.+\}\}/, rover.vehicle_id.to_s)
  end
end
