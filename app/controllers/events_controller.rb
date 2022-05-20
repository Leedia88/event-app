class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :check_validation, only: [:show]
  
  def index
    @events = Event.where(validated:true).order(:start_date)
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
    if Attendance.where(event_id: @event.id).exists?
      @attendees = Attendance.where(event_id: @event.id).pluck(:attendee_id)
    end
  end

  def search
  end

  def edit  
  end

  def update
      if @event.update(event_params)
        flash[:success] = "Evénement mis à jour"
        redirect_to event_path(@event)
      else
        render :edit
      end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin_id)
  end


  def set_event
    @event = Event.find(params[:id])
  end

  def check_validation
    unless @event.validated || current_user.is_admin?(@event)
        redirect_to events_path
    end
  end

end
