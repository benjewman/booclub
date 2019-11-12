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
            flash[:notice] = @user.errors.full_messages
            redirect_to new_user_path
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

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
