class PagesController < ApplicationController
  respond_to :js, :json, :html

  def home

  end

  def about

  end

  def map
    @places = Place.all

  end

  def profile

  end


end
