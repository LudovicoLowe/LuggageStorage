class PagesController < ApplicationController
  respond_to :js, :json, :html
  before_action :set_current_place


  def home

  end

  def about

  end

  def map
    @places = Place.all
  end

  def profile

  end

  private
    def set_current_place
      @curr = 7
    end


end
