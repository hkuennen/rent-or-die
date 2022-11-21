class SurvivalistsController < ApplicationController
  def index
    @survivalists = Survivalist.all
  end

  def new
    @survivalist = Survivalist.new
  end

  def create
    @survivalist = Survivalist.new(survivalist_params)
    if @survivalist.save
      redirect_to list_path(@survivalist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:survivalist).permit(:name)
  end

end
