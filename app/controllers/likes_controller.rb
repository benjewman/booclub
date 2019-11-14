class LikesController < ApplicationController
    def create
        @summary = Summary.find(params[:summary_id])
        @like = @summary.likes.build
        @like.user = current_user
        if @like.save
            redirect_to book_path(@summary.book)
        else
            flash[:notice] = "Unable to Like"
            redirect_to book_path(@summary.book)
        end
    end

    private
    def like_params
        params.require(:like).permit(:summary_id)
    end
end
