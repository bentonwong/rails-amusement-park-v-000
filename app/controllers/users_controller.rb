class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_session_path
    end
  end

  def show
    if session[:user_id] != params[:id].to_i
      redirect_to root_path
    else
      @user = User.find_by(id: params[:id])
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end
end
