class SummariesController < ApplicationController

    def create
        @book = Book.find(params[:book_id])
        @summary = @book.summaries.build(summary_params)
        @summary.user_id = session[:user_id]

        if @summary.save
            redirect_to book_path(@book)
        else
            flash[:notice] = "Post Failed: #{@summary.errors.full_messages[0]}"
            redirect_to book_path(@book)
        end
    end

    def edit
        find_summary
    end

    def update
        find_summary
        @summary.update(summary_params)
        if @summary.save
            redirect_to book_path(@summary.book)
        else
            flash[:notice] = "Update Failed: #{@summary.errors.full_messages[0]}"
            redirect_to book_path(@summary.book)
        end
    end

    def destroy
        find_summary
        @book = @summary.book
        @summary.delete
        redirect_to book_path(@book)
    end

    private
        def summary_params
            params.require(:summary).permit(:title, :content)
        end

        def find_summary
            p params 
            p "******************************************************"
            @summary = Summary.find(params[:id])
        end

end