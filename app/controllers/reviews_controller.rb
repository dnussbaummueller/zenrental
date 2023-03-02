class ReviewsController < ApplicationController
  before_action :set_yoga_studio, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.yoga_studio = @yoga_studio
    if @review.save
      redirect_to yoga_studio_path(@yoga_studio), status: :see_other, notice: "Review successfully created."
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to yoga_studio_path(@review.yoga_studio), status: :see_other
  end

  private

  def set_yoga_studio
    @yoga_studio = YogaStudio.find(params[:yoga_studio_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
