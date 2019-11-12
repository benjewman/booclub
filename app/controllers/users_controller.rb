class UsersController < ApplicationController 
    def show
        find_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            flash[:notice] = "Wrong Input! Try Again!"
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
