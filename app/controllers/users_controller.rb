class UsersController < ApplicationController
  
  def show
    @events_attended = current_user.get_events_attended
    @events_admin = current_user.get_events_admin
  end
end
