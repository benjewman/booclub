class SummariesController < ApplicationController

    def create
        @summary = Summary.new(summary_params)

        if @summary.save
            redirect_to book_path(@summary.book)
        else
            redirect_to books_path
        end
    end

    private
        def summary_params
            params.require(:summary).permit(:title, :content, :user_id, :book_id)
        end

end