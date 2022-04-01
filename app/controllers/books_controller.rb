class BooksController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @users = User.all
    @user = @book.user
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
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end