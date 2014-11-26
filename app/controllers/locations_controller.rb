class LocationsController < ApplicationController
  layout false, :only => :show
  respond_to :html, :kml

  def index

  end

  def show
    rovers = Rover.vehicle(vehicle_id_params)
    @placemarks = Placemark.build_list(rovers, command_centre_poi)

    @cmd_centre = Placemark.new(command_centre_poi)
  end

  private

  def command_centre_poi
    @cc_poi ||= PointOfInterest.find_by(name:'CND Command Centre')
  end

  def vehicle_id_params
    params[:vehicle_id]
  end
end
