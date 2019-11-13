class SummariesController < ApplicationController

    def create
        @book = Book.find(params[:book_id])
        @summary = @book.summaries.build(summary_params)
        @summary.user_id = session[:user_id]

        if @summary.save
            redirect_to book_path(@book)
        else
            flash[:notice] = @summary.errors.full_messages[0]
            redirect_to book_path(@book)
        end
    end

    private
        def summary_params
            params.require(:summary).permit(:title, :content)
        end

end