class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
    
  def show
    @user = User.find(params[:id])
    @books = User.all
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
    redirect_to books_path
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
