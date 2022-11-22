class SurvivalistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @survivalists = Survivalist.all
  end

  def new
    @survivalist = Survivalist.new
  end

  def create
    @survivalist = Survivalist.new(survivalist_params)
    @survivalist.user = current_user
    if @survivalist.save
      redirect_to survivalist_path(@survivalist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @restaurant = Survivalist.find(params[:id])
  end

  private

  def survivalist_params
    params.require(:survivalist).permit(:name, :category, :skills, :street, :postcode, :city)
  end

end
