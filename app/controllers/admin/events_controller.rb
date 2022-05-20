class Admin::EventsController < ApplicationController
    before_action :require_admin
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
        @events = Event.all
    end

    def edit
    end

    def show
    end

    def update
    end

    def destroy
        @event.destroy
        redirect_to admin_events_path
    end

    def set_event
        @event = Event.find(params[:id])
    end

    def require_admin
        unless current_user.admin?
            redirect_to root_path
        end
    end
end