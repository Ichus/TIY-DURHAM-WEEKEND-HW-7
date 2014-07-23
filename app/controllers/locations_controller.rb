require 'open-uri'
require 'json'

class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @reps = request_representatives(@location.latitude, @location.longitude)
    if @location.latitude.nil?
      redirect_to root_path
      flash[:notice] = 'Invalid Address. If abbreviating leave off the period. Ex. "St" instead of "St."'
    end
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

    def request_representatives(lat, long)
      reps = retrieve_reps(lat, long)
      reps.map do |rep|
        rep["title"] == "Sen" ? rep["title"] = "Senator" : rep["title"] = "House Representative"
        rep["party"] == "R" ? rep["party"] = "Republican" : rep["party"] = "Democrat"
      end
      reps
    end

    def retrieve_reps(lat, long)
      @results = []
      open("https://congress.api.sunlightfoundation.com/legislators/locate?apikey=#{Rails.application.secrets.sunlight_api_key}&latitude=#{lat}&longitude=#{long}&fields=first_name,last_name,title,oc_email,party") do |reps|
        reps.each_line do |rep|
          representative_hash = JSON.parse rep
          @results = representative_hash["results"] if representative_hash["results"]
        end
      end
      @results
    end

    def location_params
      params.require(:location).permit(:street_adress, :city, :state, :zip)
    end
end
