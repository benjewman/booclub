class CommentsController < ApplicationController

    def create
        @book = Book.find(params[:book_id])
        @comment = Comment.create(comment_params)
        @comment.user_id = session[:user_id]
        if @comment.save
            redirect_to book_path(@book)
        else
            flash[:notice] = "Post Failed: #{@comment.errors.full_messages[0]}"
            redirect_to book_path(@book)
        end
    end

    def destroy
        find_comment
        @book = @comment.book
        @comment.delete
        redirect_to book_path(@book)
    end

    private
    
    def comment_params
        params.require(:comment).permit(:content, :summary_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end