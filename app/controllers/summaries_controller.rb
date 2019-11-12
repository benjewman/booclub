class SummariesController < ApplicationController

    def create
        @book = Book.find(params[:book_id])
        @summary = @book.summaries.build(summary_params)

        if @summary.save
            redirect_to book_path(@book)
        else
            flash[:notice] = "Summary couldn't save"
            redirect_to book_path(@book)
        end
    end

    private
        def summary_params
            params.require(:summary).permit(:title, :content, :user_id)
        end

end