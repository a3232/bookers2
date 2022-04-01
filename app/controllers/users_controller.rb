class UsersController < ApplicationController

before_action :correct_user, only: [:edit :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @user = User.all
    @books = User.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
      redirect_to book_path(current_user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(books_path) unless @user == current_user
  end

end
