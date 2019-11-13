class CommentsController < ApplicationController

    def create
        puts "WE GOT TO COMMENTS#CREATE"
        @book = Book.find(params[:book_id])
        @comment = Comment.create(comment_params)
        @comment.user_id = session[:user_id]
        if @comment.save
            redirect_to book_path(@book)
        else
            # change line below to add flash and send show
            redirect_to books_path
        end
    end

    private
    
    def comment_params
        params.require(:comment).permit(:content, :summary_id)
    end
end