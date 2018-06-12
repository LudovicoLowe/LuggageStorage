class PagesController < ApplicationController
  respond_to :js, :json, :html

  def home

  end

  def about

  end

  def map
    @places = Place.all
    if params[:id]==nil
      @curr = "nope"
    else
      if Place.find(params[:id])
        @curr = Place.find(params[:id]).id
      else
        redirect_to(map_path)
      end
    end
    if @curr != "nope"
      @geostats = Geokit::Geocoders::GoogleGeocoder.geocode Place.find(@curr).full_address
    else
      @geostats = "nope"
    end
  end

  def profile

  end


end
