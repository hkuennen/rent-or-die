class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]
  def home
  end

  def index
    @meetings = Meeting.all
    @survivalists = Survivalist.all
    @meetings = policy_scope(Meeting)
  end
end
