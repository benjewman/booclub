module ApplicationHelper

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end
   
    def authorize!
        if !logged_in?
            flash[:notice] = "Sorry, you must be logged in to proceed!" 
            redirect_to login_path
        end
    end

    def id_matches_current_user?(id)
        id.to_i == current_user.id
    end
end
