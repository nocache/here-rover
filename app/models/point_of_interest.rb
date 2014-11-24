class PointOfInterest < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :name
  validates_uniqueness_of :name

  # provide same interface as rover here:
  alias_method :latest_location, :location
end
