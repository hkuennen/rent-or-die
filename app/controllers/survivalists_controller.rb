class SurvivalistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @survivalists_all = Survivalist.all
    @markers = @survivalists_all.geocoded.map do |survivalist|
      {
        lat: survivalist.latitude,
        lng: survivalist.longitude,

        info_window: render_to_string(partial: "info_window", locals: {survivalist: survivalist}),
        image_url: helpers.asset_url("pointer.png")
      }
    end
    if params[:query].present?
      sql_query = "category ILIKE :query OR city ILIKE :query OR postcode ILIKE :query"
      @survivalists = Survivalist.where(sql_query, query: "%#{params[:query]}%")
      @survivalists = @survivalists.select do |survivalist|
        survivalist.user_id != current_user.id
      end
    else
      @survivalists = Survivalist.all
      @survivalists = @survivalists.select do |survivalist|
        survivalist.user_id != current_user.id
      end
    end
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
    @survivalist = Survivalist.find(params[:id])
  end

  private

  def survivalist_params
    params.require(:survivalist).permit(:name, :category, :skills, :street, :postcode, :city)
  end
end
