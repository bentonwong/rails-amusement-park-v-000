class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]
  before_action :set_user, only: [:index, :show]

  def index
    @attractions = Attraction.all
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

    def set_user
      @user = User.find_by(id: session[:user_id])
    end
end
