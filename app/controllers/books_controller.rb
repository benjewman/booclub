class BooksController < ApplicationController
    def index
        @books = Book.alphabetize_by_author
    end

    def new
        @book = Book.new
    end

    def create

    end

    def show
        find_book
        @author = @book.author
        @summaries = @book.summaries
    end


    private
        def find_book
            @book = Book.find(params[:id])
        end

        def book_params
            params.require(:book).permit(:title, :publish_date, :author_id)
        end
end
