class UsersController < ApplicationController
    before_action :authorize!, only: [:index, :show, :edit, :update]

    def show
        if id_matches_current_user?(params[:id])
            find_user
            render :show
          else
            flash[:notice] = "You must be logged in to proceed!"
            redirect_to user_path(session[:user_id])
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = @user.errors.full_messages
            redirect_to signup_path
        end
    end

    def edit
        find_user
    end

    def update
        find_user
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:notice] = @user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    def destroy
        find_user.destroy
        redirect_to login_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
