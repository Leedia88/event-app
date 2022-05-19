class AvatarsController < ApplicationController

    def create
        current_user.avatar.attach(params[:avatar])
        redirect_to(myprofile_path)
    end
end
