class AttendanceController < ApplicationController
  before_action :authenticate_user

  def create
    @event = Event.find(params[:event_id])
    Attendance.create(attendee: current_user, event: @event)
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event.get_attendance(current_user).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def authenticate_user
    unless user_signed_in?
      flash[:warning] = "Tu dois être connecté pour t'inscrire à un événement!"
      redirect_to root_path
    end
  end

end
