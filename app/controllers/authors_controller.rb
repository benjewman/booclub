class AuthorsController < ApplicationController

    def index
        if params[:first_name]
            @authors = Author.where('first_name LIKE ?', "%#{params[:first_name]}%")
          else
            @authors = Author.all
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
            params.require(:author).permit(:first_name, :last_name)
        end

end
