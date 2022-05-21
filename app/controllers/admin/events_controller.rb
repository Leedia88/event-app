    class Admin::EventsController < ApplicationController
    before_action :require_admin
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
        @validated = Event.where(validated:true)
        @refused = Event.where(validated:false)
    end

    def edit
    end

    def update
        @event.update(event_params)
        redirect_to admin_events_path
    end

    def destroy
        @event.destroy
        redirect_to admin_events_path
    end

    private 
    
    def set_event
        @event = Event.find(params[:id])
    end

    def require_admin
        unless current_user.admin?
            redirect_to root_path
        end
    end

    def event_params
        params.require(:event).permit(:title, :description, :validated, :start_date, :location, :price)
    end

    end