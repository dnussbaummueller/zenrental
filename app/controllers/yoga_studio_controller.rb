class YogaStudioController < ApplicationController
  before_action :set_yoga_studio, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @yoga_studios = YogaStudio.all
  end

  def show; end

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
    redirect_to yoga_studios_path
  end

  private

  def yoga_studio_params
    params.require(:yoga_studio).permit(:name, :address, :description, :photo)
  end

  def set_yoga_studio
    @yoga_studio = YogaStudio.find(params[:id])
  end
end
