class MeetingsController < ApplicationController
  before_action :set_user
  before_action :set_survivalist, only: [:index, :new, :create]
  before_action :set_meeting, only: [:destroy]

  def index
    @meetings = Meeting.all
  end

  def show
    @meetings = Meeting.find(params[:id])
    @meetings.user_id = current_user.id
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = @user
    @meeting.survivalist = @survivalist
    if @meeting.save
      redirect_to survivalist_meeting_path(@meeting.survivalist_id, @meeting.id), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @meeting.destroy
    redirect_to survivalists_path, status: :see_other
  end

  private

  def meeting_params
    params.require(:meeting).permit(:user_id, :survivalist_id, :start_date, :end_date)
  end

  def set_user
    @user = current_user
  end

  def set_survivalist
    @survivalist = Survivalist.find(params[:survivalist_id])
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

end
