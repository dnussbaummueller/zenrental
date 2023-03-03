class YogaStudiosController < ApplicationController
  before_action :set_yoga_studio, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search][:query].present?
      @yoga_studios = YogaStudio.search_by_name_and_description(params[:search][:query])
    # The `geocoded` scope filters studios with coordinates
    else
      @yoga_studios = YogaStudio.all
    end
    @markers = @yoga_studios.geocoded.map do |yoga_studio|
      {
        lat: yoga_studio.latitude,
        lng: yoga_studio.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {yoga_studio: yoga_studio})
      }
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @yoga_studio = YogaStudio.new
  end

  def create
    @yoga_studio = YogaStudio.new(yoga_studio_params)
    @yoga_studio.user = current_user
    if @yoga_studio.save
      redirect_to yoga_studio_path(@yoga_studio)
    else
      render :new
    end
  end

  def edit; end

  def update
    @yoga_studio.update(yoga_studio_params)
    redirect_to yoga_studio_path(@yoga_studio)
  end

  def destroy
    @yoga_studio.destroy
    redirect_to admin_path
  end

  def admin
    @yoga_studios = YogaStudio.where(user: current_user)
  end

  private

  def yoga_studio_params
    params.require(:yoga_studio).permit(:name, :address, :price_per_hour, :size_in_m2, :description, photos: [])
  end

  def set_yoga_studio
    @yoga_studio = YogaStudio.find(params[:id])
  end
end
