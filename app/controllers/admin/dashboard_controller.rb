class Admin::DashboardController < ApplicationController
    before_action :require_admin

    def index 
        @pendings = Event.pending_list
        @users = User.all
    end

    def accept
        @event = Event.find(params[:id])
        @event.update_attribute(:validated,true)
        redirect_to admin_path
    end

    def refuse
        @event.update_attribute(:validated,false)
        redirect_to admin_path
    end

    def require_admin
        unless current_user.admin?
            redirect_to root_path
        end
    end
end
