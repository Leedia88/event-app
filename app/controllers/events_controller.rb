class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  before_action :set_event, only: [:show, :edit, :update]
  
  def index
    @events = Event.all.order(:start_date)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def show
    @attendees = Attendance.find_by(event_id: @event.id)
    if @attendees
      @ids = Attendance.find_by(event_id: @event.id).pluck(:attendee_id)
    end
  end

  def edit 
  end

  def update
  end

  private
  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin_id)
  end

  def authenticate_user
    unless user_signed_in?
      flash[:warning] = "Tu dois être connecté pour créer un événement!"
      redirect_to root_path
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
