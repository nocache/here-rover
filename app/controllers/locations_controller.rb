class LocationsController < ApplicationController
  def index

  end

  def show
    rovers = Rover.vehicle(vehicle_id_params) || Rover.all
    @placemarks = Placemark.build_list(rovers)
  end

  private

  def vehicle_id_params
    params[:vehicle_id]
  end
end
