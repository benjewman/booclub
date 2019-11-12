class BooksController < ApplicationController
    def index
        @books = Book.alphabetize_by_author
    end

    def new
        @book = Book.new
        @authors = Author.all
    end

    def create
        @book = Book.new(book_params)
        if @book.author == nil
            redirect_to new_author_path
        elsif @book.save
            redirect_to book_path(@book)
        else
            # change the code below
            redirect_to books_path
        end
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
