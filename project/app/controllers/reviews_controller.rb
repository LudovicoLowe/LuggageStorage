class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @place = Place.find(params[:place_id])
    @review = Review.new(place: @place)
  end

  def create
    @place = Place.find(params[:place_id])
    @review = current_user.reviews.build(review_params)
    @review.place = @place
    @review.save
    redirect_to @place
  end

  private
    def review_params
      params.require(:review).permit(:comment, :rating)
    end
end