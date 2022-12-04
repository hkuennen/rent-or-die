class SurvivalistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    if params[:query].present?
      if current_user
        sql_query = "(category ILIKE :query OR city ILIKE :query OR postcode ILIKE :query) AND user_id != :usr"
        @survivalists = Survivalist.where(sql_query, query: "%#{params[:query]}%", usr: current_user.id.to_s)
      else
        sql_query = "(category ILIKE :query OR city ILIKE :query OR postcode ILIKE :query)"
        @survivalists = Survivalist.where(sql_query, query: "%#{params[:query]}%")
      end
    else
      if current_user
        @survivalists = Survivalist.all
        sql_query = "user_id != :usr"
        @survivalists = Survivalist.where(sql_query, usr: current_user.id.to_s)
      else
        @survivalists = Survivalist.all
      end
    end
    @survivalists_all = @survivalists
    @markers = @survivalists_all.geocoded.map do |survivalist|
      {
        lat: survivalist.latitude,
        lng: survivalist.longitude,

        info_window: render_to_string(partial: "info_window", locals: {survivalist: survivalist}),
        image_url: helpers.asset_url("pointer.png")
      }
    end
  end

  def new
    @survivalist = Survivalist.new
  end

  def create
    @survivalist = Survivalist.new(survivalist_params)
    @survivalist.user = current_user
    @survivalist.address = "#{@survivalist.street}, #{@survivalist.postcode} #{@survivalist.city}"
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
