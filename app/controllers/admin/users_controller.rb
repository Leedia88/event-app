class Admin::UsersController < ApplicationController
    before_action :require_admin
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def new
    end

    def edit
    end

    def update
    end

    def show
    end

    def destroy
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