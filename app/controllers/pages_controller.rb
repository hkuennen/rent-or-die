class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]
  def home
  end

  def index
    @meetings = Meeting.all
    @survivalists = Survivalist.all
    @meetings = policy_scope(Meeting)
  end

  def show
    @meeting = Meeting.find(params[:id])
    @meeting.user_id = current_user.id
    @survivalist = Survivalist.find(params[:id])
    @meeting = policy_scope(Meeting)
  end
end
