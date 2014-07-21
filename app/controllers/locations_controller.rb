require 'open-uri'
require 'json'

class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location
    else
      render :new
    end
  end

  private

    def location_params
      params.require(:location).permit(:street_adress, :city, :state, :zip)
    end
end
