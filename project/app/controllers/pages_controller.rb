class PagesController < ApplicationController
  respond_to :js, :json, :html

  def home

  end

  def about

  end

  def map
    @places = Place.all
    if params[:id]==nil
      @curr = Place.first.id
    else
      @curr = Place.find(params[:id]).id
    end
    @geostats = Geokit::Geocoders::GoogleGeocoder.geocode Place.find(@curr).full_address
  end

  def profile

  end


end
