class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]
  def home
  end

  def index
    @meetings = Meeting.all
    @survivalists = Survivalist.all
  end

  def show
    @meetings = Meeting.find(params[:id])
    @meetings.user_id = current_user.id
    @survivalist = Survivalist.find(params[:id])
    @meetings = policy_scope(Meeting)
  end
end
