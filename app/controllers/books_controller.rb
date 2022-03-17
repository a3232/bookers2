class BooksController < ApplicationController

  def new
    
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @books = Book.all
  end
  
  def index
    @books = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
    @users = User.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  
  def edit
    @book = User.find(params[:id])
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end