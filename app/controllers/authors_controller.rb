class AuthorsController < ApplicationController
  respond_to :html
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
    respond_with(@authors)
  end

  def show
    respond_with(@author)
  end

  def new
    @author = Author.new
    respond_with(@author)
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    @author.save
    respond_with(@author)
  end

  def update
    @author.update(author_params)
    respond_with(@author)
  end

  def destroy
    @author.destroy
    respond_with(@author)
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :date_of_birth, :number_of_books)
    end
end
