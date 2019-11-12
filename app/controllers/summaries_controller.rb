class SummariesController < ApplicationController

    def create
        # raise params.inspect
        @book = Book.find(params[:book_id])
        @summary = @book.summaries.build(summary_params)
        # @summary.book = @book
        if @summary.save
            puts "AnyTHING"
            redirect_to book_path(@book)
        else
            redirect_to books_path
        end
        # if @summary.save
        #     redirect_to book_path(@book)
        # else
        #     flash[:notice] = "Unable to Create Summary"
        #     redirect_to books_path
        # end
    end

    private
        def summary_params
            params.require(:summary).permit(:title, :content, :user_id)
        end

        # def book_id_params
        #     params[:book_id]
        # end 
end