class AuthorsController < ApplicationController

    def index
        if params[:last_name]
            @authors = Author.where('last_name LIKE ?', "%#{params[:last_name]}%")
          else
            @authors = Author.all
        end
    end

    def new
        @author = Author.new
        @author.books.build
        # @book = Book.new
    end

    def create
        # raise params.inspect
        @author = Author.new(author_params)
        @book = @author.books.first
        if @author.save
            redirect_to book_path(@book)
        else
            redirect_to authors_path
        end
    end
    
    def show
        find_author
        @books = @author.books
    end


    private
        def find_author
            @author = Author.find(params[:id])
        end

        def author_params
            params.require(:author).permit(:first_name, :last_name, books_attributes: [:title, :publish_date, :pic_url])
        end

end
