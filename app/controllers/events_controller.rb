class EventsController < ApplicationController
  def index
    @events = Event.all
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
    @event = Event.find(params[:id])
    @attendees = Attendance.find_by(event_id: @event.id)
    if @attendees
      @ids = Attendance.find_by(event_id: @event.id).pluck(:attendee_id)
    end
  end

  private
  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin_id)
  end

end
