class Admin::UsersController < ApplicationController
    
    before_action :require_admin
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def edit
    end

    def update
    end

    def destroy
        @user.destroy
        redirect_to admin_users_path
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def require_admin
        unless current_user.admin?
            redirect_to root_path
        end
    end
end
