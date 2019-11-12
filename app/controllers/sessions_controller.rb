class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
            flash[:notice] = "Wrong password or username! Try Again!"
            puts flash[:notice]
            redirect_to login_path
        end
    end
    
    def delete
        session[:user_id] = nil
        redirect_to login_path
    end
end
