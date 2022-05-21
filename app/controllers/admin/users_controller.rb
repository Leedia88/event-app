class Admin::UsersController < ApplicationController
    
    before_action :require_admin
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new        
    end

    def edit
        puts "je suis dans edit"
    end

    def update
        puts "je suis dans la fonction update"
        if @user.update(user_params)
            redirect_to admin_users_path
        else
            puts "raikeje n'ai pas réussi à sauvegarder"
            render :edit
        end
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

    def user_params
        params.require(:user).permit(:first_name, :last_name, :admin, :description)
    end

end
