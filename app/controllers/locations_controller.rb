class LocationsController < ApplicationController
  def index

  end

  def show
    rovers = Rover.vehicle(vehicle_id_params)
    @placemarks = Placemark.build_list(rovers)

    @cmd_centre = Placemark.new(PointOfInterest.find_by(name:'CND Command Centre'))
  end

  private

  def vehicle_id_params
    params[:vehicle_id]
  end
end
