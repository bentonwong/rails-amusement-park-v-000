class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
    @admin_status = User.find_by(id: session[:user_id]).admin
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      redirect_to attraction_path(attraction)
    else
      redirect_to attractions_path
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

    def set_attraction
      @attraction = Attraction.find_by(id: params[:id])
    end
end
