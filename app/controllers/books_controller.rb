class BooksController < ApplicationController
  helper_method :sort_column, :sort_direction
  respond_to :html
  
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    #@books = Book.order(title: :asc )
    @books = Book.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    #respond_with(@books)
    respond_to do |format|
      format.html 
      format.js
    end
  end

  def show
    respond_with(@book)
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.save
    respond_with(@book)
  end

  def update
#    raise book_params.to_yaml
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, 
                                   #:author,                    
                                   :editorial_id, 
                                   :original_title, 
                                   :translation, 
                                   :edition, 
                                   :edition_date, 
                                   :edition_place, 
                                   :publication_year, 
                                   :isbn,
                                   :picture,
                                   :author_ids =>[])
    end
    def sort_column
      Book.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
